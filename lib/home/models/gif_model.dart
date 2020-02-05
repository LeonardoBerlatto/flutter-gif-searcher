import 'package:gif_searcher/home/models/image_model.dart';

class GifModel {
  String id;
  String url;
  String bitlyGifUrl;
  String bitlyUrl;
  String title;
  List<ImageModel> images;

  GifModel(
      {String id,
      String url,
      String bitlyGifUrl,
      String bitlyUrl,
      String title,
      List<ImageModel> images}) {
    this.id = id;
    this.url = url;
    this.bitlyGifUrl = bitlyGifUrl;
    this.bitlyUrl = bitlyUrl;
    this.title = title;
    this.images = images;
  }

  GifModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    title = json['title'];
  }
}
