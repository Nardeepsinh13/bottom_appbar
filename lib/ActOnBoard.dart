import 'package:bottom_appbar_demo/ZoomPage.dart';
import 'package:flutter/material.dart';

class ActOnBoard extends StatefulWidget {
  @override
  _ActOnBoardState createState() => _ActOnBoardState();
}

class _ActOnBoardState extends State<ActOnBoard> {
  PageController controller = PageController();
  int pageIndex = 0;
  List<String> imgList = [
    "https://images.unsplash.com/photo-1578253809350-d493c964357f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
    "https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.unsplash.com/photo-1578253809350-d493c964357f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: imgList
            .map((item) => Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    ZoomPage(
                      imgUrl: item,
                    ),
                    FlatButton(
                      color: Colors.white,
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
//                        controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.ease);
                      if(pageIndex == imgList.length-1){
                        print("finish");
                      }else{

                        setState(() {
                          pageIndex++;
                        });
                        controller.jumpToPage(pageIndex);
                      }
                      },
                    )
                  ],
                ))
            .toList(),
      )),
    );
  }
}
