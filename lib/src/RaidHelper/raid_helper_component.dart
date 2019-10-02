import 'dart:async';
import 'package:RaidHelper/src/model/champion.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'package:RaidHelper/src/RaidHelper/raid_helper_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'raid-helper',
  styleUrls: ['raid_helper_component.css'],
  templateUrl: 'raid_helper_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider( RaidHelperService)],
)
class RaidHelperComponent implements OnInit {
  final RaidHelperService raidHelperService;
  List<Champ> champs = List();
  List<String> items = [];
  String newTodo = '';

  RaidHelperComponent(this.raidHelperService);

  @override
  Future<Null> ngOnInit() async {
    var response = await http.get(raidHelperService.tier_list);
    if (response.statusCode == 200) {
      var raw_tier_list_csv = const CsvToListConverter().convert(response.body);
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
          this.champs.add(Champ.from_list(raw_tier_list_csv[i]));
        }
      }
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  void add() {
    items.add(newTodo);
    newTodo = '';

  }

  String remove(int index) => items.removeAt(index);
}
