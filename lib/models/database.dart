import 'package:flutter/material.dart';

class Costume {
  final String title, image;
  final int point, rarity, req_lv;
  final bool buyable_flag;

  Costume({
    required this.title,
    required this.image,
    required this.rarity,
    required this.point,
    required this.req_lv,
    required this.buyable_flag,
  });
}

List<Costume> costume_list = [
  Costume(
    title: "くらげ",
    image: "jellyfish.svg",
    rarity: 1,
    point: 80,
    req_lv: 1,
    buyable_flag: true,
  ),
  Costume(
    title: "たこ",
    image: "octopus.png",
    rarity: 1,
    point: 100,
    req_lv: 1,
    buyable_flag: true,
  ),
  Costume(
    title: "いるか",
    image: "",
    rarity: 2,
    point: 120,
    req_lv: 3,
    buyable_flag: false,
  ),
  Costume(
    title: "くじら",
    image: "",
    rarity: 5,
    point: 1000,
    req_lv: 50,
    buyable_flag: false,
  ),
  Costume(
    title: "くじら",
    image: "",
    rarity: 5,
    point: 1000,
    req_lv: 50,
    buyable_flag: false,
  ),
  Costume(
    title: "くじら",
    image: "",
    rarity: 5,
    point: 1000,
    req_lv: 50,
    buyable_flag: false,
  ),
  Costume(
    title: "くじら",
    image: "",
    rarity: 5,
    point: 1000,
    req_lv: 50,
    buyable_flag: false,
  ),
  Costume(
    title: "くじら",
    image: "",
    rarity: 5,
    point: 1000,
    req_lv: 50,
    buyable_flag: false,
  ),
];
