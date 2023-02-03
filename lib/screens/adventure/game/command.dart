import 'package:flame/components.dart';

// このクラスは、ゲームインスタンスに追加されたタイプTの
// すべてのコンポーネントで実行されるコマンドを表します。
class Command<T extends Component> {
  // タイプTのコンポーネントで実行されるコールバック関数。
  void Function(T target) action;

  Command({required this.action});

  // タイプTの場合、指定されたコンポーネントでコールバックを実行します。
  void run(Component c) {
    if (c is T) {
      action.call(c);
    }
  }
}
