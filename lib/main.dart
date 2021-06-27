import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green),

    );
  }
}
class Home extends StatefulWidget {
  @override


  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingmovies =[];
  List topratedmovies=[];
  List tv = [];
  final String apikey ='b554e48c2d8fcb11923e3e27f6bc6a96';
  final String readAcccesToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNTU0ZTQ4YzJkOGZjYjExOTIzZTNlMjdmNmJjNmE5NiIsInN1YiI6IjYwZDdmNDBmNmMwYjM2MDA1ZTkxMWJmMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fHmoyd-WRYaS_P-PC7WKO8gOvVlh5YPQG-vsPxA2l7w';

   @override
   void initState(){
     loadmovies();
     super.initState();

   }

   loadmovies()async{
     TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apikey, readAcccesToken),
     logConfig: ConfigLogger(
       showLogs: true,
       showErrorLogs: true,
     ));
     Map trendingresult =  await tmdbwithCustomLogs.v3.trending.getTrending();
     Map topratedresult =  await tmdbwithCustomLogs.v3.movies.getTopRated();
     Map tvresult =  await tmdbwithCustomLogs.v3.tv.getPouplar();
     print(trendingresult);
     setState(() {
        trendingmovies= trendingresult['results'];
        topratedmovies= topratedresult['results'];
        tv=tvresult['results'];
     });
     print(trendingmovies);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: modified_text(text :'Movies💖'),
      backgroundColor: Colors.black,
      centerTitle: true,),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingmovies,),
          TopRated(toprated: topratedmovies,),

          TV(tv: tv,),
        ],
      ),
    );
  }
}
