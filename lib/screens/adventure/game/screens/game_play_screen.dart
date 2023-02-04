import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/game.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/game_clear_menu.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/game_over_menu.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/start_count_down.dart';

import '../widgets/overlays/pause_button.dart';
import '../widgets/overlays/pause_menu.dart';

// これをファイルプライベートオブジェクトとして作成し、ゲームオブジェクト全体の
// 不要な再構築を回避します。
AdventureGame _adventureGame = AdventureGame();

// このクラスは、すべてのアクションが発生する実際のゲーム画面を表します。
class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB6E9EB), Color(0xFF207CAF)],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // WillPopScope は、ユーザーが戻るボタンを押したときに、このウィジェット
        // をポップするかどうかを決定する方法を提供する。
        body: WillPopScope(
          onWillPop: () async => false,
          // GameWidget は、FlameのGameクラスから拡張された任意のクラスの基礎
          // となるウィジェットを挿入するのに役立つ。
          child: GameWidget(
            game: _adventureGame,
            // 最初は一時停止ボタンのオーバーレイのみが表示される。
            initialActiveOverlays: const [PauseButton.id],
            overlayBuilderMap: {
              PauseButton.id: (BuildContext context, AdventureGame gameRef) =>
                  PauseButton(
                    gameRef: gameRef,
                  ),
              PauseMenu.id: (BuildContext context, AdventureGame gameRef) =>
                  PauseMenu(
                    gameRef: gameRef,
                  ),
              StartCountDown.id:
                  (BuildContext context, AdventureGame gameRef) =>
                      StartCountDown(
                        gameRef: gameRef,
                      ),
              GameOverMenu.id: (BuildContext context, AdventureGame gameRef) =>
                  GameOverMenu(
                    gameRef: gameRef,
                  ),
              GameClearMenu.id: (BuildContext context, AdventureGame gameRef) =>
                  GameClearMenu(
                    gameRef: gameRef,
                  ),
            },
          ),
        ),
      ),
    );
  }
}
