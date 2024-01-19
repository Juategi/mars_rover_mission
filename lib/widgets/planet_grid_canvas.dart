import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as UI;

class PlanetGridCanvas extends CustomPainter {
  final String obstacleImagePath = 'assets/images/obstacle.png';
  final String groundImagePath = 'assets/images/ground.png';
  final String roverImagePath = 'assets/images/rover.png';
  late UI.Image obstacleUiImage;
  late UI.Image groundUiImage;
  late UI.Image roverUiImage;

  final Paint paintt = new Paint()
    ..color = Colors.yellow
    ..strokeWidth = 2.0
    ..strokeCap = StrokeCap.butt
    ..style = PaintingStyle.stroke;

  Future<UI.Image> loadUiImage(String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<UI.Image> completer = Completer();
    UI.decodeImageFromList(Uint8List.view(data.buffer), (UI.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<void> loadUiImages() async {
    obstacleUiImage = await loadUiImage(obstacleImagePath);
    groundUiImage = await loadUiImage(groundImagePath);
    roverUiImage = await loadUiImage(roverImagePath);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(groundUiImage, size.center(Offset.zero), paintt);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
