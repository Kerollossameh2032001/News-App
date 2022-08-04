import 'package:flutter/material.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/shared/componants/reusable_widgets.dart';
import '../modules/search_screen/search_screen.dart';
import '../shared/componants/style.dart';

PreferredSizeWidget customAppBar(context,NewsCubit cubit) {
  return AppBar(
    title: Row(
      children:  [
        ClipRRect(
          borderRadius:
              BorderRadius.only(bottomRight: Radius.elliptical(20, 5)),
          child: Text(
            'News',
            style: Theme.of(context).textTheme.headline5!.copyWith(
              backgroundColor: defaultColor,
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(20, 5)),
          child: Text('App ',
              style: Theme.of(context).textTheme.headline5),
        ),
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            navigateTo(context, SearchScreen());
          },
          icon: Icon(Icons.search)),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(onPressed: (){
          cubit.changeTheme();
        }, icon: Icon(Icons.brightness_2_outlined)),
      ),
    ],
  );
}

Widget customTabBar(List<Widget> tabs, NewsCubit cubit) {
  return TabBar(
    onTap: (index) {
      if (index == 1) {
        cubit.getBusinessData();
      } else if (index == 2) {
        cubit.getEntertainmentData();
      } else if (index == 3) {
        cubit.getHealthData();
      } else if (index == 4) {
        cubit.getScienceData();
      } else if (index == 5) {
        cubit.getSportsData();
      } else if (index == 6) {
        cubit.getTechnologyData();
      }
    },
    indicatorWeight: 5,
    isScrollable: true,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    //labelColor: Colors.black87,
    unselectedLabelColor: Colors.grey,
    splashBorderRadius: BorderRadius.circular(20),
    physics: BouncingScrollPhysics(),
    tabs: tabs,
  );
}
