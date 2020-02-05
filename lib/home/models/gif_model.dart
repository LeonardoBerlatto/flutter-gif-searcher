import 'package:gif_searcher/home/models/image_model.dart';

class GifModel {
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String title;
  List<ImageModel> images;

  GifModel(
      {String id,
      String url,
      String slug,
      String bitlyGifUrl,
      String bitlyUrl,
      String title,
      List<ImageModel> images}) {
    this.id = id;
    this.url = url;
    this.slug = slug;
    this.bitlyGifUrl = bitlyGifUrl;
    this.bitlyUrl = bitlyUrl;
    this.title = title;
    this.images = images;
  }

  GifModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    slug = json['slug'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    title = json['title'];
  }
}
