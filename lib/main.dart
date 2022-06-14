import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/change_costume/change_costume_screen.dart';
import 'package:poipla_app/screens/home/home_screen.dart';
import 'package:poipla_app/screens/splash_screen.dart';
import 'package:poipla_app/screens/start_screen.dart';

import 'package:poipla_app/store/auth_store.dart';


void main() {
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
  final authState = ref.read(authStoreProvider);
  return GoRouter(
    routes: [
      GoRoute(
          path: '/splash', builder: (context, state) => ExampleSplashScreen()),
      GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(title: 'にのさんのおうち')),
      GoRoute(
          path: '/register',
          builder: (context, state) => const ExampleRegisterScreen()),
      GoRoute(
        path: '/change_costume',
        builder: (context, state) => const ChangeCostumeScreen(),
      )
    ],
    redirect: (state) {
      if (state.subloc != '/register' &&
          authState.type == AuthType.unauthorized) {
        return '/register';
      }
      if (state.subloc != '/splash' && authState.type == AuthType.loading) {
        return '/splash';
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

    ref.watch(authStoreProvider);
    final router = ref.read(routerProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        fontFamily: "LightNovelPOPv2",
      ),
    );
  }
}

final _fetchAuthInfoFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(authStoreProvider).fetch();
});

class ExampleSplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

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
              ref.read(authStoreProvider).register().then((value) {
                GoRouter.of(context).go('/');
              });
            },
            child: const Text('登録')),
      ),
    );
  }
}
