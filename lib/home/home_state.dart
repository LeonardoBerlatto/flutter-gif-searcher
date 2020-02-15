import 'package:equatable/equatable.dart';
import 'package:gif_searcher/home/models/gif_model.dart';

abstract class HomeState extends Equatable {
  final List<GifModel> loadedGifs;

  const HomeState({this.loadedGifs});

  @override
  List<Object> get props => [loadedGifs];
}

class HomeInitial extends HomeState {
  HomeInitial({List<GifModel> loadedGifs}) : super(loadedGifs: []);
}

class HomeLoaded extends HomeState {
  HomeLoaded({List<GifModel> loadedGifs}) : super(loadedGifs: loadedGifs);
}
