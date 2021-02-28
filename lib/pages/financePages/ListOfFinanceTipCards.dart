import 'package:flutter/material.dart';
import 'package:angelhacks/customWidgets/TipCard.dart';
import 'package:angelhacks/classes/Finance.dart';

class ListOfFinanceTipCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: financeTopics.length,
        itemBuilder: (BuildContext context, int index) {
          return TipCard(
            topicTitle: financeTopics[index].topicTitle,
            //topicDescription: financeTopics[index].topicDescription,
            topicImage: financeTopics[index].topicImage,
          );
        },
      ),
    );
  }
}