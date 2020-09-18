class ReportModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  ReportModel({this.id, this.createdAt, this.name, this.avatar});

  @override
  String toString() => name;

  @override
  operator ==(o) => o is ReportModel && o.id == id;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode;
}
