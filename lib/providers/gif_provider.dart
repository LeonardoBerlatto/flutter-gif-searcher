import 'package:gif_searcher/constants/config_constant.dart';
import 'package:gif_searcher/home/models/gif_model.dart';

import '../home/models/gif_model.dart';
import 'base_provider.dart';

class GifProvider extends BaseProvider {
  static final String defaultRating = 'G';

  static final String gifProviderBaseUrl = 'https://api.giphy.com/v1/gifs/';

  GifProvider() : super(baseUrl: gifProviderBaseUrl);

  Future<List<GifModel>> fetchGifs(final int limit) async {
    List gifs = await super.get(
        'trending?api_key=${ConfigConstants.apiKey}&limit=$limit&rating=$defaultRating');
    return _castToGifList(gifs);
  }

  Future<List<GifModel>> searchGifs(
      final String keyword, final int offset, final int limit) async {
    List gifs = await super.get(
        'search?api_key=${ConfigConstants.apiKey}&q=$keyword&limit=$limit&offset=$offset&rating=$defaultRating');
    return _castToGifList(gifs);
  }

  List<GifModel> _castToGifList(gifs) {
    return gifs
        .map((item) => GifModel.fromJson(item))
        .cast<GifModel>()
        .toList();
  }
}
