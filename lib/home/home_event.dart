import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeFetched extends HomeEvent {
  final int startingIndexToFetch;
  final String keyword;

  @override
  List<Object> get props => [startingIndexToFetch, keyword];

  const HomeFetched({this.startingIndexToFetch, this.keyword});
}
