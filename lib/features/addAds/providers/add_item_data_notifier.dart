import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/add_item_data.dart';
import 'dart:io';

class AddItemDataNotifier extends StateNotifier<AddItemData> {
  AddItemDataNotifier() : super(AddItemData());

  void setName(String val) => state = state.copyWith(name: val);
  void setDescription(String val) => state = state.copyWith(description: val);
  void setCategoryId(String val) => state = state.copyWith(categoryId: val);
  void setAllCategoryIds(String val) => state = state.copyWith(allCategoryIds: val);
  void setPrice(String val) => state = state.copyWith(price: val);
  void setContact(String val) => state = state.copyWith(contact: val);
  void setVideoLink(String val) => state = state.copyWith(videoLink: val);
  void setAddress(String val) => state = state.copyWith(address: val);
  void setCountry(String val) => state = state.copyWith(country: val);
  void setCity(String val) => state = state.copyWith(city: val);
  void setStateName(String val) => state = state.copyWith(state: val);
  void setLatitude(String val) => state = state.copyWith(latitude: val);
  void setLongitude(String val) => state = state.copyWith(longitude: val);
  void setShowOnlyToPremium(String val) => state = state.copyWith(showOnlyToPremium: val);
  void setImages(List<File> val) => state = state.copyWith(images: val);
}

final addItemDataProvider = StateNotifierProvider<AddItemDataNotifier, AddItemData>(
      (ref) => AddItemDataNotifier(),
);
