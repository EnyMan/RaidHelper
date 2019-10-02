import 'rarity.dart';
import 'tier.dart';

class Champ {
  String Faction;
  String Name;
  Rank Rarity;
  String Element;
  String Type;
  Tier Overall;
  Tier Campaign;
  Tier Arena_Off;
  Tier Arena_Deff;
  Tier CB;
  Tier CB_T6;
  Tier IceG;
  Tier Dragon;
  Tier Spider;
  Tier FK;
  Tier Mino;
  Tier Force;
  Tier Magic;
  Tier Spirit;
  Tier Void;
  Tier Faction_Wars;
  String image;


  Champ(String Faction, String Name, Rank Rarity, String Element, String Type,
      Tier Overall, Tier Campaign, Tier Arena_Off, Tier Arena_Deff, Tier CB,
      Tier CB_T6, Tier IceG, Tier Dragon, Tier Spider, Tier FK, Tier Mino,
      Tier Force, Tier Magic, Tier Spirit, Tier Void, Tier Faction_Wars,
      String image) :
        Arena_Off = Arena_Off, Dragon = Dragon, Spirit = Spirit,
        Rarity = Rarity, Name = Name, Faction = Faction,
        Overall = Overall, CB_T6 = CB_T6, Force = Force, Magic = Magic,
        IceG = IceG, Campaign = Campaign, Element = Element, Type = Type,
        CB = CB, Arena_Deff = Arena_Deff, FK = FK, Spider = Spider, Void = Void,
        Faction_Wars = Faction_Wars, Mino = Mino, image = image;

  static Champ from_list(List list){
    String clean_name = list[1].replaceAll('*', '').replaceAll(RegExp(r'\s\(.*'), '').trim();
    String url = "assets/" + clean_name.toLowerCase().replaceAll(' ', '-') + ".jpg";
    return Champ(list[0], clean_name, Rank.from_rarity(list[2]), list[3],
        list[4], Tier.from_tier(list[5]), Tier.from_tier(list[6]),
        Tier.from_tier(list[7]), Tier.from_tier(list[8]),
        Tier.from_tier(list[9]), Tier.from_tier(list[10]),
        Tier.from_tier(list[11]), Tier.from_tier(list[12]),
        Tier.from_tier(list[13]), Tier.from_tier(list[14]),
        Tier.from_tier(list[15]), Tier.from_tier(list[16]),
        Tier.from_tier(list[17]), Tier.from_tier(list[18]),
        Tier.from_tier(list[19]), Tier.from_tier(list[20]), url);
  }
}
