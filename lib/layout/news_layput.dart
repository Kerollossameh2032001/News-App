import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/layout_widget.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return DefaultTabController(
          length: cubit.screen.length,
          child: Scaffold(
            appBar: customAppBar(context,cubit),
            body: Container(
              child: Column(
                children: [
                  customTabBar(cubit.tabs, cubit),
                  Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: cubit.screen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
