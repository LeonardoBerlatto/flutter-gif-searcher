import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_searcher/home/home_bloc.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/widgets/gif_grid.dart';
import 'package:gif_searcher/widgets/loader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _scrollController.addListener(_onScroll);
  }

  Widget _renderGifsIfLoaded(HomeState state) {
    if (!(state is HomeLoaded)) {
      return Expanded(child: Loader());
    }
    return GifGrid(
      gifList: state.loadedGifs,
      controller: _scrollController,
    );
  }

  void _onScroll() {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;

    if (maxScroll == currentScroll) {
      _loadMore(
          text: _textController.text,
          numberOfGisLoaded: this._homeBloc.state.loadedGifs.length,
          isSearchFetching: true);
    }
  }

  _loadMore(
      {String text = '', int numberOfGisLoaded = 0, isSearchFetching = false}) {
    if (text.isNotEmpty) {
      _homeBloc.add(HomeSearched(
          isFetching: isSearchFetching,
          keyword: _textController.text,
          startingIndexToFetch: numberOfGisLoaded == 0
              ? 0
              : this._homeBloc.state.loadedGifs.length + 1));
      return;
    }
    _homeBloc.add(HomeFetched(
        numberOfGifsToFetch: numberOfGisLoaded + 15, isLoadingMore: true));
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
              controller: _textController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: 'Search Gifs'),
              onSubmitted: (String text) {
                _loadMore(text: text);
              },
            ),
          ),
          _renderGifsIfLoaded(state),
        ],
      );
    });
  }
}
