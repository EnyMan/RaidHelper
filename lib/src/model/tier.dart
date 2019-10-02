const tier_mapping = {
  // Key:    Value
  'D': 0,
  'C': 1,
  'B': 3,
  'A': 4,
  'S': 5,
  'SS': 6
};

class Tier{
  String tier;
  int value;

  Tier(this.tier, this.value);

  static Tier from_tier(tier){
    if (tier is! String){
      tier = 'B';
    }

    return Tier(tier, tier_mapping[tier]);
  }
}
