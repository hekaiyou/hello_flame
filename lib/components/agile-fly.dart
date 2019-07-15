import 'package:flame/sprite.dart';
import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/hit-game.dart';
import 'dart:ui';

class AgileFly extends Fly {
  double get speed => game.tileSize * 5;
  
  AgileFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}
