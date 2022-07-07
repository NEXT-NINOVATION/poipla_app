import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/events/result_count.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

const pusherApiKey = String.fromEnvironment('PUSHER_API_KEY');

final pusherChannelProvider =
    Provider.autoDispose<PusherChannelsFlutter>((ref) {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  pusher
      .init(
    apiKey: pusherApiKey,
    cluster: 'ap3',
  )
      .catchError((e, st) {
    log('start pusher error', error: e, stackTrace: st);
  });
  pusher.connect().catchError((e, st) {
    log('start pusher error', error: e, stackTrace: st);
  });
  ref.onDispose(() => pusher.disconnect());
  return pusher;
});

final sessionCountEventStreamProvider = StreamProvider.autoDispose
    .family<ResultCount, int>((ref, int dustBoxId) async* {
  final pusherClient = ref.read(pusherChannelProvider);
  final streamController = StreamController<ResultCount>();
  pusherClient.subscribe(
      channelName: 'dust-box-$dustBoxId',
      onEvent: (event) {
        if (event.eventName == 'result-count') {
          log('on session count event, socketId:${pusherClient.getSocketId()}');
          log('result-count-event:${event.data}');
          if (event.data != null) {
            final json = jsonDecode(event.data!);
            streamController.sink.add(ResultCount.fromJson(json));
          }
        }
      });

  ref.read(accountStoreProvider);
  streamController.onCancel = () {
    log('unsubscribe sessionCountEventStream: $dustBoxId');
    pusherClient.unsubscribe(channelName: 'dust-box-$dustBoxId');
    // pusherClient.unsubscribe('dust-box-$dustBoxId');
  };

  yield* streamController.stream;
});
