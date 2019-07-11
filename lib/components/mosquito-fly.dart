import 'package:flame/sprite.dart';
import 'package:hello_flame/components/fly.dart';
import 'package:hello_flame/hit-game.dart';

class MosquitoFly extends Fly {
  MosquitoFly(HitGame game, double x, double y) : super(game, x, y) {
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/mosquito-fly-1.png'));
    flyingSprite.add(Sprite('flies/mosquito-fly-2.png'));
    deadSprite = Sprite('flies/mosquito-fly-dead.png');
  }
}
