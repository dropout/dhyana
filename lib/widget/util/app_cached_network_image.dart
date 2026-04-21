import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/resource_resolver.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

/// The [AppCachedNetworkImage] widget is a custom implementation
/// of a cached network image that will first resolve an image URL
/// and uses that URL to display the image.
/// This is useful for flavored environments where the image URL may be
/// different based on the environment.
/// (e.g. Firebase Storage development, staging, production)
class AppCachedNetworkImage extends StatefulWidget {
  final String imagePath;
  final String blurHash;
  final ResourceResolver resourceResolver;
  final bool circular;

  const AppCachedNetworkImage({
    required this.imagePath,
    required this.blurHash,
    required this.resourceResolver,
    this.circular = false,
    super.key,
  });

  @override
  State<AppCachedNetworkImage> createState() => _AppCachedNetworkImageState();
}

class _AppCachedNetworkImageState extends State<AppCachedNetworkImage> {
  
  LoadingState loadingState = LoadingState.loading;
  String? currentImageUrl;

  @override
  void initState() {
    super.initState();
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant AppCachedNetworkImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imagePath != widget.imagePath) {
      setState(() {
        loadingState = LoadingState.loading;
        _resolveImage();
      });
    }
  }

  void _resolveImage() {
    context.services.resourceResolver
      .resolveStoragePath(widget.imagePath)
      .then((imageUrl) {
        if (mounted) {
          setState(() {
            loadingState = LoadingState.loaded;
            currentImageUrl = imageUrl;
          });
        }
      })
      .catchError((error) {
        if (mounted) {
          context.services.crashlyticsService.recordError(exception: error);
          setState(() {
            loadingState = LoadingState.error;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        buildPlaceHolder(context, widget.blurHash),
        if (loadingState == LoadingState.loaded && currentImageUrl != null)
          _CustomCachedNetworkImage(
            imageUrl: currentImageUrl!,
            crashlyticsService: context.services.crashlyticsService,
            circular: widget.circular,
          )
      ],
    );
  }

  Widget buildPlaceHolder(BuildContext context, String blurHash) {
    if (widget.circular) {
      return buildCircularImage(context, BlurHashImage(blurHash));
    } else {
      return SizedBox.expand(
        child: Image(fit: BoxFit.cover, image: BlurHashImage(blurHash)),
      );
    }
  }

  Widget buildError(BuildContext context, String blurHash) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(fit: .cover, image: BlurHashImage(blurHash)),
        const Center(child: Icon(Icons.broken_image)),
      ],
    );
  }
}

class _CustomCachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final CrashlyticsService crashlyticsService;
  final bool circular;

  const _CustomCachedNetworkImage({
    required this.imageUrl,
    required this.crashlyticsService,
    this.circular = false,
  });

  @override
  State<_CustomCachedNetworkImage> createState() =>
    _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<_CustomCachedNetworkImage> {
  late final CachedNetworkImageProvider imageProvider;
  late final ImageStreamListener imageStreamListener;
  bool isLoading = true;

  @override
  void initState() {
    isLoading = true;

    imageProvider = CachedNetworkImageProvider(
      widget.imageUrl,
      cacheManager: context.services.cacheManagerService.cacheManager,
      errorListener: (error) {
        widget.crashlyticsService.recordError(exception: error);
      },
    );

    imageStreamListener = ImageStreamListener((_, _) {
      // make sure the widget is mounted in case of frequent clicking
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });

    imageProvider
      .resolve(const ImageConfiguration())
      .addListener(imageStreamListener);

    // A _CACHED_ image will be resolved before the first
    // build call, so NO animation will be displayed in that case
    // Must force a 'loading state' first then a 'loaded state'
    // to properly trigger the opacity animation that 'transforms' from
    // blurhash to image
    Future.delayed(Duration.zero, () {
      if (mounted) {
        imageProvider
          .resolve(const ImageConfiguration())
          .addListener(imageStreamListener);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.circular) {
      return AnimatedOpacity(
        opacity: isLoading ? 0.0 : 1.0,
        duration: Durations.short4,
        child: buildCircularImage(context, imageProvider),
      );
    } else {
      return AnimatedOpacity(
        opacity: isLoading ? 0.0 : 1.0,
        duration: Durations.short4,
        child: Image(
          fit: BoxFit.cover,
          image: imageProvider,
          errorBuilder: (context, error, stackTrace) {
            context.recordError(error, stackTrace, 'Unable to display image');
            return const Center(child: Icon(Icons.broken_image_rounded));
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    imageProvider
      .resolve(const ImageConfiguration())
      .removeListener(imageStreamListener);
    super.dispose();
  }
}
