import 'package:gif_searcher/home/models/image_model.dart';

class GifModel {
  String id;
  String url;
  String source;
  String bitlyGifUrl;
  String bitlyUrl;
  String title;
  Map<String, ImageModel> images;

  GifModel(
      {this.id,
      this.url,
      this.source,
      this.bitlyGifUrl,
      this.bitlyUrl,
      this.title,
      this.images});

  GifModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    source = json['source'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    title = json['title'];
    images = _getImagesFromMap(json['images']);
  }

  _getImagesFromMap(Map<String, dynamic> images) {
    return images
        .map((key, value) => MapEntry(key, ImageModel.fromJson(value)))
        .cast<String, ImageModel>();
  }
}
