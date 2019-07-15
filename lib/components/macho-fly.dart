import 'package:flame/sprite.dart';
import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/hit-game.dart';
import 'dart:ui';

class MachoFly extends Fly {
  double get speed => game.tileSize * 2.5;
  
  MachoFly(HitGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}
