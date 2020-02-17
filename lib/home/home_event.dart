import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetched extends HomeEvent {
  final int numberOfGifsToFetch;
  final bool isLoadingMore;

  HomeFetched(
      {@required this.numberOfGifsToFetch, @required this.isLoadingMore});
}

class HomeSearched extends HomeEvent {
  final int startingIndexToFetch;
  final String keyword;
  final bool isFetching;

  @override
  List<Object> get props => [startingIndexToFetch, keyword];

  const HomeSearched(
      {@required this.startingIndexToFetch,
      @required this.keyword,
      @required this.isFetching});
}
