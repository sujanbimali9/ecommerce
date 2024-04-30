class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? totalProducts;
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.totalProducts,
  });

  BrandModel copyWith({
    String? id,
    String? name,
    String? image,
    bool? isFeatured,
    int? totalProducts,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      totalProducts: totalProducts ?? this.totalProducts,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'totalProducts': totalProducts,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      isFeatured: map['isFeatured'] != null ? map['isFeatured'] as bool : null,
      totalProducts:
          map['totalProducts'] != null ? map['totalProducts'] as int : null,
    );
  }
}
