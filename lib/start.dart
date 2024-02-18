import 'package:flutter/material.dart';

final jumpArray = <Image>[];

Future<bool> loadImages(BuildContext context) async {
  final assetBundle = DefaultAssetBundle.of(context);

  for (var i = 1; i < 13; i++) {
    String imageName = 'assets/dino/Jump_$i.png';
    var dataByte = await assetBundle.load(imageName);
    Image image = Image.memory(dataByte.buffer.asUint8List());
    jumpArray.add(image);
  }

  return Future.value(true);
}
