abstract class NewsStates {}

class NewsIntialState extends NewsStates {}

class NewsAllLoadingState extends NewsStates {}

class NewsAllSuccesState extends NewsStates {}

class NewsAllErrorState extends NewsStates {
  final String error;

  NewsAllErrorState(this.error);
}

class NewsBusinessLoadingState extends NewsStates {}

class NewsBusinessSuccesState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {
  final String error;

  NewsBusinessErrorState(this.error);
}

class NewsEntertainmentLoadingState extends NewsStates {}

class NewsEntertainmentSuccesState extends NewsStates {}

class NewsEntertainmentErrorState extends NewsStates {
  final String error;

  NewsEntertainmentErrorState(this.error);
}

class NewsHealthLoadingState extends NewsStates {}

class NewsHealthSuccesState extends NewsStates {}

class NewsHealthErrorState extends NewsStates {
  final String error;

  NewsHealthErrorState(this.error);
}

class NewsScienceLoadingState extends NewsStates {}

class NewsScienceSuccesState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {
  final String error;

  NewsScienceErrorState(this.error);
}

class NewsSportsLoadingState extends NewsStates {}

class NewsSportsSuccesState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  final String error;

  NewsSportsErrorState(this.error);
}


class NewsTechnologyLoadingState extends NewsStates {}

class NewsTechnologySuccesState extends NewsStates {}

class NewsTechnologyErrorState extends NewsStates {
  final String error;

  NewsTechnologyErrorState(this.error);
}


class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccesState extends NewsStates {}

class NewsSearchErrorState extends NewsStates {
  final String error;

  NewsSearchErrorState(this.error);
}

class NewsChangeThemeState extends NewsStates {}
