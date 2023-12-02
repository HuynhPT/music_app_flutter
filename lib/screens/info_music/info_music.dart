import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/screens/dashboard/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

class InfoMusicScreens extends StatefulWidget {
  const InfoMusicScreens({
    Key? key,
    this.title = '',
    this.artist = '',
    this.thumbnail = '',
    required this.item,
  }) : super(key: key);
  final String title;
  final String artist;
  final String thumbnail;
  final dynamic item;
  @override
  State<InfoMusicScreens> createState() {
    return _InfoMusicScreensState();
  }
}

class _InfoMusicScreensState extends State<InfoMusicScreens> {
  @override
  void initState() {
    super.initState();
    Provider.of<DashBoardViewModel>(context, listen: false).item = widget.item;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DashBoardViewModel>(builder: (context, vm, child) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              vm.playMusic = true;
              vm.thumbnail = widget.thumbnail;
              vm.title = widget.title;
              vm.artist = widget.artist;
              Modular.to.pop();
              vm.notifyListeners();
            },
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
          title: Center(
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                vm.setDataFavorite(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  vm.dataFavorite.contains(widget.item) ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 340,
                  height: 340,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage(widget.thumbnail),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.artist,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Slider(
                      value: 100 / 2.5,
                      onChanged: (val) {},
                      max: 100,
                      min: 0,
                      thumbColor: Colors.white,
                      inactiveColor: Colors.grey,
                      activeColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('1:30',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                          Text('3:45',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: SvgPicture.asset(
                                'assets/icons/shuffle.svg',
                                width: 40,
                                height: 40,
                                color: Colors.white,
                              )),
                          const SizedBox(width: 12),
                          Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                                size: 40,
                              )),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: GestureDetector(
                              onTap: () {
                                vm.isPlay = !vm.isPlay;
                                vm.notifyListeners();
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    !vm.isPlay ? Icons.play_arrow : Icons.pause,
                                    size: 40,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                                size: 40,
                              )),
                          const SizedBox(width: 12),
                          Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: SvgPicture.asset(
                                'assets/icons/repeat.svg',
                                width: 40,
                                height: 40,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
