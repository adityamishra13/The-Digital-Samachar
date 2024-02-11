class NewsArt {
  String imgUrl, newsDes, newsHead, newsUrl, newsCnt;

  NewsArt({
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  });

  static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
      imgUrl: article['urlToImage']??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsfj_D5cZhZ8X8hJdPOUR5V-nlp_tzy7QLpJDU-BttCQ&s",
      newsDes: article['description']??"--",
      newsCnt: article["content"]??"--",
      newsHead: article["title"]??"--",
      newsUrl: article["url"]??"https://news.google.com/search?pz=1&cf=all&hl=en-IN&q=India&gl=IN&ceid=IN:en",
    );
  }
}
