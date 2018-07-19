class ThemeModel {
  final int id;
  final String name;
  final String thumbnail;
  final String description;

  ThemeModel(this.id, this.name, this.thumbnail, this.description);

  ThemeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        thumbnail = json['thumbnail'],
        description = json['description'];
}