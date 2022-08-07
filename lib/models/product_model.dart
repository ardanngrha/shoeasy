import 'package:shoeasy/models/category_model.dart';
import 'package:shoeasy/models/gallery_model.dart';

class ProductModel {
  int? id;
  late String name;
  double? price;
  String? description;
  String? tags;
  late CategoryModel category;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  late List<GalleryModel> galleries;

  ProductModel({
    this.id,
    required this.name,
    this.price,
    this.description,
    this.tags,
    required this.category,
    // this.createdAt,
    // this.updatedAt,
    required this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    // createdAt = DateTime.parse(json['createdAt']);
    // updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      // 'createdAt': createdAt,
      // 'updatedAt': updatedAt,
    };
  }
}
