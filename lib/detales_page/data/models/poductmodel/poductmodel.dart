import 'package:equatable/equatable.dart';

import 'category.dart';
import 'review.dart';

class Poductmodel extends Equatable {
  final int? id;
  final Category? category;
  final String? name;
  final String? price;
  final String? discountPrice;
  final String? brand;
  final String? description;
  final String? image;
  final String? material;
  final String? length;
  final List<Review>? reviews;
  final double? averageRating;
  final bool? isFavorite;

  const Poductmodel({
    this.id,
    this.category,
    this.name,
    this.price,
    this.discountPrice,
    this.brand,
    this.description,
    this.image,
    this.material,
    this.length,
    this.reviews,
    this.averageRating,
    this.isFavorite,
  });

  factory Poductmodel.fromJson(Map<String, Object?> json) => Poductmodel(
    id: json['id'] as int?,
    category:
        json['category'] == null
            ? null
            : Category.fromJson(json['category']! as Map<String, Object?>),
    name: json['name'] as String?,
    price: json['price'] as String?,
    discountPrice: json['discount_price'] as String?,
    brand: json['brand'] as String?,
    description: json['description'] as String?,
    image: json['image'] as String?,
    material: json['material'] as String?,
    length: json['length'] as String?,
    reviews:
        (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, Object?>))
            .toList(),
    averageRating: (json['average_rating'] as num?)?.toDouble(),
    isFavorite: json['is_favorite'] as bool?,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'category': category?.toJson(),
    'name': name,
    'price': price,
    'discount_price': discountPrice,
    'brand': brand,
    'description': description,
    'image': image,
    'material': material,
    'length': length,
    'reviews': reviews?.map((e) => e.toJson()).toList(),
    'average_rating': averageRating,
    'is_favorite': isFavorite,
  };

  @override
  List<Object?> get props {
    return [
      id,
      category,
      name,
      price,
      discountPrice,
      brand,
      description,
      image,
      material,
      length,
      reviews,
      averageRating,
      isFavorite,
    ];
  }
}
