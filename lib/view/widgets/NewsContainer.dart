import 'package:flutter/material.dart';
import 'package:the_digital_samachar/view/detailViewScreen.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl, newsDes, newsHead, newsUrl,newsCnt;
  NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          FadeInImage.assetNetwork(
              height: 220,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "assets/img/placeholder.jfif",
              image: imgUrl),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsHead.length > 90
                      ? "${newsHead.substring(0, 90)}..."
                      : newsHead,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 15,color: Colors.blue),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  newsCnt!='--'?
                  newsCnt.length > 250 ?
                     newsCnt.substring(0, 250):
                  newsCnt.substring(0,newsCnt.length-13):newsCnt,
                  // newsCnt,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    // print("Going to $newsUrl");
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailViewScreen(newsUrl: newsUrl,)));
                  },
                  child: Text("Read in detail"),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
