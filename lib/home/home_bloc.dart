import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gif_searcher/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    Map<HomeEvent, Function> mapEventIntoAction = Map();
    mapEventIntoAction.putIfAbsent(HomeStarted(), _loadHome);
    mapEventIntoAction.putIfAbsent(HomeFetched(), _fetch);

    mapEventIntoAction[event]();
  }

  _fetch() {
    //TODO: implement fetch more
  }

  _loadHome() {
    //TODO: implement load first gifs
  }
}
