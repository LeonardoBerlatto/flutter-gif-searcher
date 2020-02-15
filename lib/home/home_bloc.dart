import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/repositories/gif_repository.dart';
import 'package:meta/meta.dart';

import 'home_state.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GifRepository gifRepository;

  HomeBloc({@required this.gifRepository});

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(final HomeEvent event) async* {
    if (event is HomeFetched) {
      yield await _fetch(event.keyword, event.startingIndexToFetch);
    } else {
      yield await _loadHome();
    }
  }

  Future<HomeState> _fetch(
      String keyword, final int startingIndexToFetch) async {
    final gifs = await gifRepository.searchGifs('', startingIndexToFetch, 50);
    return HomeLoaded(loadedGifs: gifs);
  }

  Future<HomeState> _loadHome() async {
    final gifs = await gifRepository.fetchGifs(50);
    return HomeLoaded(loadedGifs: gifs);
  }
}
