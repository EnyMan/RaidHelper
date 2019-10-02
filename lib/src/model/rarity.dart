const rank_mapping = {
  // Key:    Value
  'Rare': 0,
  'Epic': 1,
  'Legendary': 2
};

class Rank {
  String rarity;
  int value;

  Rank(this.rarity, this.value);

  static Rank from_rarity(String rarity){
    return Rank(rarity, rank_mapping[rarity]);
  }
}
