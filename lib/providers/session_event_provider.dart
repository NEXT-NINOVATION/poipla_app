import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/events/result_count.dart';
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
final sessionCountEventStreamProvider = StreamProvider.autoDispose
    .family<ResultCount, int>((ref, int dustBoxId) async* {
  final pusherClient = ref.read(pusherClientProvider);
  final streamController = StreamController<ResultCount>();
  pusherClient.subscribe('dust-box-$dustBoxId').bind('result-count', (event) {
    log('on session count event, socketId:${pusherClient.getSocketId()}');
    log('result-count-event:${event?.data}');
    if (event?.data != null) {
      final json = jsonDecode(event!.data!);
      streamController.sink.add(ResultCount.fromJson(json));
    }
    // jsonDecode()
  });

  ref.read(accountStoreProvider);
  streamController.onCancel = () {
    log('unsubscribe sessionCountEventStream: $dustBoxId');
    pusherClient.unsubscribe('dust-box-$dustBoxId');
  };

  yield* streamController.stream;
});
