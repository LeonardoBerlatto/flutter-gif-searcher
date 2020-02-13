import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/repositories/gif_repository.dart';
import 'package:meta/meta.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GifRepository gifRepository;

  HomeBloc({@required this.gifRepository});

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(final HomeEvent event) async* {
    Map<HomeEvent, Future<HomeState>> mapEventIntoAction = Map();
    mapEventIntoAction.putIfAbsent(HomeStarted(), _loadHome);
    mapEventIntoAction.putIfAbsent(HomeFetched(), _fetch);

    yield await mapEventIntoAction[event];
  }

  Future<HomeState> _fetch() async {
    //TODO: load gifs
    return HomeLoaded(loadedGifs: null);
  }

  Future<HomeState> _loadHome() async {
    final gifs = await gifRepository.fetchGifs(50);
    return HomeLoaded(loadedGifs: gifs);
  }
}
