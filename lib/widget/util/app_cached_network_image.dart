import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class AppCachedNetworkImage extends StatelessWidget {

  final Future<String> imageUrl;
  final String blurHash;

  const AppCachedNetworkImage({
    required this.imageUrl,
    required this.blurHash,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: imageUrl,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return CachedNetworkImage(
            imageUrl: snapshot.data!,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return buildPlaceHolder(context, blurHash);
            },
            errorWidget: (context, url, _) {
              return const SizedBox.expand(
                child: Center(
                  child: Icon(Icons.broken_image_rounded)
                )
              );
            },

            fadeOutDuration: const Duration(milliseconds: 128),
            fadeOutCurve: Curves.linear,

            fadeInDuration: const Duration(milliseconds: 128),
            fadeInCurve: Curves.linear,

          );
        } else if (snapshot.hasError) {
          return buildError(context, blurHash);
        } else {
          return buildPlaceHolder(context, blurHash);
        }
      }
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
