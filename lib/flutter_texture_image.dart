library flutter_texture_image;

import 'dart:typed_data';
import 'dart:ui';

class FlutterTextureImage {

  static Future<Uint8List> getTextureAsPng(int textureId, int width, int height) async {
    final scene = SceneBuilder();
    scene.addTexture(textureId, width: width.toDouble(), height: height.toDouble(), freeze: true);
    final build = scene.build();
    final imagemCapturada = await build.toImage(width, height);
    final imageData = await imagemCapturada.toByteData(format: ImageByteFormat.png);
    final imageBytes = imageData!.buffer.asUint8List(imageData.offsetInBytes, imageData.buffer.lengthInBytes);
    return imageBytes;
  }
}

