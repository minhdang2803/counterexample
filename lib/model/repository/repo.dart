import 'package:sample/model/local/local.dart';
import 'package:sample/model/remote/remote.dart';

class repository {
  repository(){
    remote = Remote();
    local = Local();
  };
  final Remote remote;
  final Local local;

  getData() {
    final fromServer = remote.getDataFromBE("data");
    local.storeDB(fromServer);
    final data = local.getFromDB("data");
    return data;
  }
}
