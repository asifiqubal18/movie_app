import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Trending Movies",
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500/' +
                                            trending[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500/' +
                                            trending[index]['poster_path'],
                                description: trending[index]['overview'],
                                vote: trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date'],
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          trending[index]['backdrop_path']),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            child: modified_text(
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading'),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
