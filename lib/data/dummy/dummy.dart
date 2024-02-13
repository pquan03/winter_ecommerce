import 'package:winter_store/features/shop/models/banner_model.dart';
import 'package:winter_store/features/shop/models/brand_category_model.dart';
import 'package:winter_store/features/shop/models/brand_model.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/features/shop/models/product_attribute_model.dart';
import 'package:winter_store/features/shop/models/product_category_model.dart';
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

    // --- Sub Catetories - Sports
    CategoryModel(
        id: '9',
        image:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-bowling-64.png?alt=media&token=fdb25957-3315-492b-b870-be6047c9adfb',
        name: 'Sports Shoes',
        isFeatured: true,
        parentID: '1'),

    CategoryModel(
        id: '10',
        image:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-bowling-64.png?alt=media&token=fdb25957-3315-492b-b870-be6047c9adfb',
        name: 'Sports Equipments',
        isFeatured: true,
        parentID: '1'),

    // --- Sub Catetories - Electronics
    CategoryModel(
        id: '11',
        image:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-smartphone-64.png?alt=media&token=16538e6d-682a-453a-9e0c-a6aeb07ec8bd',
        name: 'Smartphones',
        isFeatured: true,
        parentID: '2'),

    CategoryModel(
        id: '12',
        image:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Categories%2Ficons8-smartphone-64.png?alt=media&token=16538e6d-682a-453a-9e0c-a6aeb07ec8bd',
        name: 'Laptops',
        isFeatured: true,
        parentID: '2'),
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
        sku: "ACER-NITRO-5-16GB-1TB-SSD-RED",
        productType: 'product.variable',
        title: "Acer Nitro 5 16GB Ram 1TB SSD",
        description:
            "The Acer Nitro 5 is a gaming laptop that's designed for those who want a powerful machine that's also easy to carry around. It's not the lightest laptop in the world, but it's still portable enough to be carried around the house or taken on a trip. The Acer Nitro 5 is a gaming laptop that's designed for those who want a powerful machine that's also easy to carry around. It's not the lightest laptop in the world, but it's still portable enough to be carried around the house or taken on a trip. The Acer Nitro 5 is a gaming laptop that's designed for those who want a powerful machine that's also easy to carry around. It's not the lightest laptop in the world, but it's still portable enough to be carried around the house or taken on a trip.",
        price: 2999,
        salePrice: 2499,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_1.png?alt=media&token=e12a5d5d-b905-42e3-83e6-d4b6e70a3fdb",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_4.png?alt=media&token=11440bc3-19b7-4518-ad5c-1344a072d561",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_var_2.png?alt=media&token=579f84de-85e2-4eca-b875-3ebc8709310a",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Facer_laptop_1.png?alt=media&token=731d5980-c855-4744-91bf-90c8e1f0fbec",
        categoryId: "1",
        brand: BrandModel(
          id: "5",
          name: "Acer",
          image:
              "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Facer_logo.png?alt=media&token=c920e35f-5172-49e2-a96b-4ed598e17f1d",
          isFeatured: true,
          productsCount: 6,
        ),
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
        sku: "NIKE-AIR-MAX-270-RED-S",
        productType: 'product.variable',
        title: "Nike Air Max 270",
        description:
            "The Nike Air Max 270 React combines some of Nike's latest cushioning innovations to create an ultra comfortable and supportive sneaker. They're constructed with a multi-layered no-sew textile upper, feature React cushioning, rope laces, heel pull tab, and a rubber outsole.",
        price: 399,
        salePrice: 299,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJOrdonBlackRed.png?alt=media&token=b09ab157-cbdb-4014-b955-21af08cc1f4a",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleBlue.png?alt=media&token=9c54bdb3-c32b-4422-a135-4edbc38cbfc7",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonSingleOrange.png?alt=media&token=9740f78c-700a-4059-9a12-0483a0dd014d",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2FNikeAirJordonwhiteMagenta.png?alt=media&token=506fc67c-1a30-4d7a-8190-c6af6a4a97d9",
        categoryId: "1",
        brand: BrandModel(
          id: "6",
          name: "Nike",
          image:
              "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fnike.png?alt=media&token=3638b3fe-b53c-4b93-a667-9802a59fba9b",
          isFeatured: true,
          productsCount: 6,
        ),
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
        sku: "IPHONE-15-PRO-MAX-256GB-BLACK",
        isFeatured: true,
        productType: 'product.variable',
        title: "iPhone 15 Pro Max 256GB",
        description:
            "The iPhone 15 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099. The iPhone 15 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099. The iPhone 15 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099.",
        price: 4999,
        salePrice: 3999,
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
            productsCount: 1234),
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
        sku: "APPLE-IPAD-PRO-2021-256GB-BLACK",
        isFeatured: true,
        productType: 'product.variable',
        title: "Apple Ipad Pro 2021 256GB",
        description:
            "The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen. The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen. The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen. The iPad Pro is a tablet computer made by Apple Inc. It comes in two sizes, with the larger one having a 12.9-inch screen.",
        price: 2499,
        salePrice: 1999,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fapple_ipad_pro_2021_silver_11_1-_tejar_1.webp?alt=media&token=9a3f0577-8483-4f19-a91d-93b8ecd07019",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fipad-pro-2021-11inch-grey_3.webp?alt=media&token=448d8eb9-03ca-42d9-b4d4-c6b23481adc2"
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fapple_ipad_pro_2021_silver_11_1-_tejar_1.webp?alt=media&token=9a3f0577-8483-4f19-a91d-93b8ecd07019",
        categoryId: "1",
        brand: BrandModel(
            id: "1",
            name: "Apple",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fapple-logo.png?alt=media&token=6de5d8d5-1f9e-41a2-856f-cb38d1ae4ec9",
            isFeatured: true,
            productsCount: 1234),
        productAttributes: [
          ProductAttributeModel(name: "Color", values: ["Gray", "Silver"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 1999,
            salePrice: 1667,
            stock: 10,
            description: "Apple Ipad Pro 2021 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fapple_ipad_pro_2021_silver_11_1-_tejar_1.webp?alt=media&token=9a3f0577-8483-4f19-a91d-93b8ecd07019",
            sku: "APPLE-IPAD-PRO-2021-256GB-BLACK",
            attributes: {
              "Color": "Gray",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 1999,
            salePrice: 1667,
            stock: 10,
            description: "Apple Ipad Pro 2021 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fipad-pro-2021-11inch-grey_3.webp?alt=media&token=448d8eb9-03ca-42d9-b4d4-c6b23481adc2",
            sku: "APPLE-IPAD-PRO-2021-256GB-SILVER",
            attributes: {
              "Color": "Silver",
            },
          ),
        ]),
    ProductModel(
        id: "5",
        stock: 10,
        sku: "BEDROOM-BED-BLACK",
        isFeatured: true,
        productType: 'product.variable',
        title: "Bedroom Bed",
        description:
            "The bedroom is a place of relaxation so make sure that you've got the right furniture to reach the right level of comfort. The bedroom is a place of relaxation so make sure that you've got the right furniture to reach the right level of comfort. The bedroom is a place of relaxation so make sure that you've got the right furniture to reach the right level of comfort. The bedroom is a place of relaxation so make sure that you've got the right furniture to reach the right level of comfort.",
        price: 200,
        salePrice: 167,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_black.png?alt=media&token=42bd0e29-6d68-4b4c-99a4-1ae3ebf5aa9a",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_grey.png?alt=media&token=f75efc17-b88c-459d-813f-f0f454c060f3",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_simple_brown.png?alt=media&token=b609fdbb-4857-48ab-b2f2-3117f4d098b5",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_with_comforter.png?alt=media&token=edd3fd9e-cb47-48ab-a5b6-a02b53421ff0"
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed.png?alt=media&token=0d45def0-b952-4e13-9313-a292a600ea1a",
        categoryId: "1",
        brand: BrandModel(
            id: "4",
            name: "Zara",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fzara-logo.png?alt=media&token=a0a97271-9ff7-4672-914c-2fa4d0870b35",
            isFeatured: true,
            productsCount: 120),
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Black", "Grey", "Brow", "White"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Bedroom Bed",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_black.png?alt=media&token=42bd0e29-6d68-4b4c-99a4-1ae3ebf5aa9a",
            sku: "BEDROOM-BED-BLACK",
            attributes: {
              "Color": "Black",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Bedroom Bed",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_grey.png?alt=media&token=f75efc17-b88c-459d-813f-f0f454c060f3",
            sku: "BEDROOM-BED-GREY",
            attributes: {
              "Color": "Grey",
            },
          ),
          ProductVariationModel(
            id: "3",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Bedroom Bed",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_simple_brown.png?alt=media&token=b609fdbb-4857-48ab-b2f2-3117f4d098b5",
            sku: "BEDROOM-BED-BROWN",
            attributes: {
              "Color": "Brown",
            },
          ),
          ProductVariationModel(
            id: "4",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Bedroom Bed",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fbedroom_bed_with_comforter.png?alt=media&token=edd3fd9e-cb47-48ab-a5b6-a02b53421ff0",
            sku: "BEDROOM-BED-WHITE",
            attributes: {
              "Color": "White",
            },
          ),
        ]),
    ProductModel(
        id: "6",
        stock: 10,
        sku: "IPHONE-8-256GB-BLACK",
        isFeatured: true,
        productType: 'product.variable',
        title: "IPhone 8",
        description:
            "The iPhone 8 is a smartphone designed, developed, and marketed by Apple Inc. It is the eleventh generation of the iPhone. It was announced on September 12, 2017, alongside the iPhone 8 Plus and the iPhone X at the Steve Jobs Theater in the Apple Park campus. The iPhone 8 is a smartphone designed, developed, and marketed by Apple Inc. It is the eleventh generation of the iPhone. It was announced on September 12, 2017, alongside the iPhone 8 Plus and the iPhone X at the Steve Jobs Theater in the Apple Park campus. The iPhone 8 is a smartphone designed, developed, and marketed by Apple Inc. It is the eleventh generation of the iPhone. It was announced on September 12, 2017, alongside the iPhone 8 Plus and the iPhone X at the Steve Jobs Theater in the Apple Park campus.",
        price: 399,
        salePrice: 299,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile_back.png?alt=media&token=29d3eac9-f1cd-4138-801e-9402e9ad3731",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile_dual_side.png?alt=media&token=026ee083-2517-42ae-857d-d800b7108a6a"
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
            productsCount: 1234),
        productAttributes: [
          ProductAttributeModel(name: "Color", values: ["Black", "White"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 555,
            salePrice: 420,
            stock: 10,
            description: "iPhone 8 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile_back.png?alt=media&token=29d3eac9-f1cd-4138-801e-9402e9ad3731",
            sku: "IPHONE-8-256GB-BLACK",
            attributes: {
              "Color": "Black",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 555,
            salePrice: 420,
            stock: 10,
            description: "iPhone 8 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone8_mobile_dual_side.png?alt=media&token=026ee083-2517-42ae-857d-d800b7108a6a",
            sku: "IPHONE-8-256GB-WHITE",
            attributes: {
              "Color": "White",
            },
          ),
        ]),
    ProductModel(
        id: "7",
        stock: 10,
        sku: "IPHONE-12-PRO-MAX-256GB-BLACK",
        isFeatured: true,
        productType: 'product.variable',
        title: "iPhone 12 Pro Max 256GB",
        description:
            "The iPhone 12 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099. The iPhone 12 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099. The iPhone 12 Pro Max is the largest and most powerful phone Apple has ever created. It's designed to be a workhorse, with a huge battery, a massive screen, and a powerful processor. It's also the most expensive iPhone ever made, with a starting price of \$1,099.",
        price: 799,
        salePrice: 699,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_blue.png?alt=media&token=83765d6f-ba2c-4a77-8cb6-cf3814f47c73",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_green.png?alt=media&token=565b0195-991e-4579-922f-49c52cb4d814",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_red.png?alt=media&token=c8451ed2-e30d-4dea-8083-7ba3af09f314",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
        categoryId: "1",
        brand: BrandModel(
            id: "1",
            name: "Apple",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fapple-logo.png?alt=media&token=6de5d8d5-1f9e-41a2-856f-cb38d1ae4ec9",
            isFeatured: true,
            productsCount: 1234),
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Black", "Blue", "Green", "Red"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 899,
            salePrice: 799,
            stock: 0,
            description: "iPhone 12 Pro Max 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_black.png?alt=media&token=7c7383bc-ee26-45e5-a5e6-218afc859334",
            sku: "APPLE-IPAD-PRO-2021-256GB-BLACK",
            attributes: {
              "Color": "Black",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 899,
            salePrice: 799,
            stock: 10,
            description: "iPhone 12 Pro Max 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_blue.png?alt=media&token=83765d6f-ba2c-4a77-8cb6-cf3814f47c73",
            sku: "APPLE-IPAD-PRO-2021-256GB-BLUE",
            attributes: {
              "Color": "Blue",
            },
          ),
          ProductVariationModel(
            id: "3",
            price: 899,
            salePrice: 799,
            stock: 10,
            description: "iPhone 12 Pro Max 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_green.png?alt=media&token=565b0195-991e-4579-922f-49c52cb4d814",
            sku: "APPLE-IPAD-PRO-2021-256GB-GREEN",
            attributes: {
              "Color": "Green",
            },
          ),
          ProductVariationModel(
            id: "4",
            price: 899,
            salePrice: 799,
            stock: 10,
            description: "iPhone 12 Pro Max 256GB",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fiphone_12_red.png?alt=media&token=c8451ed2-e30d-4dea-8083-7ba3af09f314",
            sku: "APPLE-IPAD-PRO-2021-256GB-RED",
            attributes: {
              "Color": "Red",
            },
          ),
        ]),
    ProductModel(
      id: "8",
      stock: 10,
      sku: "LEATHER-JACKET-BLACK",
      isFeatured: true,
      productType: 'product.variable',
      title: "Leather Jacket",
      description:
          "The leather jacket is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style. The leather jacket is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style. The leather jacket is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style. The leather jacket is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style.",
      price: 150,
      salePrice: 100,
      images: [
        "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fleather_jacket_1.png?alt=media&token=54c1914b-e94a-406a-b7af-36a55f214f94",
        "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fleather_jacket_2.png?alt=media&token=537a9397-ea23-4dbd-bf0b-447af2331b0a",
        "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fleather_jacket_3.png?alt=media&token=0797ae16-e5df-4b26-ae05-2b425b343e56",
        "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fleather_jacket_4.png?alt=media&token=1d0bbc00-9c9a-4d8d-a1bc-3b6e7266ea04"
      ],
      thumbnail:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fleather_jacket_4.png?alt=media&token=1d0bbc00-9c9a-4d8d-a1bc-3b6e7266ea04",
      categoryId: "1",
      brand: BrandModel(
        id: "6",
        name: "Nike",
        image:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fnike.png?alt=media&token=3638b3fe-b53c-4b93-a667-9802a59fba9b",
        isFeatured: true,
        productsCount: 6,
      ),
      productAttributes: [],
      productVariations: [],
    ),
    ProductModel(
        id: "9",
        stock: 10,
        sku: "OFFICE-CHAIR",
        isFeatured: true,
        productType: 'product.variable',
        title: "Office Chair",
        description:
            "The office chair is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style. The office chair is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style. The office chair is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style. The office chair is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style.",
        price: 69,
        salePrice: 59,
        brand: BrandModel(
          id: "3",
          name: "Ikea",
          image:
              "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fikea_logo.png?alt=media&token=6715ca71-37be-4c21-95b5-18eca6aed1d5",
          isFeatured: true,
          productsCount: 32,
        ),
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_chair_1.png?alt=media&token=784ef1ac-ba0e-420c-a5bc-d9efaec1e0c8",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_chair_2.png?alt=media&token=569c6704-57a2-4cd8-b8cf-ff758d0e7172",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_chair_2.png?alt=media&token=569c6704-57a2-4cd8-b8cf-ff758d0e7172",
        categoryId: "1",
        productAttributes: [
          ProductAttributeModel(name: "Type", values: ["Gamming", "Office"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Office Chair",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_chair_1.png?alt=media&token=784ef1ac-ba0e-420c-a5bc-d9efaec1e0c8",
            sku: "OFFICE-CHAIR-GAMMING",
            attributes: {
              "Type": "Gamming",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Office Chair",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_chair_2.png?alt=media&token=569c6704-57a2-4cd8-b8cf-ff758d0e7172",
            sku: "OFFICE-CHAIR-OFFICE",
            attributes: {
              "Type": "Office",
            },
          ),
        ]),
    ProductModel(
        id: "10",
        stock: 10,
        sku: "OFFICE-DESK",
        isFeatured: true,
        productType: 'product.variable',
        title: "Desk Office",
        brand: BrandModel(
          id: "3",
          name: "Ikea",
          image:
              "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fikea_logo.png?alt=media&token=6715ca71-37be-4c21-95b5-18eca6aed1d5",
          isFeatured: true,
          productsCount: 32,
        ),
        description:
            "The office desk is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style. The office desk is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style. The office desk is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style. The office desk is a classic piece of furniture that has been around for centuries. It's a timeless piece that never goes out of style.",
        price: 89,
        salePrice: 79,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_desk_1.png?alt=media&token=898aead2-7a17-485b-9a01-15823a0ea853",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_desk_2.png?alt=media&token=04270eb5-997a-45b2-a0bb-b742b50dcccf",
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_desk_2.png?alt=media&token=04270eb5-997a-45b2-a0bb-b742b50dcccf",
        categoryId: "1",
        productAttributes: [
          ProductAttributeModel(name: "Color", values: ["White", "Red"]),
        ],
        productVariations: [
          ProductVariationModel(
            id: "1",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Office Desk",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_desk_1.png?alt=media&token=898aead2-7a17-485b-9a01-15823a0ea853",
            sku: "OFFICE-DESK-WHITE",
            attributes: {
              "Color": "White",
            },
          ),
          ProductVariationModel(
            id: "2",
            price: 2000,
            salePrice: 1667,
            stock: 2,
            description: "Office Desk",
            image:
                "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Foffice_desk_2.png?alt=media&token=04270eb5-997a-45b2-a0bb-b742b50dcccf",
            sku: "OFFICE-DESK-RED",
            attributes: {
              "Color": "Red",
            },
          ),
        ]),
    ProductModel(
        id: "11",
        stock: 10,
        sku: "SAMSUNG-S9-MOBILE",
        isFeatured: true,
        productType: 'product.variable',
        title: "Samsung S9 Mobile",
        brand: BrandModel(
          id: "2",
          name: "SS",
          image:
              "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fsamsung_logo.png?alt=media&token=64098edd-fce0-4b80-93b5-fa047c2d5534",
          isFeatured: true,
          productsCount: 420,
        ),
        description:
            "The Samsung S9 is a smartphone designed, developed, and marketed by Samsung Inc. It is the eleventh generation of the Samsung. It was announced on September 12, 2017, alongside the Samsung S9 Plus and the Samsung X at the Steve Jobs Theater in the Apple Park campus. The Samsung S9 is a smartphone designed, developed, and marketed by Samsung Inc. It is the eleventh generation of the Samsung. It was announced on September 12, 2017, alongside the Samsung S9 Plus and the Samsung X at the Steve Jobs Theater in the Apple Park campus. The Samsung S9 is a smartphone designed, developed, and marketed by Samsung Inc. It is the eleventh generation of the Samsung. It was announced on September 12, 2017, alongside the Samsung S9 Plus and the Samsung X at the Steve Jobs Theater in the Apple Park campus. The Samsung S9 is a smartphone designed, developed, and marketed by Samsung Inc. It is the eleventh generation of the Samsung. It was announced on September 12, 2017, alongside the Samsung S9 Plus and the Samsung X at the Steve Jobs Theater in the Apple Park campus.",
        price: 299,
        salePrice: 199,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fsamsung_s9_mobile.png?alt=media&token=40eeb3a9-75a5-4f11-a973-25e028dfb55e",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fsamsung_s9_mobile_back.png?alt=media&token=9c802ed7-0780-47d4-b2dc-68f26d4a680b",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fsamsung_s9_mobile_withback.png?alt=media&token=12817292-4bba-4535-b4fd-5f9dccd07e8d"
        ],
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fsamsung_s9_mobile_withback.png?alt=media&token=12817292-4bba-4535-b4fd-5f9dccd07e8d",
        categoryId: "1",
        productAttributes: [],
        productVariations: []),
    ProductModel(
        id: "12",
        stock: 10,
        sku: "SLIPPER",
        isFeatured: true,
        productType: 'product.variable',
        brand: BrandModel(
          id: "6",
          name: "Nike",
          image:
              "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fnike.png?alt=media&token=3638b3fe-b53c-4b93-a667-9802a59fba9b",
          isFeatured: true,
          productsCount: 6,
        ),
        title: "Slipper",
        description:
            "The slipper is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style. The slipper is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style. The slipper is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style. The slipper is a classic piece of clothing that has been around for centuries. It's a timeless piece that never goes out of style.",
        price: 39,
        salePrice: 25,
        images: [
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fslipper-product-1.png?alt=media&token=f2bea5e6-8ac0-45c9-8f08-c1cef38849e2",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fslipper-product-2.png?alt=media&token=c4f56e21-8796-4fa8-82cf-afc3bd9820db",
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fslipper-product-3.png?alt=media&token=010dc3a7-3e65-4fb9-99a7-1e9ca2bb8fd2"
        ],
        categoryId: "1",
        thumbnail:
            'https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/Products%2Fslipper-product.png?alt=media&token=7dce39dc-54d7-4d53-b791-67e8ef35107e',
        productAttributes: [],
        productVariations: [])
  ];

  static List<BrandModel> listBrands = [
    BrandModel(
      id: "1",
      name: "Apple",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fapple-logo.png?alt=media&token=6de5d8d5-1f9e-41a2-856f-cb38d1ae4ec9",
      isFeatured: true,
      productsCount: 1234,
    ),
    BrandModel(
      id: "2",
      name: "Samsung",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fsamsung_logo.png?alt=media&token=64098edd-fce0-4b80-93b5-fa047c2d5534",
      isFeatured: true,
      productsCount: 420,
    ),
    BrandModel(
      id: "3",
      name: "Ikea",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fikea_logo.png?alt=media&token=6715ca71-37be-4c21-95b5-18eca6aed1d5",
      isFeatured: true,
      productsCount: 32,
    ),
    BrandModel(
      id: "4",
      name: "Zara",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fzara-logo.png?alt=media&token=a0a97271-9ff7-4672-914c-2fa4d0870b35",
      isFeatured: true,
      productsCount: 120,
    ),
    BrandModel(
      id: "5",
      name: "Acer",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Facer_logo.png?alt=media&token=c920e35f-5172-49e2-a96b-4ed598e17f1d",
      isFeatured: true,
      productsCount: 6,
    ),
    BrandModel(
      id: "6",
      name: "Nike",
      image:
          "https://firebasestorage.googleapis.com/v0/b/ecommerceapp-e301c.appspot.com/o/brands%2Fnike.png?alt=media&token=3638b3fe-b53c-4b93-a667-9802a59fba9b",
      isFeatured: true,
      productsCount: 6,
    ),
  ];

  // List Product Categories
  static List<ProductCategoryModel> listProductCategory = [
    // Electronics
    ProductCategoryModel(
      id: '1',
      categoryId: '2',
      productId: '1',
    ),
    ProductCategoryModel(
      id: '2',
      categoryId: '2',
      productId: '3',
    ),
    ProductCategoryModel(
      id: '3',
      categoryId: '2',
      productId: '4',
    ),
    ProductCategoryModel(
      id: '4',
      categoryId: '2',
      productId: '6',
    ),
    ProductCategoryModel(
      id: '5',
      categoryId: '2',
      productId: '7',
    ),
    ProductCategoryModel(
      id: '6',
      categoryId: '2',
      productId: '8',
    ),
    // Shoes
    ProductCategoryModel(
      id: '7',
      categoryId: '6',
      productId: '2',
    ),
    ProductCategoryModel(
      id: '8',
      categoryId: '6',
      productId: '12',
    ),
    // Clothes
    ProductCategoryModel(
      id: '9',
      categoryId: '4',
      productId: '8',
    ),
    // Furnitures
    ProductCategoryModel(
      id: '10',
      categoryId: '7',
      productId: '9',
    ),
    ProductCategoryModel(
      id: '11',
      categoryId: '7',
      productId: '5',
    ),
    ProductCategoryModel(
      id: '12',
      categoryId: '7',
      productId: '10',
    ),
  ];

  // List Brand Categories
  static List<BrandCategoryModel> listBrandCategory = [
    // Electronics
    BrandCategoryModel(
      id: '1',
      categoryId: '2',
      brandId: '1',
    ),
    BrandCategoryModel(
      id: '2',
      categoryId: '2',
      brandId: '2',
    ),
    BrandCategoryModel(
      id: '3',
      categoryId: '2',
      brandId: '5',
    ),
    // Clothes
    BrandCategoryModel(
      id: '4',
      categoryId: '4',
      brandId: '6',
    ),
    // Shoes
    BrandCategoryModel(
      id: '5',
      categoryId: '6',
      brandId: '6',
    ),
    // Furnitures
    BrandCategoryModel(
      id: '6',
      categoryId: '7',
      brandId: '3',
    ),
    BrandCategoryModel(
      id: '7',
      categoryId: '7',
      brandId: '4',
    ),
  ];
}
