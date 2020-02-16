import 'package:flutter/material.dart';
import 'package:gif_searcher/home/models/gif_model.dart';

class GifGrid extends StatelessWidget {
  final List<GifModel> gifList;

  const GifGrid({@required this.gifList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: gifList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Image.network(
                gifList[index].images['fixed_width'].url,
                height: 300,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
