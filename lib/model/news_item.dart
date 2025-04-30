class NewsItem {
  NewsItem({
    required this.key,
    required this.url,
    required this.description,
    required this.image,
    required this.name,
    required this.source,
    required this.date,
    this.isfavi = false,
  });

  final String key;
  final String url;
  final String description;
  final String image;
  final String name;
  final String source;
  final DateTime date;
  bool isfavi;

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      key: json["key"],
      url: json["url"],
      description: json["description"],
      image: json["image"],
      name: json["name"],
      source: json["source"],
      date: DateTime.parse(json["date"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "key": key,
      "url": url,
      "description": description,
      "image": image,
      "name": name,
      "source": source,
      "date": date.toIso8601String(),
    };
  }
}
