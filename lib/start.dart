import 'package:flutter/material.dart';

final jumpArray = [];

Future<void> loadImages(BuildContext context) async {
  final assetBundle = DefaultAssetBundle.of(context);

  for (var i = 1; i < 13; i++) {
    String imageName = 'assets/dino/Jump_$i.png';
    var image = await assetBundle.load(imageName);
    jumpArray.add(image);
  }

  return Future.value(null);
}
