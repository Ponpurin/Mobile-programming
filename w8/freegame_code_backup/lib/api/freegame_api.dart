import 'package:freegame/data/freegame_data/freegame_data.dart';
import 'package:http/http.dart' as http;

class FreeGameAPI {
  static Future<FreegameData> _fetch(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return FreegameData.fromJson(response.body);
    } else {
      throw Exception('Failed to load game data');
    }
  }

  static Future<FreegameData> fetchDataByDefault() async {
    String url = 'https://www.freetogame.com/api/games';
    return await _fetch(url);
  }

  static Future<FreegameData> fetchDataByIDSearch({required id}) async {
    String url = 'https://www.freetogame.com/api/game?id=$id';
    var response = await http.get(Uri.parse(url));
    try {
      return await _fetch(url);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
