import 'package:angelhacks/customWidgets/TutorialBackgroundBlur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/constants.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'video.dart';
import '../pages/favoritePages/ListOfFavoriteCards.dart';
import '../pages/favoritePages/favoriteTopic.dart';

enum Heart {
  isFavorite,
  notFavorite,
}

class TutorialSubPage extends StatefulWidget {
  final String title;
  final Image image;
  final String paragraph;
  final String videoID;
  final List steps;
  final Image backImage;
  final Color color;

  TutorialSubPage({
    @required this.title,
    this.image,
    this.paragraph,
    this.steps,
    this.videoID,
    this.backImage,
    this.color,
  });

  @override
  _TutorialSubPageState createState() => _TutorialSubPageState();
}

class _TutorialSubPageState extends State<TutorialSubPage> {
  Function playVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "asdfuhjagvefjkhgv", //DO NOT TOUCH
      videoUrl: widget.videoID,
    );
  }

  bool heartSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          TutorialBackgroundBlur(
            gradientColor: widget.color,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 400.0,
                  color: Colors.grey,
                  child: widget.image,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          playVideo();
                        },
                        child: Text(
                          'Watch Video',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (heartSelected) {
                              heartSelected = false;
                              //add to favoritesList
                              favoriteTopics.add(
                                Topics(
                                  topicTitle: widget.title,
                                  topicImage: widget.image,
                                  paragraph: widget.paragraph,
                                  steps: widget.steps,
                                  video: widget.videoID,
                                ),
                              );
                            } else {
                              heartSelected = true;
                              //remove to favoritesList
                              // favoriteTopics.add(
                              //   Topics(
                              //     topicTitle: widget.title,
                              //     topicImage: widget.image,
                              //     paragraph: widget.paragraph,
                              //     steps: widget.steps,
                              //     video: widget.videoID,
                              //   ),
                              //  );

                              favoriteTopics.removeWhere(
                                  (topicTitle) => topicTitle == widget.title);
                            }
                            //TODO: FAVORITES functionality goes here
                            //print("heart has been selected");
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 180.0),
                          child: Icon(
                            heartSelected
                                ? Icons.favorite_border
                                : Icons.favorite,
                            color: heartSelected ? Colors.white : Colors.pink,
                            size: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: Text(
                    '${widget.paragraph}',
                    style: kParagraphTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    //vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          child: widget.steps != null
                              ? Text(
                                  'Follow these steps!',
                                  style: kTitleTextStyle,
                                  textAlign: TextAlign.left,
                                )
                              : null),
                      for (var item in widget.steps)
                        Text(
                          item + "\n",
                          style: kParagraphTextStyle,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
