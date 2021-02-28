import 'package:angelhacks/customWidgets/BlurBackground.dart';
import 'package:flutter/material.dart';
import 'package:angelhacks/data/constants.dart';

import 'ListOfFavoriteCards.dart';

//import 'ListOfFinanceTipCards.dart';


class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,

      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Favorites",
          style: kAppBarTextStyle,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -150,

            bottom: 0.0,

            // height: kHouseDimensions,
            // width: kHouseDimensions,
            child: Icon(
              Icons.favorite_border,
              size: 500,
              color: Colors.pink,
            ),
          ),

          BlurBackground(
            gradientColor: Colors.pink,
          ),
          ListOfFavoriteCards(),

        ],
      ),
    );
  }
}