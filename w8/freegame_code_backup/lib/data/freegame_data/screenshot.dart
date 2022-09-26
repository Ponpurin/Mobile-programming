import 'dart:convert';

class Screenshot {
  int? id;
  String? image;

  Screenshot({this.id, this.image});

  @override
  String toString() => 'Screenshot(id: $id, image: $image)';

  factory Screenshot.fromMap(Map<String, dynamic> data) => Screenshot(
        id: data['id'] as int?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Screenshot].
  factory Screenshot.fromJson(String data) {
    return Screenshot.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Screenshot] to a JSON string.
  String toJson() => json.encode(toMap());
}
