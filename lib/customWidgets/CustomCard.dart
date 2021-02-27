import 'package:flutter/material.dart';
import 'package:angelhacks/data/constants.dart';
import 'dart:ui';

class CustomCard extends StatelessWidget {
  final String cardName;
  final IconData cardIcon;
  final Function cardTapped;

  CustomCard({
    this.cardIcon,
    @required this.cardName,
    this.cardTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardTapped,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: kBlurAmount,
            sigmaY: kBlurAmount,
          ),
          child: Container(
            height: kCardDimensions,
            width: kCardDimensions,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(15.0),
              // border: Border.all(
              //   width: 1.5,
              //   color: Colors.white.withOpacity(0.2),
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  cardIcon,
                  size: 80.0,
                  color: Colors.white,
                ),
                Text(
                  cardName,
                  style: kCardTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}