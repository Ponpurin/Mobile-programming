import 'dart:convert';

import 'minimum_system_requirements.dart';
import 'screenshot.dart';

class FreegameData {
  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirements? minimumSystemRequirements;
  List<Screenshot>? screenshots;

  FreegameData({
    this.id,
    this.title,
    this.thumbnail,
    this.status,
    this.shortDescription,
    this.description,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freetogameProfileUrl,
    this.minimumSystemRequirements,
    this.screenshots,
  });

  @override
  String toString() {
    return 'FreegameData(id: $id, title: $title, thumbnail: $thumbnail, status: $status, shortDescription: $shortDescription, description: $description, gameUrl: $gameUrl, genre: $genre, platform: $platform, publisher: $publisher, developer: $developer, releaseDate: $releaseDate, freetogameProfileUrl: $freetogameProfileUrl, minimumSystemRequirements: $minimumSystemRequirements, screenshots: $screenshots)';
  }

  factory FreegameData.fromMap(Map<String, dynamic> data) => FreegameData(
        id: data['id'] as int?,
        title: data['title'] as String?,
        thumbnail: data['thumbnail'] as String?,
        status: data['status'] as String?,
        shortDescription: data['short_description'] as String?,
        description: data['description'] as String?,
        gameUrl: data['game_url'] as String?,
        genre: data['genre'] as String?,
        platform: data['platform'] as String?,
        publisher: data['publisher'] as String?,
        developer: data['developer'] as String?,
        releaseDate: data['release_date'] as String?,
        freetogameProfileUrl: data['freetogame_profile_url'] as String?,
        minimumSystemRequirements: data['minimum_system_requirements'] == null
            ? null
            : MinimumSystemRequirements.fromMap(
                data['minimum_system_requirements'] as Map<String, dynamic>),
        screenshots: (data['screenshots'] as List<dynamic>?)
            ?.map((e) => Screenshot.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'thumbnail': thumbnail,
        'status': status,
        'short_description': shortDescription,
        'description': description,
        'game_url': gameUrl,
        'genre': genre,
        'platform': platform,
        'publisher': publisher,
        'developer': developer,
        'release_date': releaseDate,
        'freetogame_profile_url': freetogameProfileUrl,
        'minimum_system_requirements': minimumSystemRequirements?.toMap(),
        'screenshots': screenshots?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FreegameData].
  factory FreegameData.fromJson(String data) {
    return FreegameData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FreegameData] to a JSON string.
  String toJson() => json.encode(toMap());
}
