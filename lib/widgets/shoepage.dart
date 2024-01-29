import 'package:flutter/material.dart';
import 'package:shoesapp/screens/detail.dart';

class ShoesPage extends StatefulWidget {
  const ShoesPage({super.key});

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                buildShoeCard('S Shoes', '\$3.99', 'assets/images/1.jpg', false,
                    false, context),
                buildShoeCard('Havy Shoes', '\$6.99', 'assets/images/6.jpg',
                    true, true, context),
                buildShoeCard('Sport Shoes', '\$2.99', 'assets/images/3.jpg',
                    false, false, context),
                buildShoeCard('L Shoes', '\$4.99', 'assets/images/4.jpg', true,
                    false, context),
                buildShoeCard('L Shoes', '\$5.99', 'assets/images/2.jpg', false,
                    true, context),
                buildShoeCard('P Shoes', '\$7.99', 'assets/images/7.jpg', true,
                    false, context),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget buildShoeCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(assetPath: imgPath, price: price, name: name)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0xFFEF7532),
                          )
                  ],
                ),
              ),
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.contain)),
                  )),
              SizedBox(
                height: 7.0,
              ),
              Text(
                price,
                style: TextStyle(color: Color(0xFFCC8053), fontSize: 14.0),
              ),
              Text(
                name,
                style: TextStyle(color: Color(0xFFCC8053), fontSize: 14.0),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Icon(
                        Icons.shopping_basket,
                        color: Color(0xFFD17E50),
                        size: 18.0,
                      ),
                      Text("Add to cart",
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFFD17E50)))
                    ],
                    if (added) ...[
                      Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 18.0,
                      ),
                      Text("1",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFFD17E50),
                              fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 18.0,
                      )
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
