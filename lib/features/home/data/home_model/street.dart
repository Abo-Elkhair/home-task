// class Street {
//   Street();

//   factory Street.fromJson(Map<String, dynamic> json) {
//     // TODO: implement fromJson
//     throw UnimplementedError('Street.fromJson($json) is not implemented');
//   }

//   Map<String, dynamic> toJson() {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
// }
//the above code give me this exception flutter: error -- UnimplementedError: Street.fromJson({key: south, name: الجنوبي, value: 3}) is not implemented

class Street {
  String key;
  String name;
  String value;

  Street({
    required this.key,
    required this.name,
    required this.value,
  });

  // The fromJson constructor to parse the JSON map
  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      key: json['key'] as String,
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }
}
