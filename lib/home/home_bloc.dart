import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:gif_searcher/repositories/gif_repository.dart';
import 'package:meta/meta.dart';

import 'home_state.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GifRepository gifRepository;
  static final int defaultFetchLimit = 15;

  HomeBloc({@required this.gifRepository});

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(final HomeEvent event) async* {
    if (event is HomeSearched) {
      yield await _search(
          event.keyword, event.startingIndexToFetch, event.isFetching);
    } else if (event is HomeFetched) {
      yield await _loadHome(event.numberOfGifsToFetch, event.isLoadingMore);
    }
  }

  Future<HomeState> _search(
      String keyword, final int startingIndexToFetch, bool isFetching) async {
    final List<GifModel> gifs = await gifRepository.searchGifs(
        keyword, startingIndexToFetch, defaultFetchLimit);

    if (isFetching) {
      gifs.insertAll(0, state.loadedGifs);
    }

    return HomeLoaded(loadedGifs: gifs);
  }

  Future<HomeState> _loadHome(int numberOfGifsToFetch, bool isFetching) async {
    final List<GifModel> gifs =
        await gifRepository.fetchGifs(numberOfGifsToFetch);

    if (isFetching) {
      gifs.removeRange(0, state.loadedGifs.length);
      gifs.insertAll(0, state.loadedGifs);
    }

    return HomeLoaded(loadedGifs: gifs);
  }
}
