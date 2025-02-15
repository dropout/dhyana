import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:provider/provider.dart';
class AppCachedNetworkImage extends StatelessWidget {

  final Future<String> imageUrl;
  final String blurHash;

  const AppCachedNetworkImage({
    required this.imageUrl,
    required this.blurHash,
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
    return SizedBox.expand(
        child: Image(
          fit: BoxFit.cover,
          image: BlurHashImage(blurHash),
        )
    );
  }

  Widget buildCachedNetworkImage(BuildContext context, Future<String> imageUrl) {
    return FutureBuilder<String>(
        future: imageUrl,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            String imageUrl = snapshot.data!;
            CrashlyticsService crashlyticsService =
            Provider.of<CrashlyticsService>(context, listen: false);
            return _CustomCachedNetworkImage(
              imageUrl: imageUrl,
              crashlyticsService: crashlyticsService,
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

  const _CustomCachedNetworkImage({
    required this.imageUrl,
    required this.crashlyticsService,
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

    // A cached image will be resolved before the first
    // build call, so NO animation will be displayed in that case
    // Must force a 'loading state' first then a 'not loading'
    // to properly trigger the opacity animation
    Future.delayed(Duration.zero).whenComplete(() {
      imageProvider.resolve(const ImageConfiguration())
          .addListener(imageStreamListener);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: isLoading ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 512),
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

  @override
  void dispose() {
    super.dispose();
  }

}
