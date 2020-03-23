import 'package:flutter/material.dart';
import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:gif_searcher/home/pages/gif_page.dart';
import 'package:gif_searcher/widgets/loader.dart';
import 'package:share/share.dart';

class GifGrid extends StatelessWidget {
  final List<GifModel> gifList;
  final ScrollController controller;

  const GifGrid({@required this.gifList, this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          controller: controller,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: gifList.length + 1,
          itemBuilder: (BuildContext context, int index) =>
              _renderGifOrLoaderByIndex(index, context)),
    );
  }

  _renderGifOrLoaderByIndex(int index, BuildContext context) {
    if (index < gifList.length) {
      String gifUrl = gifList[index].images['fixed_width'].url;

      return GestureDetector(
        child: Image.network(
          gifUrl,
          height: 300,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => GifPage(gif: gifList[index],)));
        },
        onLongPress: () => Share.share(gifUrl),
      );
    }
    return Loader();
  }
}
