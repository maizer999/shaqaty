import 'dart:io';

class AddItemData {
  String? name;
  String? description;
  String? categoryId;
  String? allCategoryIds;
  String? price;
  String? contact;
  String? videoLink;
  String? address;
  String? country;
  String? city;
  String? state;
  String? latitude;
  String? longitude;
  String? showOnlyToPremium;
  List<File> images;

  AddItemData({
    this.name,
    this.description,
    this.categoryId,
    this.allCategoryIds,
    this.price,
    this.contact,
    this.videoLink,
    this.address,
    this.country,
    this.city,
    this.state,
    this.latitude,
    this.longitude,
    this.showOnlyToPremium,
    this.images = const [],
  });

  AddItemData copyWith({
    String? name,
    String? description,
    String? categoryId,
    String? allCategoryIds,
    String? price,
    String? contact,
    String? videoLink,
    String? address,
    String? country,
    String? city,
    String? state,
    String? latitude,
    String? longitude,
    String? showOnlyToPremium,
    List<File>? images,
  }) {
    return AddItemData(
      name: name ?? this.name,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      allCategoryIds: allCategoryIds ?? this.allCategoryIds,
      price: price ?? this.price,
      contact: contact ?? this.contact,
      videoLink: videoLink ?? this.videoLink,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      state: state ?? this.state,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      showOnlyToPremium: showOnlyToPremium ?? this.showOnlyToPremium,
      images: images ?? this.images,
    );
  }
}
