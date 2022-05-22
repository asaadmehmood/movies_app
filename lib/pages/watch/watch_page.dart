import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/network/api_service.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../elements/text_widgets.dart';


class WatchPage extends StatefulWidget {
  final Function callback;
  const WatchPage({Key? key,required this.callback}) : super(key: key);

  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  List<Movies> homeList= [];

@override
  void initState() {
    super.initState();

    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);
    moviesProvider.getMoviesData();
  }
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left:16.w,right: 16.w,bottom: 8.w,top: 8.w),
            margin: EdgeInsets.only(bottom: 4.w),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                        child:
                        LargeTitleTextWidget(title:"Watch",color:appColorBlack),
                      ),
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(left: 8.0,right: 8.0,top: 12.0),
                      child: Icon(Icons.search,size: 22,color: appColorBlack,),
                    ),
                  ],
                ),
                moviesProvider.moviesList.isNotEmpty ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration:  const BoxDecoration(

                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          )),
                      child:  ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: moviesProvider.moviesList.length,
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              Container(
                          height:MediaQuery.of(context).size.height/3.5,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(8),
                                  child: Image.network(
                                      ApiService.IMAGE_URL+moviesProvider.moviesList[index].backdropPath.toString(),
                                      fit: BoxFit.fill,

                                  )
                              ),
                              Positioned(
                                  left: 25,
                                  bottom: 30,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.1)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            LargeTitleTextWidget(title:moviesProvider.moviesList[index].title.toString(),color:appColorWhite),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ) : Center(child: CircularProgressIndicator(color: appColorYellow,)),
              ],
            )


        ),
      ),
    );
  }
}


