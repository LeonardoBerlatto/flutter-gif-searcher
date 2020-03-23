import 'package:flutter/material.dart';
import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  final GifModel gif;

  GifPage({this.gif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gif.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed:() {
            Share.share(gif.bitlyGifUrl);
          } )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(gif.images['fixed_width'].url),
      ),
    );
  }
}
