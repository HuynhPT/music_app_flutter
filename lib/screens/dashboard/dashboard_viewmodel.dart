import 'package:flutter/foundation.dart';
import 'package:music_app/res_local/api_local.dart';

class DashBoardViewModel extends ChangeNotifier {
  final List<dynamic> dataHome = DataReponse.dataHome['items'];
  bool playMusic = false;
}
