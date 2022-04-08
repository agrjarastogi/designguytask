class ItemModel {
  int id;
  String title;
  String price;
  String category;
  String description;
  String image;

  ItemModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});

  static ItemModel fromJson(Map data) {
      return ItemModel(
        category: data['category'],
        description: data['description'],
        id: data['id'].toInt(),
        title: data['title'],
        image: data['image'],
        price: data['price'].toString());
  }

  static Map toJson(ItemModel itemModel) {
    return {
      'id': itemModel.id,
      'title': itemModel.title,
      'price': itemModel.price,
      'category': itemModel.category,
      'description': itemModel.description,
      'image': itemModel.image
    };
  }

  ItemModel copy(int? id, String? title, String? price, String? category,
      String? description, String? image) {
    return ItemModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        category: category ?? this.category,
        description: description ?? this.description,
        image: image ?? this.image);
  }

  @override
  String toString() {
    return title;
  }
}
