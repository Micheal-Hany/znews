import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class Source extends HiveObject {
  @HiveField(0)
  final dynamic id;
  @HiveField(1)
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as dynamic,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };


}
