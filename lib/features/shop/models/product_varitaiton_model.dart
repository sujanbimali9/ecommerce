class ProductVariationModel {
  final String id;
  String? sku;
  int stock;
  double price;
  double salePrice;
  String image;
  String? description;
  Map<String, dynamic> attributesValues;
  ProductVariationModel({
    required this.id,
    this.sku,
    required this.stock,
    required this.price,
    required this.salePrice,
    required this.image,
    this.description,
    required this.attributesValues,
  });

  static ProductVariationModel get empty => ProductVariationModel(
      id: '',
      stock: 0,
      price: 0,
      salePrice: 0,
      image: '',
      attributesValues: {});

  ProductVariationModel copyWith({
    String? id,
    String? sku,
    int? stock,
    double? price,
    double? salePrice,
    String? image,
    String? description,
    Map<String, dynamic>? attributesValues,
  }) {
    return ProductVariationModel(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      stock: stock ?? this.stock,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      image: image ?? this.image,
      description: description ?? this.description,
      attributesValues: attributesValues ?? this.attributesValues,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'sku': sku,
      'stock': stock,
      'price': price,
      'salePrice': salePrice,
      'image': image,
      'description': description,
      'attributesValues': attributesValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> map) {
    return ProductVariationModel(
      id: map['id'] ?? '',
      sku: map['sku'] ?? '',
      stock: map['stock'] ?? 0,
      price: double.parse(map['price'] ?? 0.0),
      salePrice: double.parse(map['salePrice']),
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      attributesValues: Map<String, dynamic>.from(
        (map['attributesValues'] as Map<String, dynamic>),
      ),
    );
  }
}
