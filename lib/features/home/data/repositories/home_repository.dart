import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/constants/api_constants.dart';

class HomeRepository {
  Future<Map<String, dynamic>> fetchHomeData() async {
    const lat = 23.232639;
    const lng = 69.6415341;

    final responses = await Future.wait([
      http.get(Uri.parse(ApiUrls.slider)),
      http.get(Uri.parse("${ApiUrls.categories}?page=1")),
      http.get(Uri.parse(
        "${ApiUrls.featured}?latitude=$lat&longitude=$lng&radius=0",
      )),
    ]);

    if (responses.any((e) => e.statusCode != 200)) {
      throw Exception("API failed");
    }

    return {
      "sliders": jsonDecode(responses[0].body)["data"] ?? [],
      "categories": jsonDecode(responses[1].body)["data"]["data"] ?? [],
      "sections": jsonDecode(responses[2].body)["data"] ?? [],
    };
  }
}
