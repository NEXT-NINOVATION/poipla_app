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
    title: "たこ",
    image: "octopus.svg",
    rarity: 1,
    point: 100,
    req_lv: 1,
    buyable_flag: true,
  ),
  Costume(
    title: "クラゲ",
    image: "jellyfish.svg",
    rarity: 2,
    point: 120,
    req_lv: 3,
    buyable_flag: true,
  ),
  Costume(
    title: "クジラ",
    image: "whale.svg",
    rarity: 5,
    point: 1000,
    req_lv: 50,
    buyable_flag: true,
  ),
  Costume(
    title: "かめ",
    image: "turtle.svg",
    rarity: 5,
    point: 50,
    req_lv: 50,
    buyable_flag: true,
  ),
  Costume(
    title: "サメ",
    image: "shark.svg",
    rarity: 5,
    point: 1200,
    req_lv: 50,
    buyable_flag: true,
  ),
  Costume(
    title: "たこ",
    image: "octopus.svg",
    rarity: 1,
    point: 100,
    req_lv: 1,
    buyable_flag: false,
  ),
  Costume(
    title: "たこ",
    image: "octopus.svg",
    rarity: 1,
    point: 100,
    req_lv: 1,
    buyable_flag: false,
  ),
  Costume(
    title: "たこ",
    image: "octopus.svg",
    rarity: 1,
    point: 100,
    req_lv: 1,
    buyable_flag: false,
  ),
];

class MyCostume {
  final String costume_name, image, fish_image;

  MyCostume({
    required this.costume_name,
    required this.image,
    required this.fish_image,
  });
}

List<MyCostume> myCostumeList = [
  MyCostume(
    costume_name: "くらげ",
    image: "jellyfish.svg",
    fish_image: "fish_jellyfish.svg",
  ),
  MyCostume(
    costume_name: "サメ",
    image: "shark.svg",
    fish_image: "fish_shark.svg",
  ),
  MyCostume(
    costume_name: "たこ",
    image: "octopus.svg",
    fish_image: "fish_octopus.svg",
  ),
  MyCostume(
    costume_name: "クジラ",
    image: "whale.svg",
    fish_image: "fish_whale.svg",
  ),
  MyCostume(
    costume_name: "かめ",
    image: "turtle.svg",
    fish_image: "fish_turtle.svg",
  ),
];

List<String> myCostumeFishList = [
  "fish_jellyfish.svg",
  "fish_shark.svg",
  "fish_octopus.svg",
  "fish_octopus.svg",
  "fish_octopus.svg",
];

class Present {
  final String title, image, detail;

  Present({
    required this.title,
    required this.image,
    required this.detail,
  });
}

List<Present> myPresentList = [
  Present(
    title: "シャチホコ",
    image: "shachihoko.svg",
    detail: "ぼうけんでゲット！",
  ),
  Present(
    title: "シャチホコ",
    image: "shachihoko.svg",
    detail: "ぼうけんでゲット！",
  ),
  Present(
    title: "シャチホコ",
    image: "shachihoko.svg",
    detail: "ぼうけんでゲット！",
  ),
  Present(
    title: "シャチホコ",
    image: "shachihoko.svg",
    detail: "ぼうけんでゲット！",
  ),
];
