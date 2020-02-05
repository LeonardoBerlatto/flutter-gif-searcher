import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeFetched extends HomeEvent {
  final int lastPageFetched;

  @override
  List<Object> get props => [lastPageFetched];

  const HomeFetched({this.lastPageFetched});
}
