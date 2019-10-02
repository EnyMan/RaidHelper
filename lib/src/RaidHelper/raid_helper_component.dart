import 'dart:async';
import 'package:RaidHelper/src/model/champion.dart';
import 'package:RaidHelper/src/RaidHelper/raid_helper_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(
  selector: 'raid-helper',
  styleUrls: ['raid_helper_component.css'],
  templateUrl: 'raid_helper_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    BsTooltipComponent,
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
    await raidHelperService.fetchData();
    this.champs = raidHelperService.champs;
  }

  void filterFood(){
    this.champs = List();
    for (int i = 0; i < raidHelperService.champs.length; i++) {
      if (raidHelperService.champs[i].isFood()){
        this.champs.add(raidHelperService.champs[i]);
      }
    }
  }

  void filterReset(){
    this.champs = raidHelperService.champs;
  }

  void filterGood(){
    this.champs = List();
    for (int i = 0; i < raidHelperService.champs.length; i++) {
      if (raidHelperService.champs[i].isGood()){
        this.champs.add(raidHelperService.champs[i]);
      }
    }
  }
}
