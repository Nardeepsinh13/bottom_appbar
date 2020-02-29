import 'package:bottom_appbar_demo/ActPopularCatDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Act_ProductTab extends StatelessWidget {
  Act_ProductTab({this.title, this.mainContext,this.onPush});

  final String title;
  final BuildContext mainContext;
  final ValueChanged<int> onPush;

  List<dynamic> categoryList = [
    {
      "name": 'Motocross',
      'img':
      'https://images.pexels.com/photos/217872/pexels-photo-217872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    },
    {
      "name": 'Road',
      'img':
      'https://media.gettyimages.com/photos/enduro-motocross-motorbike-racing-offroad-picture-id533959917?s=612x612'
    },
    {
      "name": 'Accessories',
      'img':
      'https://www.mtcmotorcycles.co.uk/images/huge-stock-motorcycle-clothing-spares-lubricants-consumables-002.jpg'
    }
  ];

  List<dynamic> popularCatgoriesList = [
    {
      "name": 'Helments',
      'img': 'https://images-na.ssl-images-amazon.com/images/I/415A-EjoKEL._SX466_.jpg'
    },
    {
      "name": 'Gloves',
      'img': 'https://img2.bgxcdn.com/thumb/large/oaupload/banggood/images/8B/24/ea84d455-70e1-4bdf-8e1b-aff7c5c553c8.jpg'
    },
    {
      "name": 'Jackets',
      'img': 'https://cdn.shopify.com/s/files/1/2479/3086/products/8b003d72d8c832e81564cbf64f1a180b@2x.jpg?v=1527330392'
    },
    {
      "name": 'Pads',
      'img': 'https://images-na.ssl-images-amazon.com/images/I/61KCPTq5YOL._AC_SY355_.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              _widgetCategory(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Text('Popular Categories', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0, color: Colors.green),),
              ),
              _widgetPopularCategory(),
            ],
          ),
        ));
  }

  Widget _widgetCategory(){
    return Row(
      children: categoryList
          .map((item) => Expanded(
        child: InkWell(
          onTap: () => onPush(500),
          child: Container(
            height: 80.0,
            margin: EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                    image: NetworkImage(item['img']),
                    fit: BoxFit.cover)),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                item['name'],
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ))
          .toList(),
    );
  }

  Widget _widgetPopularCategory(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        children: popularCatgoriesList
            .map((item) => InkWell(
          onTap: () => Navigator.push(mainContext, MaterialPageRoute(builder: (context) => ActPopularCatDetails())),
          child: Container(
            height: 70.0,
            width: 80,
            margin: EdgeInsets.symmetric(
                horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                    image: NetworkImage(item['img']),
                    fit: BoxFit.cover)),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                item['name'],
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white),
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }


//  Widget _buildList() {
//    return ListView.builder(
//        itemCount: materialIndices.length,
//        itemBuilder: (BuildContext content, int index) {
//          return Container(
//            color: Colors.red,
//            child: ListTile(
//              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
//              trailing: Icon(Icons.chevron_right),
//              onTap: () => onPush(100),
//            ),
//          );
//        });
//  }
}
