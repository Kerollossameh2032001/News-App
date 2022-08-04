import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import '../../shared/componants/reusable_widgets.dart';
import '../wib_view/wid_view.dart';
import 'details_widgets.dart';

class DetailsScreen extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? date;
  final String? describtion;
  final String? content;
  final String? url;

  DetailsScreen({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.describtion,
    required this.content,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var relatedNews = cubit.allNews;
        return Scaffold(
          appBar: detailsCustomAppBar(context, imageUrl, date),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(title,context),
                  buildBody(context, describtion),
                  TextButton(
                      onPressed: () {
                        navigateTo(context, WebViewScreen(url: url));
                      },
                      child: Text(
                        "Source Link",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(height: 30.0),
                  Text(
                    "Related news",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        //color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  ...relatedNews.map((e) => buildItem(e, context)).toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
