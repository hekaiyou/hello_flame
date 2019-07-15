import 'package:flame/sprite.dart';
import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/hit-game.dart';
import 'dart:ui';

class MosquitoFly extends Fly {
  MosquitoFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/mosquito-fly-1.png'));
    flyingSprite.add(Sprite('flies/mosquito-fly-2.png'));
    deadSprite = Sprite('flies/mosquito-fly-dead.png');
  }
}
