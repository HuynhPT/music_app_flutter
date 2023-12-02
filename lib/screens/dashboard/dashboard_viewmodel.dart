import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/res_local/api_local.dart';

class DashBoardViewModel extends ChangeNotifier {
  final List<dynamic> dataHome = DataReponse.dataHome['items'];
  final List<dynamic> dataFavorite = [];
  dynamic item = {};
  bool playMusic = false;
  bool isPlay = false;
  String thumbnail = '';
  String title = '';
  String artist = '';

  Future<void> setDataFavorite(BuildContext context) async {
    try {
      if (dataFavorite.contains(item)) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Bài hát đã tồn tại trong mục yêu thích, bạn có muốn xoá bỏ khỏi mục yêu thích không?'),
                actions: [
                  ElevatedButton(onPressed: () => Modular.to.pop(context), child: const Text('Huỷ')),
                  ElevatedButton(
                      onPressed: () {
                        var index = dataFavorite.indexOf(item);
                        Modular.to.pop(context);
                        dataFavorite.removeAt(index);
                        notifyListeners();
                      },
                      child: const Text('Đồng ý')),
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Bài hát đã được thêm vào mục yêu thích'),
              );
            });
        dataFavorite.insert(0, item);
      }
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeDataFavorite(data, BuildContext context) async {
    try {
      if (dataFavorite.contains(data)) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Bạn có chắc chắn muốn xoá bỏ khỏi mục yêu thích không?'),
                actions: [
                  ElevatedButton(onPressed: () => Modular.to.pop(context), child: const Text('Huỷ')),
                  ElevatedButton(
                      onPressed: () {
                        var index = dataFavorite.indexOf(data);
                        Modular.to.pop(context);
                        dataFavorite.removeAt(index);
                        notifyListeners();
                      },
                      child: const Text('Đồng ý')),
                ],
              );
            });
      }
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }

  @override
  void notifyListeners() => super.notifyListeners();
}
