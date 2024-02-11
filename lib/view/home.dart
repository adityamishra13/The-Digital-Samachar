import 'package:flutter/material.dart';
import 'package:the_digital_samachar/controller/fetchNews.dart';
import 'package:the_digital_samachar/model/newsArt.dart';
import 'package:the_digital_samachar/view/widgets/NewsContainer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLoading = true;

  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNewNews();

    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState(){
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          // itemCount: 10,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {

            return isLoading ? Center(child: CircularProgressIndicator(),) : NewsContainer(
              imgUrl:newsArt.imgUrl,
              newsCnt:newsArt.newsCnt,
              newsDes:  newsArt.newsDes,
              newsHead:newsArt.newsHead,
              newsUrl:newsArt.newsUrl,
              // child: Text("Page no. $index"),
            );
          }),
    );
  }
}