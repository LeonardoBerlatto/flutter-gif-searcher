import 'package:flutter/material.dart';
import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:gif_searcher/home/pages/gif_page.dart';
import 'package:gif_searcher/widgets/loader.dart';

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
      return GestureDetector(
        child: Image.network(
          gifList[index].images['fixed_width'].url,
          height: 300,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => GifPage(gif: gifList[index],)));
        },
      );
    }
    return Loader();
  }
}
