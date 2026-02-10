// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sub_category_response.dart';

class SubCategoryResponseMapper extends ClassMapperBase<SubCategoryResponse> {
  SubCategoryResponseMapper._();

  static SubCategoryResponseMapper? _instance;
  static SubCategoryResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubCategoryResponseMapper._());
      SubCategoryDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubCategoryResponse';

  static bool? _$error(SubCategoryResponse v) => v.error;
  static const Field<SubCategoryResponse, bool> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static String? _$message(SubCategoryResponse v) => v.message;
  static const Field<SubCategoryResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static SubCategoryData? _$data(SubCategoryResponse v) => v.data;
  static const Field<SubCategoryResponse, SubCategoryData> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static int? _$code(SubCategoryResponse v) => v.code;
  static const Field<SubCategoryResponse, int> _f$code = Field(
    'code',
    _$code,
    opt: true,
  );

  @override
  final MappableFields<SubCategoryResponse> fields = const {
    #error: _f$error,
    #message: _f$message,
    #data: _f$data,
    #code: _f$code,
  };

  static SubCategoryResponse _instantiate(DecodingData data) {
    return SubCategoryResponse(
      error: data.dec(_f$error),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      code: data.dec(_f$code),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SubCategoryResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubCategoryResponse>(map);
  }

  static SubCategoryResponse fromJson(String json) {
    return ensureInitialized().decodeJson<SubCategoryResponse>(json);
  }
}

mixin SubCategoryResponseMappable {
  String toJson() {
    return SubCategoryResponseMapper.ensureInitialized()
        .encodeJson<SubCategoryResponse>(this as SubCategoryResponse);
  }

  Map<String, dynamic> toMap() {
    return SubCategoryResponseMapper.ensureInitialized()
        .encodeMap<SubCategoryResponse>(this as SubCategoryResponse);
  }

  SubCategoryResponseCopyWith<
    SubCategoryResponse,
    SubCategoryResponse,
    SubCategoryResponse
  >
  get copyWith =>
      _SubCategoryResponseCopyWithImpl<
        SubCategoryResponse,
        SubCategoryResponse
      >(this as SubCategoryResponse, $identity, $identity);
  @override
  String toString() {
    return SubCategoryResponseMapper.ensureInitialized().stringifyValue(
      this as SubCategoryResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return SubCategoryResponseMapper.ensureInitialized().equalsValue(
      this as SubCategoryResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return SubCategoryResponseMapper.ensureInitialized().hashValue(
      this as SubCategoryResponse,
    );
  }
}

extension SubCategoryResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubCategoryResponse, $Out> {
  SubCategoryResponseCopyWith<$R, SubCategoryResponse, $Out>
  get $asSubCategoryResponse => $base.as(
    (v, t, t2) => _SubCategoryResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SubCategoryResponseCopyWith<
  $R,
  $In extends SubCategoryResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  SubCategoryDataCopyWith<$R, SubCategoryData, SubCategoryData>? get data;
  $R call({bool? error, String? message, SubCategoryData? data, int? code});
  SubCategoryResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SubCategoryResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubCategoryResponse, $Out>
    implements SubCategoryResponseCopyWith<$R, SubCategoryResponse, $Out> {
  _SubCategoryResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubCategoryResponse> $mapper =
      SubCategoryResponseMapper.ensureInitialized();
  @override
  SubCategoryDataCopyWith<$R, SubCategoryData, SubCategoryData>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
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
  SubCategoryResponse $make(CopyWithData data) => SubCategoryResponse(
    error: data.get(#error, or: $value.error),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    code: data.get(#code, or: $value.code),
  );

  @override
  SubCategoryResponseCopyWith<$R2, SubCategoryResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SubCategoryResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubCategoryDataMapper extends ClassMapperBase<SubCategoryData> {
  SubCategoryDataMapper._();

  static SubCategoryDataMapper? _instance;
  static SubCategoryDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubCategoryDataMapper._());
      SubCategoryItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubCategoryData';

  static int? _$currentPage(SubCategoryData v) => v.currentPage;
  static const Field<SubCategoryData, int> _f$currentPage = Field(
    'currentPage',
    _$currentPage,
    key: r'current_page',
    opt: true,
  );
  static List<SubCategoryItem>? _$data(SubCategoryData v) => v.data;
  static const Field<SubCategoryData, List<SubCategoryItem>> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static String? _$firstPageUrl(SubCategoryData v) => v.firstPageUrl;
  static const Field<SubCategoryData, String> _f$firstPageUrl = Field(
    'firstPageUrl',
    _$firstPageUrl,
    key: r'first_page_url',
    opt: true,
  );
  static int? _$from(SubCategoryData v) => v.from;
  static const Field<SubCategoryData, int> _f$from = Field(
    'from',
    _$from,
    opt: true,
  );
  static int? _$lastPage(SubCategoryData v) => v.lastPage;
  static const Field<SubCategoryData, int> _f$lastPage = Field(
    'lastPage',
    _$lastPage,
    key: r'last_page',
    opt: true,
  );
  static String? _$lastPageUrl(SubCategoryData v) => v.lastPageUrl;
  static const Field<SubCategoryData, String> _f$lastPageUrl = Field(
    'lastPageUrl',
    _$lastPageUrl,
    key: r'last_page_url',
    opt: true,
  );
  static String? _$nextPageUrl(SubCategoryData v) => v.nextPageUrl;
  static const Field<SubCategoryData, String> _f$nextPageUrl = Field(
    'nextPageUrl',
    _$nextPageUrl,
    key: r'next_page_url',
    opt: true,
  );
  static String? _$path(SubCategoryData v) => v.path;
  static const Field<SubCategoryData, String> _f$path = Field(
    'path',
    _$path,
    opt: true,
  );
  static int? _$perPage(SubCategoryData v) => v.perPage;
  static const Field<SubCategoryData, int> _f$perPage = Field(
    'perPage',
    _$perPage,
    key: r'per_page',
    opt: true,
  );
  static int? _$prevPageUrl(SubCategoryData v) => v.prevPageUrl;
  static const Field<SubCategoryData, int> _f$prevPageUrl = Field(
    'prevPageUrl',
    _$prevPageUrl,
    key: r'prev_page_url',
    opt: true,
  );
  static int? _$to(SubCategoryData v) => v.to;
  static const Field<SubCategoryData, int> _f$to = Field('to', _$to, opt: true);
  static int? _$total(SubCategoryData v) => v.total;
  static const Field<SubCategoryData, int> _f$total = Field(
    'total',
    _$total,
    opt: true,
  );
  static int? _$totalItemCount(SubCategoryData v) => v.totalItemCount;
  static const Field<SubCategoryData, int> _f$totalItemCount = Field(
    'totalItemCount',
    _$totalItemCount,
    key: r'total_item_count',
    opt: true,
  );

  @override
  final MappableFields<SubCategoryData> fields = const {
    #currentPage: _f$currentPage,
    #data: _f$data,
    #firstPageUrl: _f$firstPageUrl,
    #from: _f$from,
    #lastPage: _f$lastPage,
    #lastPageUrl: _f$lastPageUrl,
    #nextPageUrl: _f$nextPageUrl,
    #path: _f$path,
    #perPage: _f$perPage,
    #prevPageUrl: _f$prevPageUrl,
    #to: _f$to,
    #total: _f$total,
    #totalItemCount: _f$totalItemCount,
  };
  @override
  final bool ignoreNull = true;

  static SubCategoryData _instantiate(DecodingData data) {
    return SubCategoryData(
      currentPage: data.dec(_f$currentPage),
      data: data.dec(_f$data),
      firstPageUrl: data.dec(_f$firstPageUrl),
      from: data.dec(_f$from),
      lastPage: data.dec(_f$lastPage),
      lastPageUrl: data.dec(_f$lastPageUrl),
      nextPageUrl: data.dec(_f$nextPageUrl),
      path: data.dec(_f$path),
      perPage: data.dec(_f$perPage),
      prevPageUrl: data.dec(_f$prevPageUrl),
      to: data.dec(_f$to),
      total: data.dec(_f$total),
      totalItemCount: data.dec(_f$totalItemCount),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SubCategoryData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubCategoryData>(map);
  }

  static SubCategoryData fromJson(String json) {
    return ensureInitialized().decodeJson<SubCategoryData>(json);
  }
}

mixin SubCategoryDataMappable {
  String toJson() {
    return SubCategoryDataMapper.ensureInitialized()
        .encodeJson<SubCategoryData>(this as SubCategoryData);
  }

  Map<String, dynamic> toMap() {
    return SubCategoryDataMapper.ensureInitialized().encodeMap<SubCategoryData>(
      this as SubCategoryData,
    );
  }

  SubCategoryDataCopyWith<SubCategoryData, SubCategoryData, SubCategoryData>
  get copyWith =>
      _SubCategoryDataCopyWithImpl<SubCategoryData, SubCategoryData>(
        this as SubCategoryData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SubCategoryDataMapper.ensureInitialized().stringifyValue(
      this as SubCategoryData,
    );
  }

  @override
  bool operator ==(Object other) {
    return SubCategoryDataMapper.ensureInitialized().equalsValue(
      this as SubCategoryData,
      other,
    );
  }

  @override
  int get hashCode {
    return SubCategoryDataMapper.ensureInitialized().hashValue(
      this as SubCategoryData,
    );
  }
}

extension SubCategoryDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubCategoryData, $Out> {
  SubCategoryDataCopyWith<$R, SubCategoryData, $Out> get $asSubCategoryData =>
      $base.as((v, t, t2) => _SubCategoryDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubCategoryDataCopyWith<$R, $In extends SubCategoryData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    SubCategoryItem,
    SubCategoryItemCopyWith<$R, SubCategoryItem, SubCategoryItem>
  >?
  get data;
  $R call({
    int? currentPage,
    List<SubCategoryItem>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    int? prevPageUrl,
    int? to,
    int? total,
    int? totalItemCount,
  });
  SubCategoryDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SubCategoryDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubCategoryData, $Out>
    implements SubCategoryDataCopyWith<$R, SubCategoryData, $Out> {
  _SubCategoryDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubCategoryData> $mapper =
      SubCategoryDataMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    SubCategoryItem,
    SubCategoryItemCopyWith<$R, SubCategoryItem, SubCategoryItem>
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
    Object? currentPage = $none,
    Object? data = $none,
    Object? firstPageUrl = $none,
    Object? from = $none,
    Object? lastPage = $none,
    Object? lastPageUrl = $none,
    Object? nextPageUrl = $none,
    Object? path = $none,
    Object? perPage = $none,
    Object? prevPageUrl = $none,
    Object? to = $none,
    Object? total = $none,
    Object? totalItemCount = $none,
  }) => $apply(
    FieldCopyWithData({
      if (currentPage != $none) #currentPage: currentPage,
      if (data != $none) #data: data,
      if (firstPageUrl != $none) #firstPageUrl: firstPageUrl,
      if (from != $none) #from: from,
      if (lastPage != $none) #lastPage: lastPage,
      if (lastPageUrl != $none) #lastPageUrl: lastPageUrl,
      if (nextPageUrl != $none) #nextPageUrl: nextPageUrl,
      if (path != $none) #path: path,
      if (perPage != $none) #perPage: perPage,
      if (prevPageUrl != $none) #prevPageUrl: prevPageUrl,
      if (to != $none) #to: to,
      if (total != $none) #total: total,
      if (totalItemCount != $none) #totalItemCount: totalItemCount,
    }),
  );
  @override
  SubCategoryData $make(CopyWithData data) => SubCategoryData(
    currentPage: data.get(#currentPage, or: $value.currentPage),
    data: data.get(#data, or: $value.data),
    firstPageUrl: data.get(#firstPageUrl, or: $value.firstPageUrl),
    from: data.get(#from, or: $value.from),
    lastPage: data.get(#lastPage, or: $value.lastPage),
    lastPageUrl: data.get(#lastPageUrl, or: $value.lastPageUrl),
    nextPageUrl: data.get(#nextPageUrl, or: $value.nextPageUrl),
    path: data.get(#path, or: $value.path),
    perPage: data.get(#perPage, or: $value.perPage),
    prevPageUrl: data.get(#prevPageUrl, or: $value.prevPageUrl),
    to: data.get(#to, or: $value.to),
    total: data.get(#total, or: $value.total),
    totalItemCount: data.get(#totalItemCount, or: $value.totalItemCount),
  );

  @override
  SubCategoryDataCopyWith<$R2, SubCategoryData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SubCategoryDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SubCategoryItemMapper extends ClassMapperBase<SubCategoryItem> {
  SubCategoryItemMapper._();

  static SubCategoryItemMapper? _instance;
  static SubCategoryItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubCategoryItemMapper._());
      TranslatedItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubCategoryItem';

  static int? _$id(SubCategoryItem v) => v.id;
  static const Field<SubCategoryItem, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(SubCategoryItem v) => v.name;
  static const Field<SubCategoryItem, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$slug(SubCategoryItem v) => v.slug;
  static const Field<SubCategoryItem, String> _f$slug = Field(
    'slug',
    _$slug,
    opt: true,
  );
  static String? _$description(SubCategoryItem v) => v.description;
  static const Field<SubCategoryItem, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static double? _$price(SubCategoryItem v) => v.price;
  static const Field<SubCategoryItem, double> _f$price = Field(
    'price',
    _$price,
    opt: true,
  );
  static String? _$image(SubCategoryItem v) => v.image;
  static const Field<SubCategoryItem, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static String? _$city(SubCategoryItem v) => v.city;
  static const Field<SubCategoryItem, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$state(SubCategoryItem v) => v.state;
  static const Field<SubCategoryItem, String> _f$state = Field(
    'state',
    _$state,
    opt: true,
  );
  static String? _$country(SubCategoryItem v) => v.country;
  static const Field<SubCategoryItem, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );
  static int? _$categoryId(SubCategoryItem v) => v.categoryId;
  static const Field<SubCategoryItem, int> _f$categoryId = Field(
    'categoryId',
    _$categoryId,
    key: r'category_id',
    opt: true,
  );
  static String? _$allCategoryIds(SubCategoryItem v) => v.allCategoryIds;
  static const Field<SubCategoryItem, String> _f$allCategoryIds = Field(
    'allCategoryIds',
    _$allCategoryIds,
    key: r'all_category_ids',
    opt: true,
  );
  static String? _$createdAt(SubCategoryItem v) => v.createdAt;
  static const Field<SubCategoryItem, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(SubCategoryItem v) => v.updatedAt;
  static const Field<SubCategoryItem, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static int? _$isEditedByAdmin(SubCategoryItem v) => v.isEditedByAdmin;
  static const Field<SubCategoryItem, int> _f$isEditedByAdmin = Field(
    'isEditedByAdmin',
    _$isEditedByAdmin,
    key: r'is_edited_by_admin',
    opt: true,
  );
  static String? _$adminEditReason(SubCategoryItem v) => v.adminEditReason;
  static const Field<SubCategoryItem, String> _f$adminEditReason = Field(
    'adminEditReason',
    _$adminEditReason,
    key: r'admin_edit_reason',
    opt: true,
  );
  static double? _$size(SubCategoryItem v) => v.size;
  static const Field<SubCategoryItem, double> _f$size = Field(
    'size',
    _$size,
    opt: true,
  );
  static String? _$propertyAge(SubCategoryItem v) => v.propertyAge;
  static const Field<SubCategoryItem, String> _f$propertyAge = Field(
    'propertyAge',
    _$propertyAge,
    key: r'property_age',
    opt: true,
  );
  static String? _$advertiserType(SubCategoryItem v) => v.advertiserType;
  static const Field<SubCategoryItem, String> _f$advertiserType = Field(
    'advertiserType',
    _$advertiserType,
    key: r'advertiser_type',
    opt: true,
  );
  static String? _$expiryDate(SubCategoryItem v) => v.expiryDate;
  static const Field<SubCategoryItem, String> _f$expiryDate = Field(
    'expiryDate',
    _$expiryDate,
    key: r'expiry_date',
    opt: true,
  );
  static double? _$latitude(SubCategoryItem v) => v.latitude;
  static const Field<SubCategoryItem, double> _f$latitude = Field(
    'latitude',
    _$latitude,
    opt: true,
  );
  static double? _$longitude(SubCategoryItem v) => v.longitude;
  static const Field<SubCategoryItem, double> _f$longitude = Field(
    'longitude',
    _$longitude,
    opt: true,
  );
  static String? _$address(SubCategoryItem v) => v.address;
  static const Field<SubCategoryItem, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$contact(SubCategoryItem v) => v.contact;
  static const Field<SubCategoryItem, String> _f$contact = Field(
    'contact',
    _$contact,
    opt: true,
  );
  static int? _$showOnlyToPremium(SubCategoryItem v) => v.showOnlyToPremium;
  static const Field<SubCategoryItem, int> _f$showOnlyToPremium = Field(
    'showOnlyToPremium',
    _$showOnlyToPremium,
    key: r'show_only_to_premium',
    opt: true,
  );
  static String? _$status(SubCategoryItem v) => v.status;
  static const Field<SubCategoryItem, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$rejectedReason(SubCategoryItem v) => v.rejectedReason;
  static const Field<SubCategoryItem, String> _f$rejectedReason = Field(
    'rejectedReason',
    _$rejectedReason,
    key: r'rejected_reason',
    opt: true,
  );
  static String? _$videoLink(SubCategoryItem v) => v.videoLink;
  static const Field<SubCategoryItem, String> _f$videoLink = Field(
    'videoLink',
    _$videoLink,
    key: r'video_link',
    opt: true,
  );
  static Map<String, dynamic>? _$user(SubCategoryItem v) => v.user;
  static const Field<SubCategoryItem, Map<String, dynamic>> _f$user = Field(
    'user',
    _$user,
    opt: true,
  );
  static Map<String, dynamic>? _$category(SubCategoryItem v) => v.category;
  static const Field<SubCategoryItem, Map<String, dynamic>> _f$category = Field(
    'category',
    _$category,
    opt: true,
  );
  static List<dynamic>? _$galleryImages(SubCategoryItem v) => v.galleryImages;
  static const Field<SubCategoryItem, List<dynamic>> _f$galleryImages = Field(
    'galleryImages',
    _$galleryImages,
    key: r'gallery_images',
    opt: true,
  );
  static List<dynamic>? _$featuredItems(SubCategoryItem v) => v.featuredItems;
  static const Field<SubCategoryItem, List<dynamic>> _f$featuredItems = Field(
    'featuredItems',
    _$featuredItems,
    key: r'featured_items',
    opt: true,
  );
  static bool? _$isFeature(SubCategoryItem v) => v.isFeature;
  static const Field<SubCategoryItem, bool> _f$isFeature = Field(
    'isFeature',
    _$isFeature,
    key: r'is_feature',
    opt: true,
  );
  static int? _$totalLikes(SubCategoryItem v) => v.totalLikes;
  static const Field<SubCategoryItem, int> _f$totalLikes = Field(
    'totalLikes',
    _$totalLikes,
    key: r'total_likes',
    opt: true,
  );
  static bool? _$isLiked(SubCategoryItem v) => v.isLiked;
  static const Field<SubCategoryItem, bool> _f$isLiked = Field(
    'isLiked',
    _$isLiked,
    key: r'is_liked',
    opt: true,
  );
  static TranslatedItem? _$translatedItem(SubCategoryItem v) =>
      v.translatedItem;
  static const Field<SubCategoryItem, TranslatedItem> _f$translatedItem = Field(
    'translatedItem',
    _$translatedItem,
    key: r'translated_item',
    opt: true,
  );

  @override
  final MappableFields<SubCategoryItem> fields = const {
    #id: _f$id,
    #name: _f$name,
    #slug: _f$slug,
    #description: _f$description,
    #price: _f$price,
    #image: _f$image,
    #city: _f$city,
    #state: _f$state,
    #country: _f$country,
    #categoryId: _f$categoryId,
    #allCategoryIds: _f$allCategoryIds,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isEditedByAdmin: _f$isEditedByAdmin,
    #adminEditReason: _f$adminEditReason,
    #size: _f$size,
    #propertyAge: _f$propertyAge,
    #advertiserType: _f$advertiserType,
    #expiryDate: _f$expiryDate,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #address: _f$address,
    #contact: _f$contact,
    #showOnlyToPremium: _f$showOnlyToPremium,
    #status: _f$status,
    #rejectedReason: _f$rejectedReason,
    #videoLink: _f$videoLink,
    #user: _f$user,
    #category: _f$category,
    #galleryImages: _f$galleryImages,
    #featuredItems: _f$featuredItems,
    #isFeature: _f$isFeature,
    #totalLikes: _f$totalLikes,
    #isLiked: _f$isLiked,
    #translatedItem: _f$translatedItem,
  };
  @override
  final bool ignoreNull = true;

  static SubCategoryItem _instantiate(DecodingData data) {
    return SubCategoryItem(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      slug: data.dec(_f$slug),
      description: data.dec(_f$description),
      price: data.dec(_f$price),
      image: data.dec(_f$image),
      city: data.dec(_f$city),
      state: data.dec(_f$state),
      country: data.dec(_f$country),
      categoryId: data.dec(_f$categoryId),
      allCategoryIds: data.dec(_f$allCategoryIds),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      isEditedByAdmin: data.dec(_f$isEditedByAdmin),
      adminEditReason: data.dec(_f$adminEditReason),
      size: data.dec(_f$size),
      propertyAge: data.dec(_f$propertyAge),
      advertiserType: data.dec(_f$advertiserType),
      expiryDate: data.dec(_f$expiryDate),
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      address: data.dec(_f$address),
      contact: data.dec(_f$contact),
      showOnlyToPremium: data.dec(_f$showOnlyToPremium),
      status: data.dec(_f$status),
      rejectedReason: data.dec(_f$rejectedReason),
      videoLink: data.dec(_f$videoLink),
      user: data.dec(_f$user),
      category: data.dec(_f$category),
      galleryImages: data.dec(_f$galleryImages),
      featuredItems: data.dec(_f$featuredItems),
      isFeature: data.dec(_f$isFeature),
      totalLikes: data.dec(_f$totalLikes),
      isLiked: data.dec(_f$isLiked),
      translatedItem: data.dec(_f$translatedItem),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SubCategoryItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubCategoryItem>(map);
  }

  static SubCategoryItem fromJson(String json) {
    return ensureInitialized().decodeJson<SubCategoryItem>(json);
  }
}

mixin SubCategoryItemMappable {
  String toJson() {
    return SubCategoryItemMapper.ensureInitialized()
        .encodeJson<SubCategoryItem>(this as SubCategoryItem);
  }

  Map<String, dynamic> toMap() {
    return SubCategoryItemMapper.ensureInitialized().encodeMap<SubCategoryItem>(
      this as SubCategoryItem,
    );
  }

  SubCategoryItemCopyWith<SubCategoryItem, SubCategoryItem, SubCategoryItem>
  get copyWith =>
      _SubCategoryItemCopyWithImpl<SubCategoryItem, SubCategoryItem>(
        this as SubCategoryItem,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SubCategoryItemMapper.ensureInitialized().stringifyValue(
      this as SubCategoryItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return SubCategoryItemMapper.ensureInitialized().equalsValue(
      this as SubCategoryItem,
      other,
    );
  }

  @override
  int get hashCode {
    return SubCategoryItemMapper.ensureInitialized().hashValue(
      this as SubCategoryItem,
    );
  }
}

extension SubCategoryItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubCategoryItem, $Out> {
  SubCategoryItemCopyWith<$R, SubCategoryItem, $Out> get $asSubCategoryItem =>
      $base.as((v, t, t2) => _SubCategoryItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SubCategoryItemCopyWith<$R, $In extends SubCategoryItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get user;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get category;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get galleryImages;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get featuredItems;
  TranslatedItemCopyWith<$R, TranslatedItem, TranslatedItem>?
  get translatedItem;
  $R call({
    int? id,
    String? name,
    String? slug,
    String? description,
    double? price,
    String? image,
    String? city,
    String? state,
    String? country,
    int? categoryId,
    String? allCategoryIds,
    String? createdAt,
    String? updatedAt,
    int? isEditedByAdmin,
    String? adminEditReason,
    double? size,
    String? propertyAge,
    String? advertiserType,
    String? expiryDate,
    double? latitude,
    double? longitude,
    String? address,
    String? contact,
    int? showOnlyToPremium,
    String? status,
    String? rejectedReason,
    String? videoLink,
    Map<String, dynamic>? user,
    Map<String, dynamic>? category,
    List<dynamic>? galleryImages,
    List<dynamic>? featuredItems,
    bool? isFeature,
    int? totalLikes,
    bool? isLiked,
    TranslatedItem? translatedItem,
  });
  SubCategoryItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SubCategoryItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubCategoryItem, $Out>
    implements SubCategoryItemCopyWith<$R, SubCategoryItem, $Out> {
  _SubCategoryItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubCategoryItem> $mapper =
      SubCategoryItemMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get user => $value.user != null
      ? MapCopyWith(
          $value.user!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(user: v),
        )
      : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get category => $value.category != null
      ? MapCopyWith(
          $value.category!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(category: v),
        )
      : null;
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get galleryImages => $value.galleryImages != null
      ? ListCopyWith(
          $value.galleryImages!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(galleryImages: v),
        )
      : null;
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get featuredItems => $value.featuredItems != null
      ? ListCopyWith(
          $value.featuredItems!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(featuredItems: v),
        )
      : null;
  @override
  TranslatedItemCopyWith<$R, TranslatedItem, TranslatedItem>?
  get translatedItem =>
      $value.translatedItem?.copyWith.$chain((v) => call(translatedItem: v));
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? slug = $none,
    Object? description = $none,
    Object? price = $none,
    Object? image = $none,
    Object? city = $none,
    Object? state = $none,
    Object? country = $none,
    Object? categoryId = $none,
    Object? allCategoryIds = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? isEditedByAdmin = $none,
    Object? adminEditReason = $none,
    Object? size = $none,
    Object? propertyAge = $none,
    Object? advertiserType = $none,
    Object? expiryDate = $none,
    Object? latitude = $none,
    Object? longitude = $none,
    Object? address = $none,
    Object? contact = $none,
    Object? showOnlyToPremium = $none,
    Object? status = $none,
    Object? rejectedReason = $none,
    Object? videoLink = $none,
    Object? user = $none,
    Object? category = $none,
    Object? galleryImages = $none,
    Object? featuredItems = $none,
    Object? isFeature = $none,
    Object? totalLikes = $none,
    Object? isLiked = $none,
    Object? translatedItem = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (slug != $none) #slug: slug,
      if (description != $none) #description: description,
      if (price != $none) #price: price,
      if (image != $none) #image: image,
      if (city != $none) #city: city,
      if (state != $none) #state: state,
      if (country != $none) #country: country,
      if (categoryId != $none) #categoryId: categoryId,
      if (allCategoryIds != $none) #allCategoryIds: allCategoryIds,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (isEditedByAdmin != $none) #isEditedByAdmin: isEditedByAdmin,
      if (adminEditReason != $none) #adminEditReason: adminEditReason,
      if (size != $none) #size: size,
      if (propertyAge != $none) #propertyAge: propertyAge,
      if (advertiserType != $none) #advertiserType: advertiserType,
      if (expiryDate != $none) #expiryDate: expiryDate,
      if (latitude != $none) #latitude: latitude,
      if (longitude != $none) #longitude: longitude,
      if (address != $none) #address: address,
      if (contact != $none) #contact: contact,
      if (showOnlyToPremium != $none) #showOnlyToPremium: showOnlyToPremium,
      if (status != $none) #status: status,
      if (rejectedReason != $none) #rejectedReason: rejectedReason,
      if (videoLink != $none) #videoLink: videoLink,
      if (user != $none) #user: user,
      if (category != $none) #category: category,
      if (galleryImages != $none) #galleryImages: galleryImages,
      if (featuredItems != $none) #featuredItems: featuredItems,
      if (isFeature != $none) #isFeature: isFeature,
      if (totalLikes != $none) #totalLikes: totalLikes,
      if (isLiked != $none) #isLiked: isLiked,
      if (translatedItem != $none) #translatedItem: translatedItem,
    }),
  );
  @override
  SubCategoryItem $make(CopyWithData data) => SubCategoryItem(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    slug: data.get(#slug, or: $value.slug),
    description: data.get(#description, or: $value.description),
    price: data.get(#price, or: $value.price),
    image: data.get(#image, or: $value.image),
    city: data.get(#city, or: $value.city),
    state: data.get(#state, or: $value.state),
    country: data.get(#country, or: $value.country),
    categoryId: data.get(#categoryId, or: $value.categoryId),
    allCategoryIds: data.get(#allCategoryIds, or: $value.allCategoryIds),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    isEditedByAdmin: data.get(#isEditedByAdmin, or: $value.isEditedByAdmin),
    adminEditReason: data.get(#adminEditReason, or: $value.adminEditReason),
    size: data.get(#size, or: $value.size),
    propertyAge: data.get(#propertyAge, or: $value.propertyAge),
    advertiserType: data.get(#advertiserType, or: $value.advertiserType),
    expiryDate: data.get(#expiryDate, or: $value.expiryDate),
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
    user: data.get(#user, or: $value.user),
    category: data.get(#category, or: $value.category),
    galleryImages: data.get(#galleryImages, or: $value.galleryImages),
    featuredItems: data.get(#featuredItems, or: $value.featuredItems),
    isFeature: data.get(#isFeature, or: $value.isFeature),
    totalLikes: data.get(#totalLikes, or: $value.totalLikes),
    isLiked: data.get(#isLiked, or: $value.isLiked),
    translatedItem: data.get(#translatedItem, or: $value.translatedItem),
  );

  @override
  SubCategoryItemCopyWith<$R2, SubCategoryItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SubCategoryItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TranslatedItemMapper extends ClassMapperBase<TranslatedItem> {
  TranslatedItemMapper._();

  static TranslatedItemMapper? _instance;
  static TranslatedItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TranslatedItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TranslatedItem';

  static String? _$name(TranslatedItem v) => v.name;
  static const Field<TranslatedItem, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$description(TranslatedItem v) => v.description;
  static const Field<TranslatedItem, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$address(TranslatedItem v) => v.address;
  static const Field<TranslatedItem, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$rejectedReason(TranslatedItem v) => v.rejectedReason;
  static const Field<TranslatedItem, String> _f$rejectedReason = Field(
    'rejectedReason',
    _$rejectedReason,
    key: r'rejected_reason',
    opt: true,
  );
  static String? _$adminEditReason(TranslatedItem v) => v.adminEditReason;
  static const Field<TranslatedItem, String> _f$adminEditReason = Field(
    'adminEditReason',
    _$adminEditReason,
    key: r'admin_edit_reason',
    opt: true,
  );
  static String? _$city(TranslatedItem v) => v.city;
  static const Field<TranslatedItem, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$state(TranslatedItem v) => v.state;
  static const Field<TranslatedItem, String> _f$state = Field(
    'state',
    _$state,
    opt: true,
  );
  static String? _$country(TranslatedItem v) => v.country;
  static const Field<TranslatedItem, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );

  @override
  final MappableFields<TranslatedItem> fields = const {
    #name: _f$name,
    #description: _f$description,
    #address: _f$address,
    #rejectedReason: _f$rejectedReason,
    #adminEditReason: _f$adminEditReason,
    #city: _f$city,
    #state: _f$state,
    #country: _f$country,
  };
  @override
  final bool ignoreNull = true;

  static TranslatedItem _instantiate(DecodingData data) {
    return TranslatedItem(
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      address: data.dec(_f$address),
      rejectedReason: data.dec(_f$rejectedReason),
      adminEditReason: data.dec(_f$adminEditReason),
      city: data.dec(_f$city),
      state: data.dec(_f$state),
      country: data.dec(_f$country),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TranslatedItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TranslatedItem>(map);
  }

  static TranslatedItem fromJson(String json) {
    return ensureInitialized().decodeJson<TranslatedItem>(json);
  }
}

mixin TranslatedItemMappable {
  String toJson() {
    return TranslatedItemMapper.ensureInitialized().encodeJson<TranslatedItem>(
      this as TranslatedItem,
    );
  }

  Map<String, dynamic> toMap() {
    return TranslatedItemMapper.ensureInitialized().encodeMap<TranslatedItem>(
      this as TranslatedItem,
    );
  }

  TranslatedItemCopyWith<TranslatedItem, TranslatedItem, TranslatedItem>
  get copyWith => _TranslatedItemCopyWithImpl<TranslatedItem, TranslatedItem>(
    this as TranslatedItem,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return TranslatedItemMapper.ensureInitialized().stringifyValue(
      this as TranslatedItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return TranslatedItemMapper.ensureInitialized().equalsValue(
      this as TranslatedItem,
      other,
    );
  }

  @override
  int get hashCode {
    return TranslatedItemMapper.ensureInitialized().hashValue(
      this as TranslatedItem,
    );
  }
}

extension TranslatedItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TranslatedItem, $Out> {
  TranslatedItemCopyWith<$R, TranslatedItem, $Out> get $asTranslatedItem =>
      $base.as((v, t, t2) => _TranslatedItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TranslatedItemCopyWith<$R, $In extends TranslatedItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    String? description,
    String? address,
    String? rejectedReason,
    String? adminEditReason,
    String? city,
    String? state,
    String? country,
  });
  TranslatedItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TranslatedItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TranslatedItem, $Out>
    implements TranslatedItemCopyWith<$R, TranslatedItem, $Out> {
  _TranslatedItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TranslatedItem> $mapper =
      TranslatedItemMapper.ensureInitialized();
  @override
  $R call({
    Object? name = $none,
    Object? description = $none,
    Object? address = $none,
    Object? rejectedReason = $none,
    Object? adminEditReason = $none,
    Object? city = $none,
    Object? state = $none,
    Object? country = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (description != $none) #description: description,
      if (address != $none) #address: address,
      if (rejectedReason != $none) #rejectedReason: rejectedReason,
      if (adminEditReason != $none) #adminEditReason: adminEditReason,
      if (city != $none) #city: city,
      if (state != $none) #state: state,
      if (country != $none) #country: country,
    }),
  );
  @override
  TranslatedItem $make(CopyWithData data) => TranslatedItem(
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    address: data.get(#address, or: $value.address),
    rejectedReason: data.get(#rejectedReason, or: $value.rejectedReason),
    adminEditReason: data.get(#adminEditReason, or: $value.adminEditReason),
    city: data.get(#city, or: $value.city),
    state: data.get(#state, or: $value.state),
    country: data.get(#country, or: $value.country),
  );

  @override
  TranslatedItemCopyWith<$R2, TranslatedItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TranslatedItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

