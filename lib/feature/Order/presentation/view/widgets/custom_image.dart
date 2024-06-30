import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/loading/image_loading.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        height: 110,
        width: 110,
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4aveLz3B15CyYLplxAP2FI3Hy87Lvkr2EmQ&usqp=CAU",
        placeholder: (context, url) => const ImageLoading(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
