import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/screens/dashboard/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

import '../info_music/info_music.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({Key? key}) : super(key: key);

  @override
  _ProfileScreensState createState() {
    return _ProfileScreensState();
  }
}

class _ProfileScreensState extends State<ProfileScreens> {
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
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                //App bar
                SliverAppBar(
                  collapsedHeight: 100,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 35,
                                  child: Text('A'),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  children: const [
                                    Text(
                                      'Tên user name',
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
                                    ),
                                    Text('Sở thích', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration:
                                      BoxDecoration(border: Border.all(width: 1, color: Colors.white), borderRadius: BorderRadius.circular(20)),
                                  child: const Text('Chỉnh sửa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(
                                    Icons.share_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),

                //body
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Danh sách yêu thích',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        vm.dataFavorite.isNotEmpty
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                    itemCount: vm.dataFavorite.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, mainAxisExtent: 90, mainAxisSpacing: 12, crossAxisSpacing: 12),
                                    itemBuilder: (context, index) {
                                      var item = vm.dataFavorite[index];
                                      return GestureDetector(
                                        onTap: () {
                                          PlayMusic(item['title'], item['artistsNames'], item['thumbnail'], item);
                                          vm.isPlay = true;
                                          vm.notifyListeners();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage('${item['thumbnail']}'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item['title'] == '' ? 'Không tên' : item['title'],
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.yellowAccent),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      vm.removeDataFavorite(item, context);
                                                    },
                                                    child: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.pink,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(
                                    'Danh sách yêu thích trống....',
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                )
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
