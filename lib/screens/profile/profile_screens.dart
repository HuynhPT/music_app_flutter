import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
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
                    Row(
                      children: [
                        SizedBox(width: 16),
                        CircleAvatar(
                          child: Text('A'),
                          radius: 35,
                        ),
                        SizedBox(width: 12),
                        Column(
                          children: [
                            Text(
                              'Tên user name',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
                            ),
                            Text('Sở thích', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white))
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.white), borderRadius: BorderRadius.circular(20)),
                            child: Text('Chỉnh sửa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Icon(
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
                SizedBox(height: 20)
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
                  Text(
                    'Danh sách yêu thích',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 90, mainAxisSpacing: 12, crossAxisSpacing: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                            decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Tên nhạc ' + index.toString(),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
