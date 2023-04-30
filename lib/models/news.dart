class News {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  bool read;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
    this.read = false,
  });

  News copyWith({
    String? title,
    String? description,
    String? imageUrl,
    String? url,
    bool? read,
  }) {
    return News(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
      read: read ?? this.read,
    );
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
