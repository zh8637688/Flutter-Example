class StoryModel {
  final String title;
  final String image;
  final int id;

  StoryModel(this.title, this.id, {this.image});

  StoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        image = json['image'] != null
            ? json['image']
            : (json['images'] != null ? json['images'][0] : null);
}