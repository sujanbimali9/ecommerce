import 'package:ecommerce_flutter/features/shop/models/banner_model.dart';
import 'package:ecommerce_flutter/features/shop/models/brand_model.dart';
import 'package:ecommerce_flutter/features/shop/models/category_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_model.dart';
import 'package:ecommerce_flutter/features/shop/models/product_varitaiton_model.dart';
import 'package:ecommerce_flutter/routes/routes.dart';
import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:ecommerce_flutter/utils/constants/image_strings.dart';

class DummyData {
  static final products = [
    ProductModel(
      date: DateTime.now(),
      id: '001',
      stock: 15,
      price: 135,
      title: 'Green Nike sports shoe',
      salePrice: 30,
      thumbnail: TImages.productImage1,
      brand: BrandModel(
          id: '1',
          name: 'Nike',
          image: TImages.nikeLogo,
          totalProducts: 256,
          isFeatured: true),
      productType: ProductType.variable.toString(),
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
      ],
      sku: 'ABR4568',
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage9,
        TImages.productImage21
      ],
      isFeatured: true,
      description: 'Green Nike sports shoe',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          attributesValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 234,
          image: TImages.productImage2,
          attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      date: DateTime.now(),
      id: '002',
      stock: 15,
      price: 35,
      title: 'Blur T-shirt for all ages',
      salePrice: 30,
      thumbnail: TImages.productImage69,
      brand: BrandModel(
        id: '6',
        name: 'ZARA',
        image: TImages.zaraLogo,
      ),
      productType: ProductType.single.toString(),
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34'])
      ],
      sku: 'ABR4532',
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage5,
      ],
      isFeatured: true,
      description: 'This is a Product description of Blur T-shirt for all ages',
    ),
    ProductModel(
      date: DateTime.now(),
      id: '003 ',
      stock: 15,
      price: 109,
      title: 'Leather brown jacket',
      salePrice: 75,
      sku: 'ABR4533',
      thumbnail: TImages.productImage64,
      images: [
        TImages.productImage64,
        TImages.productImage65,
        TImages.productImage67,
      ],
      brand: BrandModel(
        id: '6',
        name: 'ZARA',
        image: TImages.zaraLogo,
      ),
      isFeatured: true,
      productType: ProductType.single.toString(),
    ),
    ProductModel(
      date: DateTime.now(),
      id: '004',
      stock: 15,
      price: 135,
      title: '4 Color collar t-shirt dry fit',
      salePrice: 30,
      sku: 'ABR4533',
      description:
          'This is a Product description of 4 Color collar t-shirt dry fit',
      thumbnail: TImages.productImage60,
      isFeatured: false,
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage63,
      ],
      brand: BrandModel(
        id: '6',
        name: 'ZARA',
        image: TImages.zaraLogo,
      ),
      productType: ProductType.variable.toString(),
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Yellow', 'Red', 'Blue']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage60,
          attributesValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 134,
          image: TImages.productImage60,
          attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage61,
          attributesValues: {'Color': 'Yellow', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage61,
          attributesValues: {'Color': 'Yellow', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage62,
          attributesValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage62,
          attributesValues: {'Color': 'Green', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 0,
          price: 334,
          image: TImages.productImage63,
          attributesValues: {'Color': 'Blue', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 11,
          price: 332,
          image: TImages.productImage63,
          attributesValues: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
    ProductModel(
      date: DateTime.now(),
      id: '005',
      stock: 15,
      price: 35,
      title: 'Nike Air Jordan Shoes',
      salePrice: 30,
      thumbnail: TImages.productImage10,
      brand: BrandModel(
          id: '1',
          name: 'Nike',
          image: TImages.nikeLogo,
          totalProducts: 256,
          isFeatured: true),
      productType: ProductType.variable.toString(),
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
      ],
      sku: 'ABR4568',
      images: [
        TImages.productImage7,
        TImages.productImage8,
        TImages.productImage9,
        TImages.productImage10
      ],
      isFeatured: true,
      description:
          'Nike Air Jordan Shoes for running ,Quality product,Long lasting',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 16,
          price: 36,
          salePrice: 20.6,
          image: TImages.productImage8,
          description: 'Nike Air Jordan Shoes for running ,Quality product',
          attributesValues: {'Color': 'Orange', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 34,
          image: TImages.productImage7,
          attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 14,
          price: 34,
          image: TImages.productImage9,
          attributesValues: {'Color': 'Brown', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 13,
          price: 34,
          image: TImages.productImage7,
          attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 12,
          price: 32,
          image: TImages.productImage9,
          attributesValues: {'Color': 'Brown', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 31,
          image: TImages.productImage8,
          attributesValues: {'Color': 'Orange', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      date: DateTime.now(),
      id: '006',
      stock: 15,
      price: 750,
      title: 'Sansung Galaxy S9 (Pink ,64 GB) (4 GB RAM) (refurbished)',
      salePrice: 650,
      thumbnail: TImages.productImage11,
      brand: BrandModel(id: '7', name: 'Samsung', image: TImages.appleLogo),
      productType: ProductType.single.toString(),
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34'])
      ],
      sku: 'ABR4568',
      images: [
        TImages.productImage11,
        TImages.productImage12,
        TImages.productImage13,
      ],
      isFeatured: false,
      description: 'Samsung Galaxy S9 (Pink ,64 GB) (4 GB RAM) (refurbished)',
    ),
    ProductModel(
      date: DateTime.now(),
      id: '007',
      stock: 15,
      price: 20,
      title: 'TOMI Dog food',
      salePrice: 10,
      thumbnail: TImages.productImage18,
      brand: BrandModel(id: '7', name: 'Tomi', image: TImages.appleLogo),
      productType: ProductType.single.toString(),
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34'])
      ],
      sku: 'ABR4568',
      isFeatured: false,
      description: 'TOMI Dog food',
    ),
    ProductModel(
      date: DateTime.now(),
      id: '009',
      stock: 15,
      price: 400,
      title: 'Nike Air Jordan 19 Blue',
      salePrice: 200,
      thumbnail: TImages.productImage19,
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo),
      productType: ProductType.single.toString(),
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34'])
      ],
      sku: 'ABR4568',
      isFeatured: false,
      description: 'TOMI Dog food',
    ),
  ];

  static final categories = [
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: TImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      image: TImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      image: TImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      image: TImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      image: TImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: TImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      image: TImages.cosmeticsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      name: 'Jelewery',
      image: TImages.jeweleryIcon,
      isFeatured: true,
    ),

    //sub categories
    CategoryModel(
        id: '8',
        name: 'Sports Shoes',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Sports Suits',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sports Shoes',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),

    //furtniture
    CategoryModel(
        id: '13',
        name: 'Sofa',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '11',
        name: 'Table',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '12',
        name: 'Chair',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    //electronics
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '16',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    CategoryModel(
        id: '17',
        name: 'Headphones',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '2'),
    //clothes
    CategoryModel(
        id: '18',
        name: 'T-Shirt',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
    CategoryModel(
        id: '19',
        name: 'Jeans',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
    CategoryModel(
        id: '20',
        name: 'Shirt',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
    //animals
    CategoryModel(
        id: '21',
        name: 'Dog',
        image: TImages.animalIcon,
        isFeatured: false,
        parentId: '4'),
    CategoryModel(
        id: '22',
        name: 'Cat',
        image: TImages.animalIcon,
        isFeatured: false,
        parentId: '4'),
    CategoryModel(
        id: '23',
        name: 'Bird',
        image: TImages.animalIcon,
        isFeatured: false,
        parentId: '4'),
    //shoes
    CategoryModel(
        id: '24',
        name: 'Sports Shoes',
        image: TImages.shoeIcon,
        isFeatured: false,
        parentId: '6'),
    CategoryModel(
        id: '25',
        name: 'Casual Shoes',
        image: TImages.shoeIcon,
        isFeatured: false,
        parentId: '6'),
    CategoryModel(
        id: '26',
        name: 'Formal Shoes',
        image: TImages.shoeIcon,
        isFeatured: false,
        parentId: '6'),
    //cosmetics
    CategoryModel(
        id: '27',
        name: 'Lipstick',
        image: TImages.cosmeticsIcon,
        isFeatured: false,
        parentId: '7'),
    CategoryModel(
        id: '28',
        name: 'Foundation',
        image: TImages.cosmeticsIcon,
        isFeatured: false,
        parentId: '7'),
    CategoryModel(
        id: '29',
        name: 'Mascara',
        image: TImages.cosmeticsIcon,
        isFeatured: false,
        parentId: '7'),
    //jewelery
    CategoryModel(
        id: '30',
        name: 'Necklace',
        image: TImages.jeweleryIcon,
        isFeatured: false,
        parentId: '14'),
    CategoryModel(
        id: '31',
        name: 'Ring',
        image: TImages.jeweleryIcon,
        isFeatured: false,
        parentId: '14'),
    CategoryModel(
        id: '32',
        name: 'Bracelet',
        image: TImages.jeweleryIcon,
        isFeatured: false,
        parentId: '14'),
  ];

  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: TImages.banner1,
      targetScreen: TRoutes.allProducts,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.banner2,
      targetScreen: TRoutes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner3,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner4,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner5,
      targetScreen: TRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner6,
      targetScreen: TRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner7,
      targetScreen: TRoutes.userAddress,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.banner8,
      targetScreen: TRoutes.checkout,
      active: false,
    ),
  ];
}
