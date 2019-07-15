import 'package:flame/sprite.dart';
import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/hit-game.dart';
import 'dart:ui';

class HungryFly extends Fly {
  HungryFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}
