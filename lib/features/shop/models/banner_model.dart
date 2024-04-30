class BannerModel {
  String imageUrl;
  String targetScreen;
  bool active;
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  BannerModel copyWith({
    String? imageUrl,
    String? targetScreen,
    bool? active,
  }) {
    return BannerModel(
      imageUrl: imageUrl ?? this.imageUrl,
      targetScreen: targetScreen ?? this.targetScreen,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      imageUrl: map['imageUrl'] ?? '',
      targetScreen: map['targetScreen'] ?? '',
      active: map['active'] ?? false,
    );
  }
}
