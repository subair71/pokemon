class CardEntity {
  List<CardResponseEntity>? data;
  int? page;
  int? pageSize;
  int? count;
  int? totalCount;

  CardEntity({
    this.data,
    this.page,
    this.pageSize,
    this.count,
    this.totalCount,
  });
}

class CardResponseEntity {
  String? id;
  String? name;
  String? supertype;
  List<String>? subtypes;
  String? hp;
  List<String>? types;
  String? evolvesFrom;
  List<AttackEntity>? attacks;
  List<WeaknessEntity>? weaknesses;
  List<ResistanceEntity>? resistances;
  List<String>? retreatCost;
  int? convertedRetreatCost;
  SetDetailsEntity? setDetails;
  String? number;
  String? artist;
  String? rarity;
  String? flavorText;
  List<int>? nationalPokedexNumbers;
  LegalitiesEntity? legalities;
  ImagesEntity? images;
  PriceDetailsEntity? tcgPlayer;
  PriceDetailsEntity? cardMarket;

  CardResponseEntity({
    this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.setDetails,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgPlayer,
    this.cardMarket,
  });
}

class AttackEntity {
  String? name;
  List<String>? cost;
  int? convertedEnergyCost;
  String? damage;
  String? text;

  AttackEntity({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });
}

class WeaknessEntity {
  String? type;
  String? value;

  WeaknessEntity({
    this.type,
    this.value,
  });
}

class ResistanceEntity {
  String? type;
  String? value;

  ResistanceEntity({
    this.type,
    this.value,
  });
}

class SetDetailsEntity {
  String? id;
  String? name;
  String? series;
  int? printedTotal;
  int? total;
  LegalitiesEntity? legalities;
  String? ptcgoCode;
  String? releaseDate;
  String? updatedAt;
  SetImagesEntity? images;

  SetDetailsEntity({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });
}

class SetImagesEntity {
  String? symbol;
  String? logo;

  SetImagesEntity({
    this.symbol,
    this.logo,
  });
}

class LegalitiesEntity {
  String? unlimited;

  LegalitiesEntity({
    this.unlimited,
  });
}

class ImagesEntity {
  String? small;
  String? large;

  ImagesEntity({
    this.small,
    this.large,
  });
}

class PriceDetailsEntity {
  double? low;
  double? mid;
  double? high;
  double? market;
  double? directLow;

  PriceDetailsEntity({
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });
}
