import 'dart:convert';

class GameData {
  int? id;
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;

  GameData({
    this.id,
    this.title,
    this.thumbnail,
    this.shortDescription,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freetogameProfileUrl,
  });

  @override
  String toString() {
    return 'GameData(id: $id, title: $title, thumbnail: $thumbnail, shortDescription: $shortDescription, gameUrl: $gameUrl, genre: $genre, platform: $platform, publisher: $publisher, developer: $developer, releaseDate: $releaseDate, freetogameProfileUrl: $freetogameProfileUrl)';
  }

  factory GameData.fromMap(Map<String, dynamic> data) => GameData(
        id: data['id'] as int?,
        title: data['title'] as String?,
        thumbnail: data['thumbnail'] as String?,
        shortDescription: data['short_description'] as String?,
        gameUrl: data['game_url'] as String?,
        genre: data['genre'] as String?,
        platform: data['platform'] as String?,
        publisher: data['publisher'] as String?,
        developer: data['developer'] as String?,
        releaseDate: data['release_date'] as String?,
        freetogameProfileUrl: data['freetogame_profile_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'thumbnail': thumbnail,
        'short_description': shortDescription,
        'game_url': gameUrl,
        'genre': genre,
        'platform': platform,
        'publisher': publisher,
        'developer': developer,
        'release_date': releaseDate,
        'freetogame_profile_url': freetogameProfileUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GameData].
  factory GameData.fromJson(String data) {
    return GameData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GameData] to a JSON string.
  String toJson() => json.encode(toMap());
}
