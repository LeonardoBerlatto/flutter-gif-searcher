import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_searcher/constants/ui_constants.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/repositories/gif_repository.dart';
import 'package:gif_searcher/theme/style.dart';

import 'home/pages/home_page.dart';

void main() => runApp(GifSearcherApp());

class GifSearcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Gif Searcher',
      home: Scaffold(
        appBar: AppBar(
          title: Image.network(UIConstants.searchBarIconUrl),
        ),
        body: BlocProvider(
          create: (context) => HomeBloc(gifRepository: new GifRepository())
            ..add(HomeFetched(numberOfGifsToFetch: 15, isLoadingMore: false)),
          child: HomePage(),
        ),
      ),
    );
  }
}
