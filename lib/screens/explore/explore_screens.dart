import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/res_local/api_local.dart';
import 'package:music_app/screens/dashboard/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

import '../info_music/info_music.dart';

class ExploreScreens extends StatefulWidget {
  const ExploreScreens({Key? key}) : super(key: key);

  @override
  _ExploreScreensState createState() {
    return _ExploreScreensState();
  }
}

class _ExploreScreensState extends State<ExploreScreens> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void PlayMusic(String title, String artist, String thumbnail, item) {
    Modular.to.push(MaterialPageRoute(
        builder: (context) => InfoMusicScreens(
              title: title,
              artist: artist,
              thumbnail: thumbnail,
              item: item,
            )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DashBoardViewModel>(builder: (context, vm, child) {
      var quickPlay = vm.dataHome[2]['items'];
      var dataQuickPlay = quickPlay['all'] as List;
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: Colors.white,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Bạn muốn nghe gì?',
                      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      icon: Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none,
                      iconColor: Colors.white),
                  onSaved: (value) {},
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Duyệt tìm tất cả',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                      itemCount: dataQuickPlay.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 90, mainAxisSpacing: 12, crossAxisSpacing: 12),
                      itemBuilder: (context, index) {
                        var item = dataQuickPlay[index];
                        return GestureDetector(
                          onTap: () {
                            PlayMusic(item['title'], item['artistsNames'], item['thumbnail'], item);
                            vm.isPlay = true;
                            vm.notifyListeners();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 8, left: 8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('${item['thumbnail']}'),
                                  fit: BoxFit.fitWidth,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset.fromDirection(-0.5),
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: Text(
                              item['title'] == '' ? 'Không tên' : item['title'],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.yellowAccent),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            vm.playMusic
                ? Positioned(
                    bottom: 8,
                    left: 25,
                    child: GestureDetector(
                      onTap: () {
                        PlayMusic(vm.title, vm.artist, vm.thumbnail, vm.item);
                        vm.playMusic = false;
                        vm.notifyListeners();
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width - 50,
                            height: 83,
                            decoration: BoxDecoration(
                                color: const Color(0xFF151515),
                                borderRadius: BorderRadius.circular(17),
                                boxShadow: [BoxShadow(color: Colors.white, offset: Offset.fromDirection(1), spreadRadius: 1, blurRadius: 10)]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(vm.thumbnail),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(43),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              vm.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              vm.artist,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: 32,
                                        height: 32,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Icon(
                                          Icons.skip_previous,
                                          color: Colors.white,
                                        )),
                                    SizedBox(
                                      width: 34,
                                      height: 34,
                                      child: GestureDetector(
                                        onTap: () {
                                          vm.isPlay = !vm.isPlay;
                                          vm.notifyListeners();
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 34,
                                              height: 34,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(34.62),
                                                ),
                                              ),
                                            ),
                                            Icon(!vm.isPlay ? Icons.play_arrow : Icons.pause)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: 32,
                                        height: 32,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Icon(
                                          Icons.skip_next,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 4,
                            child: GestureDetector(
                              onTap: () {
                                vm.playMusic = false;
                                vm.notifyListeners();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      );
    });
  }
}
