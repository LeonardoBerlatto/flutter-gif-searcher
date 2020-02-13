import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_searcher/home/index.dart';
import 'package:gif_searcher/repositories/gif_repository.dart';

import 'home/pages/home_page.dart';

void main() => runApp(GifSearcherApp());

class GifSearcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          create: (context) =>
              HomeBloc(gifRepository: new GifRepository())..add(HomeStarted()),
          child: HomePage(),
        ),
      ),
    );
  }
}
