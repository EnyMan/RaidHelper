import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class RaidHelperService {
  final tier_list = "https://docs.google.com/spreadsheets/d/1jdrS8mnsITEWL1qREShSG3xNOZKYJuL5dUnNrUWQIjw/export?format=csv&id=1jdrS8mnsITEWL1qREShSG3xNOZKYJuL5dUnNrUWQIjw&gid=1316512811";
  List<String> mockTodoList = <String>[];
//  var dir = Directory.current;

  Future<List<String>> getTodoList() async => mockTodoList;
}
