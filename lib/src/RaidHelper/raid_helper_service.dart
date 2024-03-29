import 'dart:async';

import 'package:csv/csv.dart';
import 'package:RaidHelper/src/model/champion.dart';
import 'package:angular/core.dart';
import 'dart:html';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class RaidHelperService {
  List<String> mockTodoList = <String>[];
//  var dir = Directory.current;
  List<Champ> champs = List();
  bool sort = false;
  bool sortPolarity = false;

  Future<List<String>> getTodoList() async => mockTodoList;

  void fetchData() async{
    if (this.champs.isNotEmpty){
      return;
    }
    final response = await HttpRequest.getString('champions.csv');
    //var response = await http.get(this.tier_list);
    if (response.isNotEmpty) {
      var raw_tier_list_csv = await CsvToListConverter().convert(response);
      bool is_header = false;
      String last_faction = "";
      for (int i = 0; i < raw_tier_list_csv.length; i++) {
        if (raw_tier_list_csv[i].contains("Factions")){
          is_header = true;
          continue;
        }
        if( is_header ){
          if (raw_tier_list_csv[i][0] == ""){
            raw_tier_list_csv[i][0] = last_faction;
          } else {
            last_faction = raw_tier_list_csv[i][0];
          }
          print(raw_tier_list_csv[i]);
          this.champs.add( await Champ.from_list(raw_tier_list_csv[i]));
        }
      }
    } else {
      print("Load failed.");
    }
  }
}
