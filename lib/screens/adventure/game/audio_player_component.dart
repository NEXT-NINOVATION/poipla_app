import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:poipla_app/screens/adventure/game/models/settings.dart';
import 'package:provider/provider.dart';

import 'game.dart';

class AudioPlayerComponent extends Component with HasGameRef<AdventureGame> {
  @override
  Future<void>? onLoad() async {
    FlameAudio.bgm.initialize();

    await FlameAudio.audioCache
        .loadAll(['game.mp3', 'get_pla.mp3', 'hit_obstacle.mp3']);

    try {
      await FlameAudio.audioCache.load(
        'game.mp3',
      );
    } catch (_) {
      // ignore: avoid_print
      print('Missing VOiD1 Gaming music pack: '
          'https://void1gaming.itch.io/free-synthwave-music-pack '
          'See assets/audio/README.md for more information.');
    }

    return super.onLoad();
  }

  void playBgm(String filename) {
    if (!FlameAudio.audioCache.loadedFiles.containsKey(filename)) return;

    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .backgroundMusic) {
        FlameAudio.bgm.play(filename);
      }
    }
  }

  void playPoiplaBgm() {
    if (!FlameAudio.audioCache.loadedFiles.containsKey('game.mp3')) return;

    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .backgroundMusic) {
        FlameAudio.bgm.play('game.mp3');
        // FlameAudio.loop('game.mp3');
      }
    }
  }

  void playGetPlaSfx() async {
    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .soundEffects) {
        // await FlameAudio.audioCache.load('get_pla.mp3');
        await FlameAudio.play('get_pla.mp3');
        print(FlameAudio.audioCache.loadedFiles);
      }
    }
  }

  void playHitObstacleSfx() async {
    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .soundEffects) {
        await FlameAudio.play('hit_obstacle.mp3');
        print(FlameAudio.audioCache.loadedFiles);
      }
    }
  }

  void playSfx(String filename) async {
    if (gameRef.buildContext != null) {
      if (Provider.of<Settings>(gameRef.buildContext!, listen: false)
          .soundEffects) {
        await FlameAudio.play(filename);
      }
    }
  }

  void stopBgm() {
    FlameAudio.bgm.stop();
  }
}
