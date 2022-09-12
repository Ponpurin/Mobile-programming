import 'package:tester/data/game_data/game_data.dart';
import 'package:http/http.dart' as http;

class FreeGameAPI {
  static Future<GameData> _fetch(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return GameData.fromJson(response.body);
    } else {
      throw Exception("Failed to get game data");
    }
  }

  static Future<GameData> fetchGameDataMyDefaultID() async {
    String url = "https://www.freetogame.com/api/game?id=1";
    return await _fetch(url);
  }

  static Future<GameData> fetchGameDataByID({required id}) async {
    String url = "https://www.freetogame.com/api/game?id=$id";
    try {
      return await _fetch(url);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
