import 'package:flame/sprite.dart';
import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/hit-game.dart';
import 'dart:ui';

class DroolerFly extends Fly {
  double get speed => game.tileSize * 1.5;
  
  DroolerFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}
