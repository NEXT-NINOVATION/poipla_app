import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:pusher_client/pusher_client.dart';

const pusherApiKey = String.fromEnvironment('PUSHER_API_KEY');

final pusherClientProvider = Provider.autoDispose<PusherClient>((ref) {
  final client = PusherClient(
    pusherApiKey,
    PusherOptions(
      cluster: 'ap3',
    ),
  );
  client.connect().then((value) {
    log('pusher is connected');
  });
  ref.onDispose(() {
    client.disconnect();
  });
  return client;
});
final sessionCountEventStreamProvider =
    StreamProvider.autoDispose.family((ref, int dustBoxId) async* {
  final pusherClient = ref.read(pusherClientProvider);
  final streamController = StreamController<Map<String, dynamic>>();
  pusherClient.subscribe('dust-box-$dustBoxId').bind('result-count', (event) {
    log('on session count event, socketId:${pusherClient.getSocketId()}');
    log('result-count-event:${event?.data}');
    // jsonDecode()
  });

  ref.read(accountStoreProvider);
  streamController.onCancel = () {
    log('unsubscribe sessionCountEventStream: $dustBoxId');
    pusherClient.unsubscribe('dust-box-$dustBoxId');
  };

  yield* streamController.stream;
});
