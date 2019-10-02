const tier_mapping = {
  // Key:    Value
  'D': 0,
  'C': 1,
  'B': 3,
  'A': 4,
  'S': 5,
  'SS': 6
};

const tier_color_mapping = {
  // Key:    Value
  'D': '#FF0000',
  'C': '#FFA500',
  'B': '#FFFF00',
  'A': '#00FF00',
  'S': '#00c5ff',
  'SS': '#00c5ff'
};

class Tier{
  String tier;
  int value;

  Tier(this.tier, this.value);

  static Tier from_tier(tier){
    if (tier is! String){
      tier = 'B';
    }
    return Tier(tier, tier_mapping.containsKey(tier) ? tier_mapping[tier] : 3);
  }

  String color(){
    return tier_color_mapping[this.tier];
  }
}
