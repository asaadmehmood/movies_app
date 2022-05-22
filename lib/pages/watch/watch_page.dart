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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration:  BoxDecoration(
                      color: appColorGrey,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        )),
                    child:  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeList.length,
                      shrinkWrap: true,
                      primary: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(
                                    ApiService.IMAGE_URL+homeList[index].posterPath.toString(),
                                    fit: BoxFit.cover
                                )
                            ),
                            Positioned(
                                left: 25,
                                bottom: 25,
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
                                          Text(homeList[index].title.toString(), style: TextStyle(fontSize: 18.sp, color: Colors.white,fontWeight: FontWeight.bold)),
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
                ) : Center(child: CircularProgressIndicator(color: appColorYellow,)),
              ],
            )


        ),
      ),
    );
  }
}


