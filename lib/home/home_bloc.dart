import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gif_searcher/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    Map<HomeEvent, Function> mapEventIntoAction = Map();
    mapEventIntoAction.putIfAbsent(HomeStarted(), _loadFirst);
    mapEventIntoAction.putIfAbsent(HomeFetched(), _fetchMore);

    mapEventIntoAction[event]();
  }

  _fetchMore() {
    //TODO: implement fetch more
  }

  _loadFirst() {
    //TODO: implement load first gifs
  }
}
