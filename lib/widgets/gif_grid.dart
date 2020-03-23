import 'package:flutter/material.dart';
import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:gif_searcher/home/pages/gif_page.dart';
import 'package:gif_searcher/widgets/loader.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

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
        child: FadeInImage.memoryNetwork(
          image: gifList[index].images['fixed_width'].url,
          placeholder: kTransparentImage,
          height: 300,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GifPage(
                        gif: gifList[index],
                      )));
        },
        onLongPress: () => Share.share(gifList[index].bitlyGifUrl),
      );
    }
    return Loader();
  }
}
