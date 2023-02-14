import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poipla_app/providers/session_event_provider.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/adventure/adventure_screen.dart';
import 'package:poipla_app/screens/adventure/game/models/character_details.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:poipla_app/screens/adventure/game/models/settings.dart';
import 'package:poipla_app/screens/change_costume/change_cosutme_screen.dart';
import 'package:poipla_app/screens/gacha_result/gacha_result_screen.dart';
import 'package:poipla_app/screens/home/components/gacha_animation_screen.dart';
import 'package:poipla_app/screens/home/home_screen.dart';
import 'package:poipla_app/screens/shop/shop_screen.dart';
import 'package:poipla_app/screens/splash_screen.dart';
import 'package:poipla_app/screens/start_screen.dart';
import 'package:poipla_app/screens/tutorial/tutorial_screen.dart';
import 'package:poipla_app/store/auth_store.dart';
import 'package:provider/provider.dart' as provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: RouterApp(),
    );
  }
}

final routerProvider = Provider((ref) {
  final authState = ref.read(accountStoreProvider);
  return GoRouter(
    routes: [
      GoRoute(
          path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/shop',
        builder: (context, state) => const ShopScreen(),
      ),
      GoRoute(
        path: '/adventure',
        builder: (context, state) => AdventureScreen(),
      ),
      GoRoute(
        path: '/change_costume',
        builder: (context, state) => ChangeCostumeScreen(),
      ),
      GoRoute(
        path: '/start',
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
          path: '/tutorials',
          builder: (context, state) => const TutorialScreen()),
      GoRoute(
        path: '/result_box/:dustBoxId/clatter_result/:sessionId',
        builder: (context, state) => GachaResultScreen(
          sessionId: int.parse(state.params['sessionId']!),
          boxId: int.parse(state.params['dustBoxId']!),
        ),
      ),
      GoRoute(
          path: '/result_box/:dustBoxId/clatter_result/:sessionId/animation',
          builder: (context, state) => GachaAnimationScreen(
              sessionId: int.parse(state.params['sessionId']!),
              boxId: int.parse(state.params['dustBoxId']!)))
    ],
    redirect: (state) {
      if (state.subloc != '/start' && authState.type == AppStateType.start) {
        return '/start';
      }
      if (state.subloc != '/tutorials' &&
          authState.type == AppStateType.tutorial) {
        return '/tutorials';
      }
      if (state.subloc != '/splash' && authState.type == AppStateType.loading) {
        return '/splash';
      }

      if (['/start', '/tutorials', '/splash'].contains(state.subloc) &&
          authState.type == AppStateType.authorized) {
        return '/';
      }
      return null;
    },
    refreshListenable: authState,
  );
});

class RouterApp extends ConsumerWidget {
  const RouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(_fetchAuthInfoFutureProvider);
    ref.watch(pusherChannelProvider);

    ref.watch(accountStoreProvider);
    final router = ref.read(routerProvider);
    return provider.MultiProvider(
      providers: [
        provider.FutureProvider<PlayerData>(
          create: (BuildContext context) => getPlayerData(),
          initialData: PlayerData.fromMap(PlayerData.defaultData),
        ),
        provider.FutureProvider<Settings>(
          create: (BuildContext context) => getSettings(),
          initialData: Settings(soundEffects: false, backgroundMusic: false),
        ),
      ],
      builder: (context, child) {
        // 必要なオブジェクトは上流の FutureProviders によって既に作成されて
        // いるため、ここでは .value コンストラクターを使用します。
        return provider.MultiProvider(
          providers: [
            provider.ChangeNotifierProvider<PlayerData>.value(
              value: provider.Provider.of<PlayerData>(context),
            ),
            provider.ChangeNotifierProvider<Settings>.value(
              value: provider.Provider.of<Settings>(context),
            ),
          ],
          child: child,
        );
      },
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        theme: ThemeData(
          fontFamily: "LightNovelPOPv2",
        ),
      ),
    );
  }
}

final _fetchAuthInfoFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(accountStoreProvider).fetch();
});

class ExampleRegisterScreen extends ConsumerWidget {
  const ExampleRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              ref.read(accountStoreProvider).register().then((value) {
                GoRouter.of(context).go('/');
              });
            },
            child: const Text('登録')),
      ),
    );
  }
}

/// 保存されている [PlayerData] をディスクから読み込む関数
Future<PlayerData> getPlayerData() async {
  // プレーヤーデータボックスを開き、そこからプレーヤーデータを読み取る。
  final box = await Hive.openBox<PlayerData>(PlayerData.playerDataBox);
  final playerData = box.get(PlayerData.playerDataKey);

  // プレイヤーデータが null の場合、これはゲームの新規起動であることを意味します。
  // このような場合、最初にデフォルトのプレーヤーデータをプレーヤーデータボックスに
  // 保存してから、同じものを返す。
  if (playerData == null) {
    box.put(
      PlayerData.playerDataKey,
      PlayerData.fromMap(PlayerData.defaultData),
    );
  }

  return box.get(PlayerData.playerDataKey)!;
}

/// 保存されている [Settings] をディスクから読み込む関数。
Future<Settings> getSettings() async {
  // 設定ボックスを開き、そこから設定を読み取ります。
  final box = await Hive.openBox<Settings>(Settings.settingsBox);
  final settings = box.get(Settings.settingsKey);

  // 設定が null の場合、これはゲームの新規起動であることを意味します。
  // このような場合、最初にデフォルト設定を設定ボックスに保存してから
  // 同じ設定を返します。
  if (settings == null) {
    box.put(Settings.settingsKey,
        Settings(soundEffects: true, backgroundMusic: true));
  }

  return box.get(Settings.settingsKey)!;
}

// ハイブ アダプターも登録する関数。
Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PlayerDataAdapter());
  Hive.registerAdapter(FishTypeAdapter());
  Hive.registerAdapter(SettingsAdapter());
}
