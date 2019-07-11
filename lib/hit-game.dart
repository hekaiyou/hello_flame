import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:hello_flame/components/fly.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

import 'package:hello_flame/components/backyard.dart';

class HitGame extends Game {
  Size screenSize;
  double tileSize;
  Backyard background;
  List<Fly> enemy;
  Random rnd;

  HitGame() {
    initialize();
  }

  void initialize() async {
    enemy = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    produceFly();
  }

  void produceFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    enemy.add(Fly(this, x, y));
  }

  void render(Canvas canvas) {
    background.render(canvas);

    enemy.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    enemy.forEach((Fly fly) => fly.update(t));
    enemy.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    enemy.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
