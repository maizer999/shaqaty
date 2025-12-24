// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'slider_response.dart';

class HomeSliderResponseMapper extends ClassMapperBase<HomeSliderResponse> {
  HomeSliderResponseMapper._();

  static HomeSliderResponseMapper? _instance;
  static HomeSliderResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeSliderResponseMapper._());
      HomeSliderItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeSliderResponse';

  static bool? _$error(HomeSliderResponse v) => v.error;
  static const Field<HomeSliderResponse, bool> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static dynamic _$message(HomeSliderResponse v) => v.message;
  static const Field<HomeSliderResponse, dynamic> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static List<HomeSliderItem>? _$data(HomeSliderResponse v) => v.data;
  static const Field<HomeSliderResponse, List<HomeSliderItem>> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static int? _$code(HomeSliderResponse v) => v.code;
  static const Field<HomeSliderResponse, int> _f$code = Field(
    'code',
    _$code,
    opt: true,
  );

  @override
  final MappableFields<HomeSliderResponse> fields = const {
    #error: _f$error,
    #message: _f$message,
    #data: _f$data,
    #code: _f$code,
  };

  static HomeSliderResponse _instantiate(DecodingData data) {
    return HomeSliderResponse(
      error: data.dec(_f$error),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      code: data.dec(_f$code),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HomeSliderResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeSliderResponse>(map);
  }

  static HomeSliderResponse fromJson(String json) {
    return ensureInitialized().decodeJson<HomeSliderResponse>(json);
  }
}

mixin HomeSliderResponseMappable {
  String toJson() {
    return HomeSliderResponseMapper.ensureInitialized()
        .encodeJson<HomeSliderResponse>(this as HomeSliderResponse);
  }

  Map<String, dynamic> toMap() {
    return HomeSliderResponseMapper.ensureInitialized()
        .encodeMap<HomeSliderResponse>(this as HomeSliderResponse);
  }

  HomeSliderResponseCopyWith<
    HomeSliderResponse,
    HomeSliderResponse,
    HomeSliderResponse
  >
  get copyWith =>
      _HomeSliderResponseCopyWithImpl<HomeSliderResponse, HomeSliderResponse>(
        this as HomeSliderResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HomeSliderResponseMapper.ensureInitialized().stringifyValue(
      this as HomeSliderResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return HomeSliderResponseMapper.ensureInitialized().equalsValue(
      this as HomeSliderResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return HomeSliderResponseMapper.ensureInitialized().hashValue(
      this as HomeSliderResponse,
    );
  }
}

extension HomeSliderResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomeSliderResponse, $Out> {
  HomeSliderResponseCopyWith<$R, HomeSliderResponse, $Out>
  get $asHomeSliderResponse => $base.as(
    (v, t, t2) => _HomeSliderResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class HomeSliderResponseCopyWith<
  $R,
  $In extends HomeSliderResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    HomeSliderItem,
    HomeSliderItemCopyWith<$R, HomeSliderItem, HomeSliderItem>
  >?
  get data;
  $R call({
    bool? error,
    dynamic message,
    List<HomeSliderItem>? data,
    int? code,
  });
  HomeSliderResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _HomeSliderResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeSliderResponse, $Out>
    implements HomeSliderResponseCopyWith<$R, HomeSliderResponse, $Out> {
  _HomeSliderResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeSliderResponse> $mapper =
      HomeSliderResponseMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    HomeSliderItem,
    HomeSliderItemCopyWith<$R, HomeSliderItem, HomeSliderItem>
  >?
  get data => $value.data != null
      ? ListCopyWith(
          $value.data!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(data: v),
        )
      : null;
  @override
  $R call({
    Object? error = $none,
    Object? message = $none,
    Object? data = $none,
    Object? code = $none,
  }) => $apply(
    FieldCopyWithData({
      if (error != $none) #error: error,
      if (message != $none) #message: message,
      if (data != $none) #data: data,
      if (code != $none) #code: code,
    }),
  );
  @override
  HomeSliderResponse $make(CopyWithData data) => HomeSliderResponse(
    error: data.get(#error, or: $value.error),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    code: data.get(#code, or: $value.code),
  );

  @override
  HomeSliderResponseCopyWith<$R2, HomeSliderResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HomeSliderResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class HomeSliderItemMapper extends ClassMapperBase<HomeSliderItem> {
  HomeSliderItemMapper._();

  static HomeSliderItemMapper? _instance;
  static HomeSliderItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeSliderItemMapper._());
      SliderModelItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeSliderItem';

  static int? _$id(HomeSliderItem v) => v.id;
  static const Field<HomeSliderItem, int> _f$id = Field('id', _$id, opt: true);
  static String? _$image(HomeSliderItem v) => v.image;
  static const Field<HomeSliderItem, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static String? _$sequence(HomeSliderItem v) => v.sequence;
  static const Field<HomeSliderItem, String> _f$sequence = Field(
    'sequence',
    _$sequence,
    opt: true,
  );
  static String? _$thirdPartyLink(HomeSliderItem v) => v.thirdPartyLink;
  static const Field<HomeSliderItem, String> _f$thirdPartyLink = Field(
    'thirdPartyLink',
    _$thirdPartyLink,
    key: r'third_party_link',
    opt: true,
  );
  static String? _$createdAt(HomeSliderItem v) => v.createdAt;
  static const Field<HomeSliderItem, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(HomeSliderItem v) => v.updatedAt;
  static const Field<HomeSliderItem, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$modelType(HomeSliderItem v) => v.modelType;
  static const Field<HomeSliderItem, String> _f$modelType = Field(
    'modelType',
    _$modelType,
    key: r'model_type',
    opt: true,
  );
  static int? _$modelId(HomeSliderItem v) => v.modelId;
  static const Field<HomeSliderItem, int> _f$modelId = Field(
    'modelId',
    _$modelId,
    key: r'model_id',
    opt: true,
  );
  static SliderModelItem? _$model(HomeSliderItem v) => v.model;
  static const Field<HomeSliderItem, SliderModelItem> _f$model = Field(
    'model',
    _$model,
    opt: true,
  );

  @override
  final MappableFields<HomeSliderItem> fields = const {
    #id: _f$id,
    #image: _f$image,
    #sequence: _f$sequence,
    #thirdPartyLink: _f$thirdPartyLink,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #modelType: _f$modelType,
    #modelId: _f$modelId,
    #model: _f$model,
  };
  @override
  final bool ignoreNull = true;

  static HomeSliderItem _instantiate(DecodingData data) {
    return HomeSliderItem(
      id: data.dec(_f$id),
      image: data.dec(_f$image),
      sequence: data.dec(_f$sequence),
      thirdPartyLink: data.dec(_f$thirdPartyLink),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      modelType: data.dec(_f$modelType),
      modelId: data.dec(_f$modelId),
      model: data.dec(_f$model),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HomeSliderItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeSliderItem>(map);
  }

  static HomeSliderItem fromJson(String json) {
    return ensureInitialized().decodeJson<HomeSliderItem>(json);
  }
}

mixin HomeSliderItemMappable {
  String toJson() {
    return HomeSliderItemMapper.ensureInitialized().encodeJson<HomeSliderItem>(
      this as HomeSliderItem,
    );
  }

  Map<String, dynamic> toMap() {
    return HomeSliderItemMapper.ensureInitialized().encodeMap<HomeSliderItem>(
      this as HomeSliderItem,
    );
  }

  HomeSliderItemCopyWith<HomeSliderItem, HomeSliderItem, HomeSliderItem>
  get copyWith => _HomeSliderItemCopyWithImpl<HomeSliderItem, HomeSliderItem>(
    this as HomeSliderItem,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return HomeSliderItemMapper.ensureInitialized().stringifyValue(
      this as HomeSliderItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return HomeSliderItemMapper.ensureInitialized().equalsValue(
      this as HomeSliderItem,
      other,
    );
  }

  @override
  int get hashCode {
    return HomeSliderItemMapper.ensureInitialized().hashValue(
      this as HomeSliderItem,
    );
  }
}

extension HomeSliderItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomeSliderItem, $Out> {
  HomeSliderItemCopyWith<$R, HomeSliderItem, $Out> get $asHomeSliderItem =>
      $base.as((v, t, t2) => _HomeSliderItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HomeSliderItemCopyWith<$R, $In extends HomeSliderItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SliderModelItemCopyWith<$R, SliderModelItem, SliderModelItem>? get model;
  $R call({
    int? id,
    String? image,
    String? sequence,
    String? thirdPartyLink,
    String? createdAt,
    String? updatedAt,
    String? modelType,
    int? modelId,
    SliderModelItem? model,
  });
  HomeSliderItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _HomeSliderItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeSliderItem, $Out>
    implements HomeSliderItemCopyWith<$R, HomeSliderItem, $Out> {
  _HomeSliderItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeSliderItem> $mapper =
      HomeSliderItemMapper.ensureInitialized();
  @override
  SliderModelItemCopyWith<$R, SliderModelItem, SliderModelItem>? get model =>
      $value.model?.copyWith.$chain((v) => call(model: v));
  @override
  $R call({
    Object? id = $none,
    Object? image = $none,
    Object? sequence = $none,
    Object? thirdPartyLink = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? modelType = $none,
    Object? modelId = $none,
    Object? model = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (image != $none) #image: image,
      if (sequence != $none) #sequence: sequence,
      if (thirdPartyLink != $none) #thirdPartyLink: thirdPartyLink,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (modelType != $none) #modelType: modelType,
      if (modelId != $none) #modelId: modelId,
      if (model != $none) #model: model,
    }),
  );
  @override
  HomeSliderItem $make(CopyWithData data) => HomeSliderItem(
    id: data.get(#id, or: $value.id),
    image: data.get(#image, or: $value.image),
    sequence: data.get(#sequence, or: $value.sequence),
    thirdPartyLink: data.get(#thirdPartyLink, or: $value.thirdPartyLink),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    modelType: data.get(#modelType, or: $value.modelType),
    modelId: data.get(#modelId, or: $value.modelId),
    model: data.get(#model, or: $value.model),
  );

  @override
  HomeSliderItemCopyWith<$R2, HomeSliderItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HomeSliderItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SliderModelItemMapper extends ClassMapperBase<SliderModelItem> {
  SliderModelItemMapper._();

  static SliderModelItemMapper? _instance;
  static SliderModelItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SliderModelItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SliderModelItem';

  static int? _$id(SliderModelItem v) => v.id;
  static const Field<SliderModelItem, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(SliderModelItem v) => v.name;
  static const Field<SliderModelItem, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$slug(SliderModelItem v) => v.slug;
  static const Field<SliderModelItem, String> _f$slug = Field(
    'slug',
    _$slug,
    opt: true,
  );
  static String? _$description(SliderModelItem v) => v.description;
  static const Field<SliderModelItem, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static double? _$price(SliderModelItem v) => v.price;
  static const Field<SliderModelItem, double> _f$price = Field(
    'price',
    _$price,
    opt: true,
  );
  static double? _$minSalary(SliderModelItem v) => v.minSalary;
  static const Field<SliderModelItem, double> _f$minSalary = Field(
    'minSalary',
    _$minSalary,
    key: r'min_salary',
    opt: true,
  );
  static double? _$maxSalary(SliderModelItem v) => v.maxSalary;
  static const Field<SliderModelItem, double> _f$maxSalary = Field(
    'maxSalary',
    _$maxSalary,
    key: r'max_salary',
    opt: true,
  );
  static String? _$image(SliderModelItem v) => v.image;
  static const Field<SliderModelItem, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static double? _$latitude(SliderModelItem v) => v.latitude;
  static const Field<SliderModelItem, double> _f$latitude = Field(
    'latitude',
    _$latitude,
    opt: true,
  );
  static double? _$longitude(SliderModelItem v) => v.longitude;
  static const Field<SliderModelItem, double> _f$longitude = Field(
    'longitude',
    _$longitude,
    opt: true,
  );
  static String? _$address(SliderModelItem v) => v.address;
  static const Field<SliderModelItem, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$contact(SliderModelItem v) => v.contact;
  static const Field<SliderModelItem, String> _f$contact = Field(
    'contact',
    _$contact,
    opt: true,
  );
  static int? _$showOnlyToPremium(SliderModelItem v) => v.showOnlyToPremium;
  static const Field<SliderModelItem, int> _f$showOnlyToPremium = Field(
    'showOnlyToPremium',
    _$showOnlyToPremium,
    key: r'show_only_to_premium',
    opt: true,
  );
  static String? _$status(SliderModelItem v) => v.status;
  static const Field<SliderModelItem, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$rejectedReason(SliderModelItem v) => v.rejectedReason;
  static const Field<SliderModelItem, String> _f$rejectedReason = Field(
    'rejectedReason',
    _$rejectedReason,
    key: r'rejected_reason',
    opt: true,
  );
  static String? _$videoLink(SliderModelItem v) => v.videoLink;
  static const Field<SliderModelItem, String> _f$videoLink = Field(
    'videoLink',
    _$videoLink,
    key: r'video_link',
    opt: true,
  );
  static String? _$city(SliderModelItem v) => v.city;
  static const Field<SliderModelItem, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$state(SliderModelItem v) => v.state;
  static const Field<SliderModelItem, String> _f$state = Field(
    'state',
    _$state,
    opt: true,
  );
  static String? _$country(SliderModelItem v) => v.country;
  static const Field<SliderModelItem, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );
  static int? _$areaId(SliderModelItem v) => v.areaId;
  static const Field<SliderModelItem, int> _f$areaId = Field(
    'areaId',
    _$areaId,
    key: r'area_id',
    opt: true,
  );
  static int? _$userId(SliderModelItem v) => v.userId;
  static const Field<SliderModelItem, int> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );
  static int? _$soldTo(SliderModelItem v) => v.soldTo;
  static const Field<SliderModelItem, int> _f$soldTo = Field(
    'soldTo',
    _$soldTo,
    key: r'sold_to',
    opt: true,
  );
  static int? _$categoryId(SliderModelItem v) => v.categoryId;
  static const Field<SliderModelItem, int> _f$categoryId = Field(
    'categoryId',
    _$categoryId,
    key: r'category_id',
    opt: true,
  );
  static String? _$allCategoryIds(SliderModelItem v) => v.allCategoryIds;
  static const Field<SliderModelItem, String> _f$allCategoryIds = Field(
    'allCategoryIds',
    _$allCategoryIds,
    key: r'all_category_ids',
    opt: true,
  );
  static String? _$expiryDate(SliderModelItem v) => v.expiryDate;
  static const Field<SliderModelItem, String> _f$expiryDate = Field(
    'expiryDate',
    _$expiryDate,
    key: r'expiry_date',
    opt: true,
  );
  static int? _$clicks(SliderModelItem v) => v.clicks;
  static const Field<SliderModelItem, int> _f$clicks = Field(
    'clicks',
    _$clicks,
    opt: true,
  );
  static String? _$createdAt(SliderModelItem v) => v.createdAt;
  static const Field<SliderModelItem, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(SliderModelItem v) => v.updatedAt;
  static const Field<SliderModelItem, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$deletedAt(SliderModelItem v) => v.deletedAt;
  static const Field<SliderModelItem, String> _f$deletedAt = Field(
    'deletedAt',
    _$deletedAt,
    key: r'deleted_at',
    opt: true,
  );
  static int? _$isEditedByAdmin(SliderModelItem v) => v.isEditedByAdmin;
  static const Field<SliderModelItem, int> _f$isEditedByAdmin = Field(
    'isEditedByAdmin',
    _$isEditedByAdmin,
    key: r'is_edited_by_admin',
    opt: true,
  );
  static String? _$adminEditReason(SliderModelItem v) => v.adminEditReason;
  static const Field<SliderModelItem, String> _f$adminEditReason = Field(
    'adminEditReason',
    _$adminEditReason,
    key: r'admin_edit_reason',
    opt: true,
  );
  static int? _$packageId(SliderModelItem v) => v.packageId;
  static const Field<SliderModelItem, int> _f$packageId = Field(
    'packageId',
    _$packageId,
    key: r'package_id',
    opt: true,
  );
  static String? _$translatedName(SliderModelItem v) => v.translatedName;
  static const Field<SliderModelItem, String> _f$translatedName = Field(
    'translatedName',
    _$translatedName,
    key: r'translated_name',
    opt: true,
  );
  static String? _$translatedDescription(SliderModelItem v) =>
      v.translatedDescription;
  static const Field<SliderModelItem, String> _f$translatedDescription = Field(
    'translatedDescription',
    _$translatedDescription,
    key: r'translated_description',
    opt: true,
  );
  static List<dynamic>? _$translations(SliderModelItem v) => v.translations;
  static const Field<SliderModelItem, List<dynamic>> _f$translations = Field(
    'translations',
    _$translations,
    opt: true,
  );

  @override
  final MappableFields<SliderModelItem> fields = const {
    #id: _f$id,
    #name: _f$name,
    #slug: _f$slug,
    #description: _f$description,
    #price: _f$price,
    #minSalary: _f$minSalary,
    #maxSalary: _f$maxSalary,
    #image: _f$image,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #address: _f$address,
    #contact: _f$contact,
    #showOnlyToPremium: _f$showOnlyToPremium,
    #status: _f$status,
    #rejectedReason: _f$rejectedReason,
    #videoLink: _f$videoLink,
    #city: _f$city,
    #state: _f$state,
    #country: _f$country,
    #areaId: _f$areaId,
    #userId: _f$userId,
    #soldTo: _f$soldTo,
    #categoryId: _f$categoryId,
    #allCategoryIds: _f$allCategoryIds,
    #expiryDate: _f$expiryDate,
    #clicks: _f$clicks,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #deletedAt: _f$deletedAt,
    #isEditedByAdmin: _f$isEditedByAdmin,
    #adminEditReason: _f$adminEditReason,
    #packageId: _f$packageId,
    #translatedName: _f$translatedName,
    #translatedDescription: _f$translatedDescription,
    #translations: _f$translations,
  };
  @override
  final bool ignoreNull = true;

  static SliderModelItem _instantiate(DecodingData data) {
    return SliderModelItem(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      slug: data.dec(_f$slug),
      description: data.dec(_f$description),
      price: data.dec(_f$price),
      minSalary: data.dec(_f$minSalary),
      maxSalary: data.dec(_f$maxSalary),
      image: data.dec(_f$image),
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      address: data.dec(_f$address),
      contact: data.dec(_f$contact),
      showOnlyToPremium: data.dec(_f$showOnlyToPremium),
      status: data.dec(_f$status),
      rejectedReason: data.dec(_f$rejectedReason),
      videoLink: data.dec(_f$videoLink),
      city: data.dec(_f$city),
      state: data.dec(_f$state),
      country: data.dec(_f$country),
      areaId: data.dec(_f$areaId),
      userId: data.dec(_f$userId),
      soldTo: data.dec(_f$soldTo),
      categoryId: data.dec(_f$categoryId),
      allCategoryIds: data.dec(_f$allCategoryIds),
      expiryDate: data.dec(_f$expiryDate),
      clicks: data.dec(_f$clicks),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      deletedAt: data.dec(_f$deletedAt),
      isEditedByAdmin: data.dec(_f$isEditedByAdmin),
      adminEditReason: data.dec(_f$adminEditReason),
      packageId: data.dec(_f$packageId),
      translatedName: data.dec(_f$translatedName),
      translatedDescription: data.dec(_f$translatedDescription),
      translations: data.dec(_f$translations),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SliderModelItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SliderModelItem>(map);
  }

  static SliderModelItem fromJson(String json) {
    return ensureInitialized().decodeJson<SliderModelItem>(json);
  }
}

mixin SliderModelItemMappable {
  String toJson() {
    return SliderModelItemMapper.ensureInitialized()
        .encodeJson<SliderModelItem>(this as SliderModelItem);
  }

  Map<String, dynamic> toMap() {
    return SliderModelItemMapper.ensureInitialized().encodeMap<SliderModelItem>(
      this as SliderModelItem,
    );
  }

  SliderModelItemCopyWith<SliderModelItem, SliderModelItem, SliderModelItem>
  get copyWith =>
      _SliderModelItemCopyWithImpl<SliderModelItem, SliderModelItem>(
        this as SliderModelItem,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SliderModelItemMapper.ensureInitialized().stringifyValue(
      this as SliderModelItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return SliderModelItemMapper.ensureInitialized().equalsValue(
      this as SliderModelItem,
      other,
    );
  }

  @override
  int get hashCode {
    return SliderModelItemMapper.ensureInitialized().hashValue(
      this as SliderModelItem,
    );
  }
}

extension SliderModelItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SliderModelItem, $Out> {
  SliderModelItemCopyWith<$R, SliderModelItem, $Out> get $asSliderModelItem =>
      $base.as((v, t, t2) => _SliderModelItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SliderModelItemCopyWith<$R, $In extends SliderModelItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get translations;
  $R call({
    int? id,
    String? name,
    String? slug,
    String? description,
    double? price,
    double? minSalary,
    double? maxSalary,
    String? image,
    double? latitude,
    double? longitude,
    String? address,
    String? contact,
    int? showOnlyToPremium,
    String? status,
    String? rejectedReason,
    String? videoLink,
    String? city,
    String? state,
    String? country,
    int? areaId,
    int? userId,
    int? soldTo,
    int? categoryId,
    String? allCategoryIds,
    String? expiryDate,
    int? clicks,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    int? isEditedByAdmin,
    String? adminEditReason,
    int? packageId,
    String? translatedName,
    String? translatedDescription,
    List<dynamic>? translations,
  });
  SliderModelItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SliderModelItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SliderModelItem, $Out>
    implements SliderModelItemCopyWith<$R, SliderModelItem, $Out> {
  _SliderModelItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SliderModelItem> $mapper =
      SliderModelItemMapper.ensureInitialized();
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get translations => $value.translations != null
      ? ListCopyWith(
          $value.translations!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(translations: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? slug = $none,
    Object? description = $none,
    Object? price = $none,
    Object? minSalary = $none,
    Object? maxSalary = $none,
    Object? image = $none,
    Object? latitude = $none,
    Object? longitude = $none,
    Object? address = $none,
    Object? contact = $none,
    Object? showOnlyToPremium = $none,
    Object? status = $none,
    Object? rejectedReason = $none,
    Object? videoLink = $none,
    Object? city = $none,
    Object? state = $none,
    Object? country = $none,
    Object? areaId = $none,
    Object? userId = $none,
    Object? soldTo = $none,
    Object? categoryId = $none,
    Object? allCategoryIds = $none,
    Object? expiryDate = $none,
    Object? clicks = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? deletedAt = $none,
    Object? isEditedByAdmin = $none,
    Object? adminEditReason = $none,
    Object? packageId = $none,
    Object? translatedName = $none,
    Object? translatedDescription = $none,
    Object? translations = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (slug != $none) #slug: slug,
      if (description != $none) #description: description,
      if (price != $none) #price: price,
      if (minSalary != $none) #minSalary: minSalary,
      if (maxSalary != $none) #maxSalary: maxSalary,
      if (image != $none) #image: image,
      if (latitude != $none) #latitude: latitude,
      if (longitude != $none) #longitude: longitude,
      if (address != $none) #address: address,
      if (contact != $none) #contact: contact,
      if (showOnlyToPremium != $none) #showOnlyToPremium: showOnlyToPremium,
      if (status != $none) #status: status,
      if (rejectedReason != $none) #rejectedReason: rejectedReason,
      if (videoLink != $none) #videoLink: videoLink,
      if (city != $none) #city: city,
      if (state != $none) #state: state,
      if (country != $none) #country: country,
      if (areaId != $none) #areaId: areaId,
      if (userId != $none) #userId: userId,
      if (soldTo != $none) #soldTo: soldTo,
      if (categoryId != $none) #categoryId: categoryId,
      if (allCategoryIds != $none) #allCategoryIds: allCategoryIds,
      if (expiryDate != $none) #expiryDate: expiryDate,
      if (clicks != $none) #clicks: clicks,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (deletedAt != $none) #deletedAt: deletedAt,
      if (isEditedByAdmin != $none) #isEditedByAdmin: isEditedByAdmin,
      if (adminEditReason != $none) #adminEditReason: adminEditReason,
      if (packageId != $none) #packageId: packageId,
      if (translatedName != $none) #translatedName: translatedName,
      if (translatedDescription != $none)
        #translatedDescription: translatedDescription,
      if (translations != $none) #translations: translations,
    }),
  );
  @override
  SliderModelItem $make(CopyWithData data) => SliderModelItem(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    slug: data.get(#slug, or: $value.slug),
    description: data.get(#description, or: $value.description),
    price: data.get(#price, or: $value.price),
    minSalary: data.get(#minSalary, or: $value.minSalary),
    maxSalary: data.get(#maxSalary, or: $value.maxSalary),
    image: data.get(#image, or: $value.image),
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
    address: data.get(#address, or: $value.address),
    contact: data.get(#contact, or: $value.contact),
    showOnlyToPremium: data.get(
      #showOnlyToPremium,
      or: $value.showOnlyToPremium,
    ),
    status: data.get(#status, or: $value.status),
    rejectedReason: data.get(#rejectedReason, or: $value.rejectedReason),
    videoLink: data.get(#videoLink, or: $value.videoLink),
    city: data.get(#city, or: $value.city),
    state: data.get(#state, or: $value.state),
    country: data.get(#country, or: $value.country),
    areaId: data.get(#areaId, or: $value.areaId),
    userId: data.get(#userId, or: $value.userId),
    soldTo: data.get(#soldTo, or: $value.soldTo),
    categoryId: data.get(#categoryId, or: $value.categoryId),
    allCategoryIds: data.get(#allCategoryIds, or: $value.allCategoryIds),
    expiryDate: data.get(#expiryDate, or: $value.expiryDate),
    clicks: data.get(#clicks, or: $value.clicks),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    deletedAt: data.get(#deletedAt, or: $value.deletedAt),
    isEditedByAdmin: data.get(#isEditedByAdmin, or: $value.isEditedByAdmin),
    adminEditReason: data.get(#adminEditReason, or: $value.adminEditReason),
    packageId: data.get(#packageId, or: $value.packageId),
    translatedName: data.get(#translatedName, or: $value.translatedName),
    translatedDescription: data.get(
      #translatedDescription,
      or: $value.translatedDescription,
    ),
    translations: data.get(#translations, or: $value.translations),
  );

  @override
  SliderModelItemCopyWith<$R2, SliderModelItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SliderModelItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

