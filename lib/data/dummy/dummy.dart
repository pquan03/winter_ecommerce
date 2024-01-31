import 'package:winter_store/features/shop/models/banner_model.dart';
import 'package:winter_store/features/shop/models/brand_model.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/features/shop/models/product_attribute_model.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/features/shop/models/product_variation_model.dart';
import 'package:winter_store/routes/routes.dart';

class WDummy {
  // Categories
  static List<CategoryModel> listCategories = [
    CategoryModel(
      id: "1",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-bowling-64.png?alt=media&token=fdb25957-3315-492b-b870-be6047c9adfb",
      name: "Sports",
      isFeatured: true,
    ),
    CategoryModel(
      id: "2",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-smartphone-64.png?alt=media&token=16538e6d-682a-453a-9e0c-a6aeb07ec8bd",
      name: "Electronics",
      isFeatured: true,
    ),
    CategoryModel(
      id: "3",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-dining-chair-64.png?alt=media&token=2f8b8b57-8e2e-4eb1-8479-298155221012",
      name: "Food",
      isFeatured: true,
    ),
    CategoryModel(
      id: "4",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-school-uniform-64.png?alt=media&token=c5f1a65a-cc48-4785-88c6-6880c59edc40",
      name: "Clothes",
      isFeatured: true,
    ),
    CategoryModel(
      id: "5",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-dog-heart-64.png?alt=media&token=c00f2c75-b535-4f3b-9f8b-6ccb09d77719",
      name: "Animals",
      isFeatured: true,
    ),
    CategoryModel(
      id: "6",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-shoes-64.png?alt=media&token=d1477d5d-d9f6-49da-a26a-1f559265042c",
      name: "Shoes",
      isFeatured: true,
    ),
    CategoryModel(
      id: "7",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-dining-chair-64.png?alt=media&token=2f8b8b57-8e2e-4eb1-8479-298155221012",
      name: "Furniture",
      isFeatured: true,
    ),
    CategoryModel(
      id: "8",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-wooden-toy-car-50.png?alt=media&token=ed0dbe4f-07a9-4976-8ee2-e52a4870b6a2",
      name: "Cars",
      isFeatured: true,
    ),
  ];

  // Banners
  static List<BannerModel> listBanners = [
    BannerModel(
        id: "1",
        active: true,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Users%2FImages%2FBanner%2Fbanner_1.jpg?alt=media&token=b8cea4b5-9266-4fbf-b6c9-88ef482c9467',
        targetScreen: WRoutes.address),
    BannerModel(
        id: "2",
        active: true,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fpromo-banner-1.png?alt=media&token=d8c9e768-52a0-40dd-ac2c-a3e308d21e94',
        targetScreen: WRoutes.orders),
    BannerModel(
        id: "3",
        active: true,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fpromo-banner-2.png?alt=media&token=04771a5d-4206-4efd-b6f9-b80e28ed66c0',
        targetScreen: WRoutes.productDetails),
  ];

  // Products
  static List<ProductModel> listProducts = [
    ProductModel(
        isFeatured: true,
        id: "1",
        stock: 10,
        productType: 'product.variable',
        title: "Acer Nitro 5 16GB Ram 1TB SSD",
        description:
            "The Acer Nitro 5 is a gaming laptop that's designed for those who want a powerful machine that's also easy to carry around. It's not the lightest laptop in the world, but it's still portable enough to be carried around the house or taken on a trip. The Acer Nitro 5 is a gaming laptop that's designed for those who want a powerful machine that's also easy to carry around. It's not the lightest laptop in the world, but it's still portable enough to be carried around the house or taken on a trip. The Acer Nitro 5 is a gaming laptop that's designed for those who want a powerful machine that's also easy to carry around. It's not the lightest laptop in the world, but it's still portable enough to be carried around the house or taken on a trip.",
        price: 150,
        salePrice: 100,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_1.png?alt=media&token=e12a5d5d-b905-42e3-83e6-d4b6e70a3fdb",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_4.png?alt=media&token=11440bc3-19b7-4518-ad5c-1344a072d561",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_2.png?alt=media&token=579f84de-85e2-4eca-b875-3ebc8709310a",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_1.png?alt=media&token=731d5980-c855-4744-91bf-90c8e1f0fbec",
        categoryId: "1",
        brand: BrandModel(
            id: "1",
            name: "Acer",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Facer_logo.png?alt=media&token=c920e35f-5172-49e2-a96b-4ed598e17f1d",
            isFeatured: true,
            productsCount: 10),
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Red", "Blue", "Green"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 100,
            salePrice: 80,
            description: "Acer Nitro 5 16GB Ram 1TB SSD",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_1.png?alt=media&token=e12a5d5d-b905-42e3-83e6-d4b6e70a3fdb",
            stock: 10,
            sku: "ACER-NITRO-5-16GB-1TB-SSD-RED",
            attributes: {
              "Color": "Red",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 100,
            salePrice: 80,
            description: "Acer Nitro 5 16GB Ram 1TB SSD",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_2.png?alt=media&token=579f84de-85e2-4eca-b875-3ebc8709310a",
            stock: 10,
            sku: "ACER-NITRO-5-16GB-1TB-SSD-BLUE",
            attributes: {
              "Color": "Blue",
            },
          ),
        ]),
    ProductModel(
        id: "2",
        stock: 10,
        isFeatured: true,
        productType: 'product.variable',
        title: "Nike Air Max 270",
        description:
            "The Nike Air Max 270 React combines some of Nike's latest cushioning innovations to create an ultra comfortable and supportive sneaker. They're constructed with a multi-layered no-sew textile upper, feature React cushioning, rope laces, heel pull tab, and a rubber outsole.",
        price: 150,
        salePrice: 100,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJOrdonBlackRed.png?alt=media&token=b09ab157-cbdb-4014-b955-21af08cc1f4a",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleBlue.png?alt=media&token=9c54bdb3-c32b-4422-a135-4edbc38cbfc7",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleOrange.png?alt=media&token=9740f78c-700a-4059-9a12-0483a0dd014d",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonwhiteMagenta.png?alt=media&token=506fc67c-1a30-4d7a-8190-c6af6a4a97d9",
        categoryId: "1",
        brand: BrandModel(
            id: "1",
            name: "Nike",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fnike.png?alt=media&token=3638b3fe-b53c-4b93-a667-9802a59fba9b",
            isFeatured: true,
            productsCount: 10),
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Red", "Blue", "Green"]),
          ProductAttributeModel(name: "Size", values: ["S", "M", "L"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 100,
            salePrice: 80,
            description: "Nike Air Max 270",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJOrdonBlackRed.png?alt=media&token=b09ab157-cbdb-4014-b955-21af08cc1f4a",
            sku: "NIKE-AIR-MAX-270-RED-S",
            stock: 10,
            attributes: {
              "Color": "Red",
              "Size": "S",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "Nike Air Max 270",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleBlue.png?alt=media&token=9c54bdb3-c32b-4422-a135-4edbc38cbfc7",
            sku: "NIKE-AIR-MAX-270-BLUE-M",
            attributes: {
              "Color": "Blue",
              "Size": "M",
            },
          ),
          ProductVariationModel(
            id: "3",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "Nike Air Max 270",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleOrange.png?alt=media&token=9740f78c-700a-4059-9a12-0483a0dd014d",
            sku: "NIKE-AIR-MAX-270-ORANGE-L",
            attributes: {
              "Color": "Green",
              "Size": "L",
            },
          ),
          ProductVariationModel(
            id: "4",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "Nike Air Max 270",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleOrange.png?alt=media&token=9740f78c-700a-4059-9a12-0483a0dd014d",
            sku: "NIKE-AIR-MAX-270-ORANGE-M",
            attributes: {
              "Color": "Red",
              "Size": "M",
            },
          ),
          ProductVariationModel(
            id: "5",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "Nike Air Max 270",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleBlue.png?alt=media&token=9c54bdb3-c32b-4422-a135-4edbc38cbfc7",
            sku: "NIKE-AIR-MAX-270-BLUE-L",
            attributes: {
              "Color": "Blue",
              "Size": "L",
            },
          ),
        ]),
    ProductModel(
        id: "3",
        stock: 10,
        isFeatured: true,
        productType: 'product.variable',
        title: "iPhone 15 Pro Max 256GB",
        description:
            "The iPhone 15 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099. The iPhone 15 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099. The iPhone 15 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099.",
        price: 150,
        salePrice: 100,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile_back.png?alt=media&token=29d3eac9-f1cd-4138-801e-9402e9ad3731",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_green.png?alt=media&token=565b0195-991e-4579-922f-49c52cb4d814",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile.png?alt=media&token=e593c29b-7779-41ae-a3b5-3a04fc0120f6",
        categoryId: "1",
        brand: BrandModel(
            id: "1",
            name: "Apple",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fapple-logo.png?alt=media&token=6de5d8d5-1f9e-41a2-856f-cb38d1ae4ec9",
            isFeatured: true,
            productsCount: 10),
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Gold", "Red", "Black", "White"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "iPhone 15 Pro Max 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
            sku: "IPHONE-15-PRO-MAX-256GB-BLACK",
            attributes: {
              "Color": "Gold",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "iPhone 15 Pro Max 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_green.png?alt=media&token=565b0195-991e-4579-922f-49c52cb4d814",
            sku: "IPHONE-15-PRO-MAX-256GB-GREEN",
            attributes: {
              "Color": "Red",
            },
          ),
        ]),
    ProductModel(
        id: "4",
        stock: 10,
        isFeatured: true,
        productType: 'product.variable',
        title: "Apple Ipad Pro 2021 256GB",
        description:
            "The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen. The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen. The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen. The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen.",
        price: 150,
        salePrice: 100,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile_back.png?alt=media&token=29d3eac9-f1cd-4138-801e-9402e9ad3731",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_green.png?alt=media&token=565b0195-991e-4579-922f-49c52cb4d814",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile.png?alt=media&token=e593c29b-7779-41ae-a3b5-3a04fc0120f6",
        categoryId: "1",
        brand: BrandModel(
            id: "1",
            name: "Apple",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fapple-logo.png?alt=media&token=6de5d8d5-1f9e-41a2-856f-cb38d1ae4ec9",
            isFeatured: true,
            productsCount: 10),
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Red", "Blue", "Green"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "Apple Ipad Pro 2021 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
            sku: "APPLE-IPAD-PRO-2021-256GB-BLACK",
            attributes: {
              "Color": "Red",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 100,
            salePrice: 80,
            stock: 10,
            description: "Apple Ipad Pro 2021 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_green.png?alt=media&token=565b0195-991e-4579-922f-49c52cb4d814",
            sku: "APPLE-IPAD-PRO-2021-256GB-GREEN",
            attributes: {
              "Color": "Blue",
            },
          ),
        ])
  ];
}
