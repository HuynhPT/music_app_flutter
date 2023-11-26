import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                decoration: InputDecoration(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Text(
            'Duyệt tìm tất cả',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
                itemCount: 16,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 90, mainAxisSpacing: 12, crossAxisSpacing: 12),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      'Tên nhạc ' + index.toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
