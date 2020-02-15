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
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      title: 'Gif Searcher',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.network('https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif'),
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
