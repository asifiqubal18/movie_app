import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';



class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key key, this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Top Rated Movies", size: 20,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: toprated[index]['title'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500/' +
                                    toprated[index]['poster_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500/' +
                                    toprated[index]['poster_path'],
                                description: toprated[index]['overview'],
                                vote: toprated[index]['vote_average'].toString(),
                                launch_on: toprated[index]['release_date'],
                              )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/'+ toprated[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          Container(
                            child: modified_text(text: toprated[index]['title'] !=null?
                            toprated[index]['title']:'Loading'),
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