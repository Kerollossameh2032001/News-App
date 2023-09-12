import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/network/dio_helper.dart';

import '../../modules/all/all_news_screen.dart';
import '../../modules/business/business_screen.dart';
import '../../modules/entertainment/entertainment_screen.dart';
import '../../modules/health/health_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sport_screen.dart';
import '../../modules/technology/technology_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> tabs = [
    const Tab(child: Text("All news")),
    const Tab(child: Text("Business")),
    const Tab(child: Text("Entertainment")),
    const Tab(child: Text("Health")),
    const Tab(child: Text("Science")),
    const Tab(child: Text("Sports")),
    const Tab(child: Text("Technology")),
  ];

  List<Widget> screen = [
    AllNewsScreen(),
    BusinessScreen(),
    EntertainmentScreen(),
    HealthScreen(),
    ScienceScreen(),
    SportsScreen(),
    TechnologyScreen(),
  ];

  List allNews = [];
  void getAllData() {
    if(allNews.isEmpty){
      emit(NewsAllLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
        },
      ).then((value) {
        allNews = value.data['articles'];
        print(allNews);
        emit(NewsAllSuccesState());
      }).catchError((error) {
        emit(NewsAllErrorState(error));
      });
    }else{
      emit(NewsAllSuccesState());
    }
  }


  List businessNews = [];
  void getBusinessData() {
    if(businessNews.isEmpty){
      emit(NewsBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
        },
      ).then((value) {
        businessNews = value.data['articles'];
        emit(NewsBusinessSuccesState());
      }).catchError((error) {
        emit(NewsBusinessErrorState(error));
      });
    }else{
      emit(NewsBusinessSuccesState());
    }

  }


  List entertainmentNews = [];

  void getEntertainmentData() {
    if(entertainmentNews.isEmpty){
      emit(NewsEntertainmentLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'entertainment',
          'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
        },
      ).then((value) {
        entertainmentNews = value.data['articles'];
        emit(NewsEntertainmentSuccesState());
      }).catchError((error) {
        emit(NewsEntertainmentErrorState(error));
      });
    }else{
      emit(NewsEntertainmentSuccesState());
    }
  }


  List healthNews = [];
  void getHealthData() {
    if(healthNews.isEmpty){
      emit(NewsHealthLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'health',
          'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
        },
      ).then((value) {
        healthNews = value.data['articles'];
        emit(NewsHealthSuccesState());
      }).catchError((error) {
        emit(NewsHealthErrorState(error));
      });
    }else{
      emit(NewsHealthSuccesState());
    }

  }

  List scienceNews = [];
  void getScienceData() {
    if(scienceNews.isEmpty){
      emit(NewsScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
        },
      ).then((value) {
        scienceNews = value.data['articles'];
        emit(NewsScienceSuccesState());
      }).catchError((error) {
        emit(NewsScienceErrorState(error));
      });
    }else{
      emit(NewsScienceSuccesState());
    }

  }


  List sportsNews = [];
  void getSportsData() {
    if(sportsNews.isEmpty){
      emit(NewsSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'add3ecc4f2a4420f8712101f4f605441',
        },
      ).then((value) {
        sportsNews = value.data['articles'];
        emit(NewsSportsSuccesState());
      }).catchError((error) {
        emit(NewsSportsErrorState(error));
      });
    }else{
      emit(NewsSportsSuccesState());
    }

  }


  List technologyNews = [];
  void getTechnologyData() {
    if(technologyNews.isEmpty){
      emit(NewsTechnologyLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'technology',
          'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
        },
      ).then((value) {
        technologyNews = value.data['articles'];
        emit(NewsTechnologySuccesState());
      }).catchError((error) {
        emit(NewsTechnologyErrorState(error));
      });
    }else{
      emit(NewsTechnologySuccesState());
    }
  }


  List searchNews = [];
  void getsearchData({required String value}) {
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': 'c9513cdf340f4da28926ce9d1018cced',
      },
    ).then((value) {
      searchNews = value.data['articles'];
      emit(NewsSearchSuccesState());
    }).catchError((error) {
      emit(NewsSearchErrorState(error));
    });
  }

  bool isDark = false;
  void changeTheme(){
    isDark = !isDark;
    emit(NewsChangeThemeState());
  }

}
