import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/screens/dashboard/dashboard_viewmodel.dart';
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class DashboardScreens extends StatefulWidget {
  const DashboardScreens({Key? key}) : super(key: key);

  @override
  _DashboardScreensState createState() {
    return _DashboardScreensState();
  }
}

class _DashboardScreensState extends State<DashboardScreens> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    try {
      var uri = Uri.https('zingmp3.vn', '/api/v2/page/get/home', {
        'page': '1',
        'count': '30',
        'ctime': DateTime.now().toUtc().toString(),
        'version': '1.9.105',
        'sig': 'c93f746208f1be449465bc8d23dcb113bb1955271466774f04d797fea57598045eca98d0dcca09286b2e24c4309d6128409a85049718a73e841ad3b181a28167',
        'apiKey': 'X5BM3w8N7MKozC0B85o4KMlzLZKhV00y'
      });
      var rs = await http.get(uri);
      if (rs.statusCode == 200) {
        var jo = convert.jsonDecode(rs.body) as Map<String, dynamic>;
        log(jo.toString());
      } else {
        print(rs.reasonPhrase);
      }
    } catch (e) {
      print('${e}  exasewe');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DashBoardViewModel>(builder: (context, vm, child) {
      var quickPlay = vm.dataHome[2]['items'];
      var dataQuickPlay = quickPlay['all'] as List;
      var justHits = vm.dataHome;
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  collapsedHeight: 80,
                  flexibleSpace: Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-0.00, 1.00),
                        end: Alignment(0, -1),
                        colors: [Color(0xFF0E7023), Color(0x000E7024)],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 30),
                            const Expanded(
                                child: Text(
                              'Hi ' + 'Den' + ' ✨',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
                            )),
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: const DecorationImage(
                                  image: NetworkImage("https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30)
                          ],
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                  floating: true,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        "Quick Play",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        margin: const EdgeInsets.only(left: 20),
                        child: GridView.builder(
                          itemCount: dataQuickPlay.length,
                          scrollDirection: Axis.horizontal,
                          addAutomaticKeepAlives: false,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            var item = dataQuickPlay[index];
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage('${item['thumbnail']}'),
                                        fit: BoxFit.contain,
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
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        item['artistsNames'],
                                        style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Just the Hits",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: GridView.builder(
                          itemCount: justHits.length,
                          scrollDirection: Axis.horizontal,
                          addAutomaticKeepAlives: false,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 190,
                          ),
                          itemBuilder: (context, index) {
                            var item = justHits[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 158,
                                  height: 158,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(item['banner'] != null ? item['banner'].toString() : item['thumbnailM'].toString()),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x7F000000),
                                        blurRadius: 24,
                                        offset: Offset(0, 8),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 22),
                                Text(
                                  // Kiểm tra những item không có title
                                  item['title'] != '' ? item['title'] ?? 'Nhạc Hits' : 'Nhạc Hits',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w700,
                                    height: 0.09,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['sectionType'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            vm.playMusic
                ? Positioned(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 83,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF151515),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: ShapeDecoration(
                                  image: const DecorationImage(
                                    image: NetworkImage("https://via.placeholder.com/48x48"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(43),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Lalkara ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.60,
                                    child: Text(
                                      'Diljit Dosanjh',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
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
                              Container(
                                width: 34,
                                height: 34,
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
                                    const Icon(Icons.play_arrow)
                                  ],
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

enum MusicType {
  Romance,
  FeelGood,
  Podcasts,
  Party,
  EDM;

  const MusicType();
}
