import 'package:equatable/equatable.dart';
import 'package:gif_searcher/home/models/gif_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<GifModel> loadedGifs;

  const HomeLoaded({this.loadedGifs});

  @override
  List<Object> get props => [loadedGifs];
}
