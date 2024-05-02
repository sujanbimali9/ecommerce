import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';

class DummyData {
  static final categories = [
    CategoryModel(
        id: '1',
        name: 'showicon',
        image: TImages.shoeIcon,
        parentId: '',
        isFeatured: true),
  ];
}
