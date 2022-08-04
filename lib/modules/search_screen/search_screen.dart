import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../shared/componants/reusable_widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        List list = cubit.searchNews;
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              title: TextFormField(
                onChanged: (value) =>
                    NewsCubit.get(context).getsearchData(value: value),
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 15.0),
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(Icons.clear)),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'time must not be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context , index)=>buildItem(list[index],context),
                separatorBuilder:  (context , index)=>SizedBox(height: 10,),
                itemCount: list.length,
            ),
        );
      },
    );
  }
}

