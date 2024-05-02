import 'package:ecommerce_flutter/features/shop/models/brand_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_varitaiton_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  String? description;
  bool? isFeatured;
  BrandModel? brand;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.description,
    this.isFeatured,
    this.brand,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel get empty => ProductModel(
      id: '',
      stock: 0,
      price: 0,
      title: '',
      salePrice: 0,
      thumbnail: '',
      productType: '');

  ProductModel copyWith({
    String? id,
    int? stock,
    String? sku,
    double? price,
    String? title,
    DateTime? date,
    double? salePrice,
    String? thumbnail,
    String? description,
    bool? isFeatured,
    BrandModel? brand,
    String? categoryId,
    List<String>? images,
    String? productType,
    List<ProductAttributeModel>? attributes,
    List<ProductVariationModel>? variations,
  }) {
    return ProductModel(
      id: id ?? this.id,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      title: title ?? this.title,
      date: date ?? this.date,
      salePrice: salePrice ?? this.salePrice,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      isFeatured: isFeatured ?? this.isFeatured,
      brand: brand ?? this.brand,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
      productType: productType ?? this.productType,
      productAttributes: attributes ?? productAttributes,
      productVariations: variations ?? productVariations,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'stock': stock,
      'sku': sku,
      'price': price,
      'title': title,
      'date': date?.millisecondsSinceEpoch,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'description': description,
      'isFeatured': isFeatured,
      'brand': brand?.toJson(),
      'categoryId': categoryId,
      'images': images,
      'productType': productType,
      'attributes': productAttributes != null
          ? productAttributes?.map((x) => x.toJson()).toList()
          : [],
      'variations': productVariations != null
          ? productVariations!.map((x) => x.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      stock: map['stock'] ?? 0,
      sku: map['sku'],
      price: double.parse(map['price'] ?? 0.0),
      title: map['title'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      salePrice: double.parse(map['salePrice'] ?? 0.0),
      thumbnail: map['thumbnail'] ?? '',
      description: map['description'] ?? '',
      isFeatured: map['isFeatured'] ?? false,
      brand: BrandModel.fromJson(map['brand']),
      categoryId: map['categoryId'] ?? '',
      images: map['images'] != null ? List<String>.from((map['images'])) : [],
      productType: map['productType'] ?? '',
      productAttributes: map['attributes'] != null
          ? (map['attributes'] as List<dynamic>)
              .map((e) => ProductAttributeModel.fromJson(e))
              .toList()
          : [],
      productVariations: map['varitation'] != null
          ? (map['variation'] as List<dynamic>)
              .map((e) => ProductVariationModel.fromJson(e))
              .toList()
          : [],
    );
  }
}
