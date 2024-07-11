import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapService {
  static Future<List<SuggestItem>> getSearchSuggestions(String address) async {
    final result = await YandexSuggest.getSuggestions(
      text: address,
      boundingBox: const BoundingBox(
        northEast: Point(
          latitude: 0,
          longitude: 0,
        ),
        southWest: Point(
          latitude: 0,
          longitude: 0,
        ),
      ),
      suggestOptions: const SuggestOptions(
        suggestType: SuggestType.geo,
      ),
    );

    final suggestionResult = await result.$2;

    if (suggestionResult.error != null) {
      print("Manzil topilmadi");
      return [];
    }

    return suggestionResult.items ?? [];
  }
}
