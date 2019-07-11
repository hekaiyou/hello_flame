import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/util.dart';

import 'package:hello_flame/hit-game.dart';

import 'package:flutter/gestures.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  HitGame game = HitGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
