import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
class AppCachedNetworkImage extends StatelessWidget {

  final Future<String> imageUrl;
  final String blurHash;
  final bool circular;

  const AppCachedNetworkImage({
    required this.imageUrl,
    required this.blurHash,
    this.circular = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        buildPlaceHolder(context, blurHash),
        buildCachedNetworkImage(context, imageUrl),
      ],
    );
  }

  Widget buildPlaceHolder(BuildContext context, String blurHash) {
    if (circular) {
      return buildCircularImage(context, BlurHashImage(blurHash));
    } else {
      return SizedBox.expand(
        child: Image(
          fit: BoxFit.cover,
          image: BlurHashImage(blurHash),
        )
      );
    }

  }

  Widget buildCachedNetworkImage(BuildContext context, Future<String> imageUrl) {
    return FutureBuilder<String>(
        future: imageUrl,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            String imageUrl = snapshot.data!;
            return _CustomCachedNetworkImage(
              imageUrl: imageUrl,
              crashlyticsService: context.services.crashlyticsService,
              circular: circular,
            );
          } else if (snapshot.hasError) {
            return buildError(context, blurHash);
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }

  Widget buildError(BuildContext context, String blurHash) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          fit: BoxFit.cover,
          image: BlurHashImage(blurHash),
        ),
        const Center(
          child: Icon(Icons.broken_image),
        )
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
  State<_CustomCachedNetworkImage> createState() => _CustomCachedNetworkImageState();
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
        widget.crashlyticsService.recordError(exception: error,);
      }
    );

    imageStreamListener = ImageStreamListener((_, __) {
      // make sure the widget is mounted in case of frequent clicking
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });

    // A _CACHED_ image will be resolved before the first
    // build call, so NO animation will be displayed in that case
    // Must force a 'loading state' first then a 'loaded state'
    // to properly trigger the opacity animation that 'transforms' from
    // blurhash to image
    Future.delayed(Duration.zero, () {
      if (mounted) {
        imageProvider.resolve(const ImageConfiguration())
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
            return const Center(
              child: Icon(
                Icons.broken_image_rounded,
              )
            );
          },
        )
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}
