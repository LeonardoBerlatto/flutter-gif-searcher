import 'package:gif_searcher/constants/config_constant.dart';
import 'package:gif_searcher/utils/base_provider.dart';
import 'package:gif_searcher/home/models/gif_model.dart';

class HomeProvider {
  static final String _defaultRating = 'G';

  BaseProvider baseProvider =
      BaseProvider(baseUrl: 'https://api.giphy.com/v1/gifs/');

  Future<List<GifModel>> fetchGifs(final int limit) async {
    List gifs = await baseProvider.get(
        'trending?api_key=${ConfigConstants.apiKey}&limit=$limit&rating=$_defaultRating');
    return _castToGifList(gifs);
  }

  Future<List<GifModel>> searchGifs(
      final String keyword, final int offset, final int limit) async {
    return await baseProvider.get(
        'search?api_key=${ConfigConstants.apiKey}&q=$keyword&limit=$limit&offset=$offset&rating=$_defaultRating');
  }

  List<GifModel> _castToGifList(gifs) {
    return gifs
        .map((item) => GifModel.fromJson(item))
        .cast<GifModel>()
        .toList();
  }
}
