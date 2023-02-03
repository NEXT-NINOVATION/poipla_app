// IMPORTANT NOTE
// This class is obsolete since Flame v1.2.0 version
// This code remains as is as a reference for the YouTube tutorial.

import 'package:flame/components.dart';

// この mixin を BaseComponent から派生した任意のクラスに追加すると、コンポーネントが
// 現在の gameSize に確実にアクセスできるようになります。
// コンポーネントがゲーム インスタンスに追加される前に、gameSize にアクセスしようとしないでください。
mixin KnowsGameSize on Component {
  late Vector2 gameSize;

  void onResize(Vector2 newGameSize) {
    gameSize = newGameSize;
  }
}
