import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int? id;
  final String? user;
  final int? rating;
  final String? comment;
  final String? createdAt;

  const Review({this.id, this.user, this.rating, this.comment, this.createdAt});

  factory Review.fromJson(Map<String, Object?> json) => Review(
    id: json['id'] as int?,
    user: json['user'] as String?,
    rating: json['rating'] as int?,
    comment: json['comment'] as String?,
    createdAt: json['created_at'] as String?,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'user': user,
    'rating': rating,
    'comment': comment,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props => [id, user, rating, comment, createdAt];
}
