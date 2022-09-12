import 'dart:convert';

class MinimumSystemRequirements {
  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;

  MinimumSystemRequirements({
    this.os,
    this.processor,
    this.memory,
    this.graphics,
    this.storage,
  });

  @override
  String toString() {
    return 'MinimumSystemRequirements(os: $os, processor: $processor, memory: $memory, graphics: $graphics, storage: $storage)';
  }

  factory MinimumSystemRequirements.fromMap(Map<String, dynamic> data) {
    return MinimumSystemRequirements(
      os: data['os'] as String?,
      processor: data['processor'] as String?,
      memory: data['memory'] as String?,
      graphics: data['graphics'] as String?,
      storage: data['storage'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'os': os,
        'processor': processor,
        'memory': memory,
        'graphics': graphics,
        'storage': storage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MinimumSystemRequirements].
  factory MinimumSystemRequirements.fromJson(String data) {
    return MinimumSystemRequirements.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MinimumSystemRequirements] to a JSON string.
  String toJson() => json.encode(toMap());
}
