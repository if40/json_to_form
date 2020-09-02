class ReportModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  ReportModel({this.id, this.createdAt, this.name, this.avatar});

  // factory ReportModel.fromJson(Map<String, dynamic> json) {
  //   if (json == null) return null;
  //   return ReportModel(
  //     id: json["id"],
  //     createdAt:
  //         json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  //     name: json["name"],
  //     avatar: json["avatar"],
  //   );
  // }

  // static List<ReportModel> fromJsonList(List list) {
  //   if (list == null) return null;
  //   return list.map((item) => ReportModel.fromJson(item)).toList();
  // }

  @override
  String toString() => name;

  @override
  operator ==(o) => o is ReportModel && o.id == id;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode;
}
