import 'dart:ui';
import 'dart:math';
import 'package:flutter/gestures.dart';

import 'package:flame/game.dart';
import 'package:flame/flame.dart';

import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/components/backyard.dart';
import 'package:hello_flame/components/mosquito-fly.dart';
import 'package:hello_flame/components/agile-fly.dart';
import 'package:hello_flame/components/drooler-fly.dart';
import 'package:hello_flame/components/hungry-fly.dart';
import 'package:hello_flame/components/macho-fly.dart';
import 'package:hello_flame/view.dart';
import 'package:hello_flame/views/home-view.dart';
import 'package:hello_flame/components/start-button.dart';

class HitGame extends Game {
  Size screenSize;
  double tileSize;
  Backyard background;
  List<Fly> enemy;
  Random rnd;
  View activeView = View.home;
  HomeView homeView;
  StartButton startButton;

  HitGame() {
    initialize();
  }

  void initialize() async {
    enemy = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    homeView = HomeView(this);
    startButton = StartButton(this);
    produceFly();
  }

  void produceFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (rnd.nextInt(5)) {
      case 0:
        enemy.add(MosquitoFly(this, x, y));
        break;
      case 1:
        enemy.add(DroolerFly(this, x, y));
        break;
      case 2:
        enemy.add(AgileFly(this, x, y));
        break;
      case 3:
        enemy.add(MachoFly(this, x, y));
        break;
      case 4:
        enemy.add(HungryFly(this, x, y));
        break;
    }
  }

  void render(Canvas canvas) {
    background.render(canvas);
    enemy.forEach((Fly fly) => fly.render(canvas));
    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
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
    bool isHandled = false;

    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    if (!isHandled) {
      enemy.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
        }
      });
    }
  }
}
