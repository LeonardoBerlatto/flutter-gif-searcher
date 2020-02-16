import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_searcher/home/home_bloc.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:gif_searcher/widgets/gif_grid.dart';
import 'package:gif_searcher/widgets/loader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  Widget _renderGifsIfLoaded(HomeState state) {
    if (!(state is HomeLoaded)) {
      return Loader();
    }
    return GifGrid(gifList: state.loadedGifs);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (final BuildContext context, final HomeState state) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: 'Search Gifs'),
            ),
          ),
          _renderGifsIfLoaded(state),
        ],
      );
    });
  }
}
