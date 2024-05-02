class ProductAttributeModel {
  String? name;
  List<String>? values;
  ProductAttributeModel({
    this.name,
    this.values,
  });
  static ProductAttributeModel get empty =>
      ProductAttributeModel(name: '', values: []);

  ProductAttributeModel copyWith({
    String? name,
    List<String>? values,
  }) {
    return ProductAttributeModel(
      name: name ?? this.name,
      values: values ?? this.values,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> map) {
    return ProductAttributeModel(
      name: map['name'],
      values: map['values'] != null ? List<String>.from((map['values'])) : [],
    );
  }
}
