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

  RaidHelperComponent(this.raidHelperService);

  @override
  Future<Null> ngOnInit() async {
    await raidHelperService.fetchData();
    this.champs = await raidHelperService.champs;
  }

  void filterFood(){
    raidHelperService.sort = false;
    this.champs = List();
    for (int i = 0; i < raidHelperService.champs.length; i++) {
      if (raidHelperService.champs[i].isFood()){
        this.champs.add(raidHelperService.champs[i]);
      }
    }
  }

  void filterReset(){
    this.champs = raidHelperService.champs;
    raidHelperService.sort = false;
  }

  void filterGood(){
    raidHelperService.sort = false;
    this.champs = List();
    for (int i = 0; i < raidHelperService.champs.length; i++) {
      if (raidHelperService.champs[i].isGood()){
        this.champs.add(raidHelperService.champs[i]);
      }
    }
  }


  void filterSort(){
    if (!raidHelperService.sort){
     this.champs.sort((a, b) => a.Rarity.value - b.Rarity.value);
     raidHelperService.sort = true;
     return;
    }
    this.champs = this.champs.reversed.toList();
  }
}
