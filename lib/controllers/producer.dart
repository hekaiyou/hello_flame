import 'package:hello_flame/hit-game.dart';
import 'package:hello_flame/components/fly.dart';

class FlyProducer {
  final HitGame game;
  final int maxProducerInterval = 3000;
  final int minProducerInterval = 250;
  final int intervalChange = 3;
  final int maxProducerOnScreen = 7;
  int currentInterval;
  int nextProducer;

  FlyProducer(this.game) {
    start();
    game.produceFly();
  }

  void start() {
    killAll();
    currentInterval = maxProducerInterval;
    nextProducer = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.enemy.forEach((Fly fly) => fly.isDead = true);
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingFly = 0;
    game.enemy.forEach((Fly fly) {
      if (!fly.isDead) livingFly += 1;
    });

    if (nowTimestamp >= nextProducer && livingFly < maxProducerOnScreen) {
      game.produceFly();
      if (currentInterval > minProducerInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextProducer = nowTimestamp + currentInterval;
    }
  }
}
