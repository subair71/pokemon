import 'package:sample/features/card/domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  CardModel({
    List<CardResponseModel>? super.data,
    super.page,
    super.pageSize,
    super.count,
    super.totalCount,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        data: json["data"] != null
            ? List<CardResponseModel>.from(
                json["data"].map((x) => CardResponseModel.fromJson(x)))
            : [],
        page: json["page"],
        pageSize: json["pageSize"],
        count: json["count"],
        totalCount: json["totalCount"],
      );
}

class CardResponseModel extends CardResponseEntity {
  CardResponseModel({
    super.id,
    super.name,
    super.supertype,
    super.subtypes,
    super.hp,
    super.types,
    super.evolvesFrom,
    List<AttackModel>? super.attacks,
    List<WeaknessModel>? super.weaknesses,
    List<ResistanceModel>? super.resistances,
    super.retreatCost,
    super.convertedRetreatCost,
    SetDetailsModel? super.setDetails,
    super.number,
    super.artist,
    super.rarity,
    super.flavorText,
    super.nationalPokedexNumbers,
    LegalitiesModel? super.legalities,
    ImagesModel? super.images,
    PriceDetailsModel? super.tcgPlayer,
    PriceDetailsModel? super.cardMarket,
  });

  factory CardResponseModel.fromJson(Map<String, dynamic> json) =>
      CardResponseModel(
        id: json["id"],
        name: json["name"],
        supertype: json["supertype"],
        subtypes: json["subtypes"] != null
            ? List<String>.from(json["subtypes"])
            : [],
        hp: json["hp"],
        types: json["types"] != null
            ? List<String>.from(json["types"])
            : [],
        evolvesFrom: json["evolvesFrom"],
        attacks: json["attacks"] != null
            ? List<AttackModel>.from(
                json["attacks"].map((x) => AttackModel.fromJson(x)))
            : [],
        weaknesses: json["weaknesses"] != null
            ? List<WeaknessModel>.from(
                json["weaknesses"].map((x) => WeaknessModel.fromJson(x)))
            : [],
        resistances: json["resistances"] != null
            ? List<ResistanceModel>.from(
                json["resistances"].map((x) => ResistanceModel.fromJson(x)))
            : [],
        retreatCost: json["retreatCost"] != null
            ? List<String>.from(json["retreatCost"])
            : [],
        convertedRetreatCost: json["convertedRetreatCost"],
        setDetails: json["set"] != null
            ? SetDetailsModel.fromJson(json["set"])
            : null,
        number: json["number"],
        artist: json["artist"],
        rarity: json["rarity"],
        flavorText: json["flavorText"],
        nationalPokedexNumbers: json["nationalPokedexNumbers"] != null
            ? List<int>.from(json["nationalPokedexNumbers"])
            : [],
        legalities: json["legalities"] != null
            ? LegalitiesModel.fromJson(json["legalities"])
            : null,
        images: json["images"] != null
            ? ImagesModel.fromJson(json["images"])
            : null,
        tcgPlayer: json["tcgplayer"] != null
            ? PriceDetailsModel.fromJson(json["tcgplayer"]["prices"])
            : null,
        cardMarket: json["cardmarket"] != null
            ? PriceDetailsModel.fromJson(json["cardmarket"]["prices"])
            : null,
      );
}

class AttackModel extends AttackEntity {
  AttackModel({
    super.name,
    super.cost,
    super.convertedEnergyCost,
    super.damage,
    super.text,
  });

  factory AttackModel.fromJson(Map<String, dynamic> json) => AttackModel(
        name: json["name"],
        cost: json["cost"] != null ? List<String>.from(json["cost"]) : [],
        convertedEnergyCost: json["convertedEnergyCost"],
        damage: json["damage"],
        text: json["text"],
      );
}

class WeaknessModel extends WeaknessEntity {
  WeaknessModel({
    super.type,
    super.value,
  });

  factory WeaknessModel.fromJson(Map<String, dynamic> json) => WeaknessModel(
        type: json["type"],
        value: json["value"],
      );
}

class ResistanceModel extends ResistanceEntity {
  ResistanceModel({
    super.type,
    super.value,
  });

  factory ResistanceModel.fromJson(Map<String, dynamic> json) =>
      ResistanceModel(
        type: json["type"],
        value: json["value"],
      );
}

class SetDetailsModel extends SetDetailsEntity {
  SetDetailsModel({
    super.id,
    super.name,
    super.series,
    super.printedTotal,
    super.total,
    LegalitiesModel? super.legalities,
    super.ptcgoCode,
    super.releaseDate,
    super.updatedAt,
    SetImagesModel? super.images,
  });

  factory SetDetailsModel.fromJson(Map<String, dynamic> json) =>
      SetDetailsModel(
        id: json["id"],
        name: json["name"],
        series: json["series"],
        printedTotal: json["printedTotal"],
        total: json["total"],
        legalities: json["legalities"] != null
            ? LegalitiesModel.fromJson(json["legalities"])
            : null,
        ptcgoCode: json["ptcgoCode"],
        releaseDate: json["releaseDate"],
        updatedAt: json["updatedAt"],
        images: json["images"] != null
            ? SetImagesModel.fromJson(json["images"])
            : null,
      );
}

class SetImagesModel extends SetImagesEntity {
  SetImagesModel({
    super.symbol,
    super.logo,
  });

  factory SetImagesModel.fromJson(Map<String, dynamic> json) =>
      SetImagesModel(
        symbol: json["symbol"],
        logo: json["logo"],
      );
}

class LegalitiesModel extends LegalitiesEntity {
  LegalitiesModel({
    super.unlimited,
  });

  factory LegalitiesModel.fromJson(Map<String, dynamic> json) =>
      LegalitiesModel(
        unlimited: json["unlimited"],
      );
}

class ImagesModel extends ImagesEntity {
  ImagesModel({
    super.small,
    super.large,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        small: json["small"],
        large: json["large"],
      );
}

class PriceDetailsModel extends PriceDetailsEntity {
  PriceDetailsModel({
    super.low,
    super.mid,
    super.high,
    super.market,
    super.directLow,
  });

  factory PriceDetailsModel.fromJson(Map<String, dynamic> json) =>
      PriceDetailsModel(
        low: json["low"]?.toDouble(),
        mid: json["mid"]?.toDouble(),
        high: json["high"]?.toDouble(),
        market: json["market"]?.toDouble(),
        directLow: json["directLow"]?.toDouble(),
      );
}
