import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart';



class TV extends StatelessWidget {
  final List tv;

  const TV({Key key, this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Populor Tv shows", size: 20,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: tv[index]['title'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500/' +
                                    tv[index]['poster_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500/' +
                                    tv[index]['poster_path'],
                                description: tv[index]['overview'],
                                vote: tv[index]['vote_average'].toString(),
                                launch_on: tv[index]['release_date'],
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
                                        'https://image.tmdb.org/t/p/w500/'+ tv[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          Container(
                            child: modified_text(text: tv[index]['original_name'] !=null?
                            tv[index]['original_name']:'Loading'),
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
