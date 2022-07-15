import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';

void main() {
  test('ClatterResult jsonでコードテスト', () async {
    final jsonBody = jsonDecode(json);
    final clatterResults = (jsonBody as List<dynamic>?)
        ?.map((e) => ClatterResult.fromJson(e))
        .toList();
    expect(clatterResults, isNotNull);
    expect(clatterResults?.length, 7);
  });
}

const json = """[
    {
        "id": 1,
        "session_id": 1,
        "costume_id": null,
        "earn_exp": 30,
        "created_at": "2022-07-05T03:29:01.000000Z",
        "updated_at": "2022-07-05T03:29:01.000000Z",
        "type": "exp",
        "costume": null
    },
    {
        "id": 2,
        "session_id": 1,
        "costume_id": 1,
        "earn_exp": 0,
        "created_at": "2022-07-05T03:29:03.000000Z",
        "updated_at": "2022-07-05T03:29:03.000000Z",
        "type": "constume",
        "costume": {
            "id": 1,
            "costume_name": "たこ",
            "image": "octopus",
            "point": null,
            "req_lv": 1,
            "rarity_id": 1,
            "pref_id": null,
            "event_id": null,
            "rarity": 1,
            "buyable_flag": false,
            "prefecture": null,
            "event": null,
            "rarity_ref": {
                "id": 1,
                "rarity": 1,
                "rate": 0.25
            }
        }
    },
    {
        "id": 3,
        "session_id": 1,
        "costume_id": null,
        "earn_exp": 30,
        "created_at": "2022-07-05T03:29:05.000000Z",
        "updated_at": "2022-07-05T03:29:05.000000Z",
        "type": "exp",
        "costume": null
    },
    {
        "id": 4,
        "session_id": 1,
        "costume_id": 1,
        "earn_exp": 0,
        "created_at": "2022-07-05T03:29:06.000000Z",
        "updated_at": "2022-07-05T03:29:06.000000Z",
        "type": "constume",
        "costume": {
            "id": 1,
            "costume_name": "たこ",
            "image": "octopus",
            "point": null,
            "req_lv": 1,
            "rarity_id": 1,
            "pref_id": null,
            "event_id": null,
            "rarity": 1,
            "buyable_flag": false,
            "prefecture": null,
            "event": null,
            "rarity_ref": {
                "id": 1,
                "rarity": 1,
                "rate": 0.25
            }
        }
    },
    {
        "id": 5,
        "session_id": 1,
        "costume_id": 1,
        "earn_exp": 0,
        "created_at": "2022-07-05T03:29:07.000000Z",
        "updated_at": "2022-07-05T03:29:07.000000Z",
        "type": "constume",
        "costume": {
            "id": 1,
            "costume_name": "たこ",
            "image": "octopus",
            "point": null,
            "req_lv": 1,
            "rarity_id": 1,
            "pref_id": null,
            "event_id": null,
            "rarity": 1,
            "buyable_flag": false,
            "prefecture": null,
            "event": null,
            "rarity_ref": {
                "id": 1,
                "rarity": 1,
                "rate": 0.25
            }
        }
    },
    {
        "id": 6,
        "session_id": 1,
        "costume_id": null,
        "earn_exp": 30,
        "created_at": "2022-07-05T03:29:09.000000Z",
        "updated_at": "2022-07-05T03:29:09.000000Z",
        "type": "exp",
        "costume": null
    },
    {
        "id": 7,
        "session_id": 1,
        "costume_id": 2,
        "earn_exp": 0,
        "created_at": "2022-07-05T03:29:10.000000Z",
        "updated_at": "2022-07-05T03:29:10.000000Z",
        "type": "constume",
        "costume": {
            "id": 2,
            "costume_name": "クラゲ",
            "image": "jellyfish",
            "point": null,
            "req_lv": 3,
            "rarity_id": 3,
            "pref_id": null,
            "event_id": null,
            "rarity": 3,
            "buyable_flag": false,
            "prefecture": null,
            "event": null,
            "rarity_ref": {
                "id": 3,
                "rarity": 3,
                "rate": 0.15
            }
        }
    }
]""";
