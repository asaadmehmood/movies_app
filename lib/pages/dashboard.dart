import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/pages/watch/watch_page.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_constants.dart';
import 'package:movies_app/utils/app_images.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  GlobalKey<_DashboardPageState> homePageState = GlobalKey<_DashboardPageState>();
  List<Widget>? _screens;
  int _selectedIndex = 1;

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [

      WatchPage(
        key: homePageState,
        callback: (value) {
          setState(() {
            _onItemTapped(value);
          });
        },
      ), WatchPage(
        key: homePageState,
        callback: (value) {
          setState(() {
            _onItemTapped(value);
          });
        },
      ), WatchPage(
        key: homePageState,
        callback: (value) {
          setState(() {
            _onItemTapped(value);
          });
        },
      ), WatchPage(
        key: homePageState,
        callback: (value) {
          setState(() {
            _onItemTapped(value);
          });
        },
      ),
       ];
//    _syncProvider.addListener(() {
//      updateUI();
//    });
//    WidgetsBinding.instance?.addPostFrameCallback((_) {
//      _syncProvider.syncAppData(context);
//
//    });
  }

  updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,  designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true, );

    return
//      _syncProvider.isDataSynced
//        ? SafeArea(
//      child: Scaffold(
//          body: _screens![_selectedIndex],
//          bottomNavigationBar: _generateBottomBar()),
//    )
//        :
    Scaffold(
      body: _screens![_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0)),
          child: _generateBottomBar()),
    );
  }

  BottomNavigationBar _generateBottomBar() {
    return BottomNavigationBar(
      selectedItemColor: appColorWhite,
      unselectedItemColor: appColorGrey,
      selectedFontSize: 9.5.sp,
      unselectedFontSize: 9.5.sp,
      elevation: 24,
      backgroundColor: appColorBlack,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Padding(
                padding: EdgeInsets.all(5.w),
                child: Image.asset(
                  libImage,
                  width: 20.w,
                  height: 20.h,
                ))
                : Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                libImage,
                width: 20.w,
                height: 20.h,
              ),
            ),
            label: dashboard),
        BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Padding(
                padding: EdgeInsets.all(5.w),
                child: Image.asset(
                  watchImage,
                  width: 20.w,
                  height: 20.h,
                ))
                : Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Image.asset(
                watchImage,
                width: 20.w,
                height: 20.h,
              ),
            ),
            label: watch),
        BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Padding(
              padding: EdgeInsets.all(5.w),
              child: Image.asset(
                libImage,
                width: 20.w,
                height: 20.h,
              ),
            )
                : Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Image.asset(
                libImage,
                width: 20.w,
                height: 20.h,
              ),
            ),
            label: library),

        BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Padding(
              padding: EdgeInsets.all(2.w),
              child: const Icon(
                Icons.segment,
                size: 28,
                color: Colors.green,
              ),
            )
                : Padding(
              padding: EdgeInsets.all(2.0.w),
              child: const Icon(
                Icons.segment,
                size: 28,
                color: Colors.grey,
              ),
            ),
            label: more),
      ],
    );
  }
}
