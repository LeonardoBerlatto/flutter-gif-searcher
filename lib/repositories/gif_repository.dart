import 'dart:async';

import 'package:gif_searcher/home/models/gif_model.dart';
import 'package:gif_searcher/providers/gif_provider.dart';

class GifRepository {
  final GifProvider _gifProvider = GifProvider();

  Future<List<GifModel>> fetchGifs(final int numberOfGifs) =>
      _gifProvider.fetchGifs(numberOfGifs);

  Future<List<GifModel>> searchGifs(final String keyword, final int offset, final int limit) =>
      _gifProvider.searchGifs(keyword, offset, limit);
}
