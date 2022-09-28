import 'package:freegame/data/freegame_by_id/freegame_by_id.dart';
import 'package:http/http.dart' as http;

class FreeGameAPI {
  static Future<FreegameById> _fetch(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return FreegameById.fromJson(response.body);
    } else {
      throw Exception('Failed to load game data');
    }
  }

  static Future<FreegameById> fetchDataByIDSearch({required id}) async {
    String url = 'https://www.freetogame.com/api/game?id=$id';
    var response = await http.get(Uri.parse(url));
    try {
      return await _fetch(url);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
