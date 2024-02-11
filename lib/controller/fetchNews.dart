import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:the_digital_samachar/model/newsArt.dart';

class FetchNews{
  static List sourcesId = [
    "business-insider", "entertainment-weekly",
    "financial-post", "google-news",
    "google-news-in", "medical-news-today", "national-geographic", "news24", "new-scientist",
    "next-big-future", "techcrunch", "techradar", "the-hindu","time",
  ];
  static fetchNewNews() async{
    final randm=new Random();

    var element=sourcesId[randm.nextInt(sourcesId.length)];
    // print(element);

    Response  response  = await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$element&apiKey=ade613c458dd4cc8b8d71c0633d11e53") );
    // Response  response  = await get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=ade613c458dd4cc8b8d71c0633d11e53") );

    Map body_data = jsonDecode(response.body);
    List articles=body_data["articles"];
    // return body_data["url"];
    // print(articles);

    var my_article=articles[randm.nextInt(articles.length)];
    return NewsArt.fromAPItoApp(my_article);

  }



}