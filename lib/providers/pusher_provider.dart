import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/models/services/token_service.dart';
import 'package:poipla_app/providers/token_providers.dart';
import 'package:pusher_client/pusher_client.dart';

const String pusherApiKey = String.fromEnvironment('PUSHER_API_KEY');

final pusherFamilyProvider = Provider.autoDispose.family((ref, String? token) {
  PusherOptions options = PusherOptions(
    wsPort: 6001,
    encrypted: false,
    auth: PusherAuth(
      'https://poipla.yumekiti.net/',
      headers: {
        'Authorization': 'Bearer $token',
      },
    ),
  );

  final client = PusherClient(pusherApiKey, options);
  client.connect();
  ref.onDispose(() {
    client.disconnect();
  });
  return client;
});

class PusherConnectInfo {
  PusherConnectInfo({required this.channelName, required this.bindEventName});

  final String channelName;
  final String bindEventName;
}

Stream<PusherEvent?> bindEvent(
    TokenService tokenService, PusherClient pusherClient,
    {required PusherConnectInfo connectInfo}) async* {
  final controller = StreamController<PusherEvent?>();
  await pusherClient.connect();
  final channel = pusherClient.subscribe(connectInfo.channelName);

  channel.bind(connectInfo.bindEventName, (event) {
    controller.add(event);
  });

  controller.onCancel = () async {
    await channel.unbind(connectInfo.bindEventName);
    await controller.close();
  };

  yield* controller.stream;
}

final pusherChannelEventStreamFamilyProvider = StreamProvider.autoDispose
    .family((ref, PusherConnectInfo connectInfo) async* {
  final token = await ref.read(tokenProvider).get();
  final pusherClient = ref.read(pusherFamilyProvider(token));

  yield* bindEvent(ref.read(tokenProvider), pusherClient,
      connectInfo: connectInfo);
});

final resultCostumeEventStreamProvider =
    StreamProvider.autoDispose.family((ref, int dustBoxId) async* {
  final token = await ref.read(tokenProvider).get();
  final pusherClient = ref.read(pusherFamilyProvider(token));
  yield* bindEvent(ref.read(tokenProvider), pusherClient,
          connectInfo: PusherConnectInfo(
              channelName: 'dust-box-$dustBoxId',
              bindEventName: 'result-costume'))
      .map((event) {
    event?.toJson();
  });
});

final resultExpEventStreamProvider =
    StreamProvider.autoDispose.family((ref, int dustBoxId) async* {
  final token = await ref.read(tokenProvider).get();
  final pusherClient = ref.read(pusherFamilyProvider(token));
  yield* bindEvent(ref.read(tokenProvider), pusherClient,
          connectInfo: PusherConnectInfo(
              channelName: 'dust-box-$dustBoxId', bindEventName: 'result-exp'))
      .map((event) {
    event?.toJson();
  });
});
