// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_response.dart';

class CategoryResponseMapper extends ClassMapperBase<CategoryResponse> {
  CategoryResponseMapper._();

  static CategoryResponseMapper? _instance;
  static CategoryResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryResponseMapper._());
      CategoryDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryResponse';

  static bool? _$error(CategoryResponse v) => v.error;
  static const Field<CategoryResponse, bool> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static dynamic _$message(CategoryResponse v) => v.message;
  static const Field<CategoryResponse, dynamic> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static CategoryData? _$data(CategoryResponse v) => v.data;
  static const Field<CategoryResponse, CategoryData> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static int? _$code(CategoryResponse v) => v.code;
  static const Field<CategoryResponse, int> _f$code = Field(
    'code',
    _$code,
    opt: true,
  );
  static dynamic _$selfCategory(CategoryResponse v) => v.selfCategory;
  static const Field<CategoryResponse, dynamic> _f$selfCategory = Field(
    'selfCategory',
    _$selfCategory,
    key: r'self_category',
    opt: true,
  );

  @override
  final MappableFields<CategoryResponse> fields = const {
    #error: _f$error,
    #message: _f$message,
    #data: _f$data,
    #code: _f$code,
    #selfCategory: _f$selfCategory,
  };

  static CategoryResponse _instantiate(DecodingData data) {
    return CategoryResponse(
      error: data.dec(_f$error),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      code: data.dec(_f$code),
      selfCategory: data.dec(_f$selfCategory),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryResponse>(map);
  }

  static CategoryResponse fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryResponse>(json);
  }
}

mixin CategoryResponseMappable {
  String toJson() {
    return CategoryResponseMapper.ensureInitialized()
        .encodeJson<CategoryResponse>(this as CategoryResponse);
  }

  Map<String, dynamic> toMap() {
    return CategoryResponseMapper.ensureInitialized()
        .encodeMap<CategoryResponse>(this as CategoryResponse);
  }

  CategoryResponseCopyWith<CategoryResponse, CategoryResponse, CategoryResponse>
  get copyWith =>
      _CategoryResponseCopyWithImpl<CategoryResponse, CategoryResponse>(
        this as CategoryResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryResponseMapper.ensureInitialized().stringifyValue(
      this as CategoryResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryResponseMapper.ensureInitialized().equalsValue(
      this as CategoryResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryResponseMapper.ensureInitialized().hashValue(
      this as CategoryResponse,
    );
  }
}

extension CategoryResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryResponse, $Out> {
  CategoryResponseCopyWith<$R, CategoryResponse, $Out>
  get $asCategoryResponse =>
      $base.as((v, t, t2) => _CategoryResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryResponseCopyWith<$R, $In extends CategoryResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CategoryDataCopyWith<$R, CategoryData, CategoryData>? get data;
  $R call({
    bool? error,
    dynamic message,
    CategoryData? data,
    int? code,
    dynamic selfCategory,
  });
  CategoryResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CategoryResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryResponse, $Out>
    implements CategoryResponseCopyWith<$R, CategoryResponse, $Out> {
  _CategoryResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryResponse> $mapper =
      CategoryResponseMapper.ensureInitialized();
  @override
  CategoryDataCopyWith<$R, CategoryData, CategoryData>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call({
    Object? error = $none,
    Object? message = $none,
    Object? data = $none,
    Object? code = $none,
    Object? selfCategory = $none,
  }) => $apply(
    FieldCopyWithData({
      if (error != $none) #error: error,
      if (message != $none) #message: message,
      if (data != $none) #data: data,
      if (code != $none) #code: code,
      if (selfCategory != $none) #selfCategory: selfCategory,
    }),
  );
  @override
  CategoryResponse $make(CopyWithData data) => CategoryResponse(
    error: data.get(#error, or: $value.error),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    code: data.get(#code, or: $value.code),
    selfCategory: data.get(#selfCategory, or: $value.selfCategory),
  );

  @override
  CategoryResponseCopyWith<$R2, CategoryResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CategoryDataMapper extends ClassMapperBase<CategoryData> {
  CategoryDataMapper._();

  static CategoryDataMapper? _instance;
  static CategoryDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryDataMapper._());
      CategoryItemMapper.ensureInitialized();
      CategoryLinkMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryData';

  static int? _$currentPage(CategoryData v) => v.currentPage;
  static const Field<CategoryData, int> _f$currentPage = Field(
    'currentPage',
    _$currentPage,
    key: r'current_page',
    opt: true,
  );
  static List<CategoryItem>? _$data(CategoryData v) => v.data;
  static const Field<CategoryData, List<CategoryItem>> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static String? _$firstPageUrl(CategoryData v) => v.firstPageUrl;
  static const Field<CategoryData, String> _f$firstPageUrl = Field(
    'firstPageUrl',
    _$firstPageUrl,
    key: r'first_page_url',
    opt: true,
  );
  static int? _$from(CategoryData v) => v.from;
  static const Field<CategoryData, int> _f$from = Field(
    'from',
    _$from,
    opt: true,
  );
  static int? _$lastPage(CategoryData v) => v.lastPage;
  static const Field<CategoryData, int> _f$lastPage = Field(
    'lastPage',
    _$lastPage,
    key: r'last_page',
    opt: true,
  );
  static String? _$lastPageUrl(CategoryData v) => v.lastPageUrl;
  static const Field<CategoryData, String> _f$lastPageUrl = Field(
    'lastPageUrl',
    _$lastPageUrl,
    key: r'last_page_url',
    opt: true,
  );
  static List<CategoryLink>? _$links(CategoryData v) => v.links;
  static const Field<CategoryData, List<CategoryLink>> _f$links = Field(
    'links',
    _$links,
    opt: true,
  );
  static String? _$nextPageUrl(CategoryData v) => v.nextPageUrl;
  static const Field<CategoryData, String> _f$nextPageUrl = Field(
    'nextPageUrl',
    _$nextPageUrl,
    key: r'next_page_url',
    opt: true,
  );
  static String? _$path(CategoryData v) => v.path;
  static const Field<CategoryData, String> _f$path = Field(
    'path',
    _$path,
    opt: true,
  );
  static int? _$perPage(CategoryData v) => v.perPage;
  static const Field<CategoryData, int> _f$perPage = Field(
    'perPage',
    _$perPage,
    key: r'per_page',
    opt: true,
  );
  static String? _$prevPageUrl(CategoryData v) => v.prevPageUrl;
  static const Field<CategoryData, String> _f$prevPageUrl = Field(
    'prevPageUrl',
    _$prevPageUrl,
    key: r'prev_page_url',
    opt: true,
  );
  static int? _$to(CategoryData v) => v.to;
  static const Field<CategoryData, int> _f$to = Field('to', _$to, opt: true);
  static int? _$total(CategoryData v) => v.total;
  static const Field<CategoryData, int> _f$total = Field(
    'total',
    _$total,
    opt: true,
  );

  @override
  final MappableFields<CategoryData> fields = const {
    #currentPage: _f$currentPage,
    #data: _f$data,
    #firstPageUrl: _f$firstPageUrl,
    #from: _f$from,
    #lastPage: _f$lastPage,
    #lastPageUrl: _f$lastPageUrl,
    #links: _f$links,
    #nextPageUrl: _f$nextPageUrl,
    #path: _f$path,
    #perPage: _f$perPage,
    #prevPageUrl: _f$prevPageUrl,
    #to: _f$to,
    #total: _f$total,
  };
  @override
  final bool ignoreNull = true;

  static CategoryData _instantiate(DecodingData data) {
    return CategoryData(
      currentPage: data.dec(_f$currentPage),
      data: data.dec(_f$data),
      firstPageUrl: data.dec(_f$firstPageUrl),
      from: data.dec(_f$from),
      lastPage: data.dec(_f$lastPage),
      lastPageUrl: data.dec(_f$lastPageUrl),
      links: data.dec(_f$links),
      nextPageUrl: data.dec(_f$nextPageUrl),
      path: data.dec(_f$path),
      perPage: data.dec(_f$perPage),
      prevPageUrl: data.dec(_f$prevPageUrl),
      to: data.dec(_f$to),
      total: data.dec(_f$total),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryData>(map);
  }

  static CategoryData fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryData>(json);
  }
}

mixin CategoryDataMappable {
  String toJson() {
    return CategoryDataMapper.ensureInitialized().encodeJson<CategoryData>(
      this as CategoryData,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryDataMapper.ensureInitialized().encodeMap<CategoryData>(
      this as CategoryData,
    );
  }

  CategoryDataCopyWith<CategoryData, CategoryData, CategoryData> get copyWith =>
      _CategoryDataCopyWithImpl<CategoryData, CategoryData>(
        this as CategoryData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryDataMapper.ensureInitialized().stringifyValue(
      this as CategoryData,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryDataMapper.ensureInitialized().equalsValue(
      this as CategoryData,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryDataMapper.ensureInitialized().hashValue(
      this as CategoryData,
    );
  }
}

extension CategoryDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryData, $Out> {
  CategoryDataCopyWith<$R, CategoryData, $Out> get $asCategoryData =>
      $base.as((v, t, t2) => _CategoryDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryDataCopyWith<$R, $In extends CategoryData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    CategoryItem,
    CategoryItemCopyWith<$R, CategoryItem, CategoryItem>
  >?
  get data;
  ListCopyWith<
    $R,
    CategoryLink,
    CategoryLinkCopyWith<$R, CategoryLink, CategoryLink>
  >?
  get links;
  $R call({
    int? currentPage,
    List<CategoryItem>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<CategoryLink>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  });
  CategoryDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryData, $Out>
    implements CategoryDataCopyWith<$R, CategoryData, $Out> {
  _CategoryDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryData> $mapper =
      CategoryDataMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    CategoryItem,
    CategoryItemCopyWith<$R, CategoryItem, CategoryItem>
  >?
  get data => $value.data != null
      ? ListCopyWith(
          $value.data!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(data: v),
        )
      : null;
  @override
  ListCopyWith<
    $R,
    CategoryLink,
    CategoryLinkCopyWith<$R, CategoryLink, CategoryLink>
  >?
  get links => $value.links != null
      ? ListCopyWith(
          $value.links!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(links: v),
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
    Object? links = $none,
    Object? nextPageUrl = $none,
    Object? path = $none,
    Object? perPage = $none,
    Object? prevPageUrl = $none,
    Object? to = $none,
    Object? total = $none,
  }) => $apply(
    FieldCopyWithData({
      if (currentPage != $none) #currentPage: currentPage,
      if (data != $none) #data: data,
      if (firstPageUrl != $none) #firstPageUrl: firstPageUrl,
      if (from != $none) #from: from,
      if (lastPage != $none) #lastPage: lastPage,
      if (lastPageUrl != $none) #lastPageUrl: lastPageUrl,
      if (links != $none) #links: links,
      if (nextPageUrl != $none) #nextPageUrl: nextPageUrl,
      if (path != $none) #path: path,
      if (perPage != $none) #perPage: perPage,
      if (prevPageUrl != $none) #prevPageUrl: prevPageUrl,
      if (to != $none) #to: to,
      if (total != $none) #total: total,
    }),
  );
  @override
  CategoryData $make(CopyWithData data) => CategoryData(
    currentPage: data.get(#currentPage, or: $value.currentPage),
    data: data.get(#data, or: $value.data),
    firstPageUrl: data.get(#firstPageUrl, or: $value.firstPageUrl),
    from: data.get(#from, or: $value.from),
    lastPage: data.get(#lastPage, or: $value.lastPage),
    lastPageUrl: data.get(#lastPageUrl, or: $value.lastPageUrl),
    links: data.get(#links, or: $value.links),
    nextPageUrl: data.get(#nextPageUrl, or: $value.nextPageUrl),
    path: data.get(#path, or: $value.path),
    perPage: data.get(#perPage, or: $value.perPage),
    prevPageUrl: data.get(#prevPageUrl, or: $value.prevPageUrl),
    to: data.get(#to, or: $value.to),
    total: data.get(#total, or: $value.total),
  );

  @override
  CategoryDataCopyWith<$R2, CategoryData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CategoryItemMapper extends ClassMapperBase<CategoryItem> {
  CategoryItemMapper._();

  static CategoryItemMapper? _instance;
  static CategoryItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryItemMapper._());
      CategoryItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryItem';

  static int? _$id(CategoryItem v) => v.id;
  static const Field<CategoryItem, int> _f$id = Field('id', _$id, opt: true);
  static int? _$sequence(CategoryItem v) => v.sequence;
  static const Field<CategoryItem, int> _f$sequence = Field(
    'sequence',
    _$sequence,
    opt: true,
  );
  static String? _$name(CategoryItem v) => v.name;
  static const Field<CategoryItem, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$image(CategoryItem v) => v.image;
  static const Field<CategoryItem, String> _f$image = Field(
    'image',
    _$image,
    opt: true,
  );
  static int? _$parentCategoryId(CategoryItem v) => v.parentCategoryId;
  static const Field<CategoryItem, int> _f$parentCategoryId = Field(
    'parentCategoryId',
    _$parentCategoryId,
    key: r'parent_category_id',
    opt: true,
  );
  static String? _$description(CategoryItem v) => v.description;
  static const Field<CategoryItem, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static int? _$status(CategoryItem v) => v.status;
  static const Field<CategoryItem, int> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$createdAt(CategoryItem v) => v.createdAt;
  static const Field<CategoryItem, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(CategoryItem v) => v.updatedAt;
  static const Field<CategoryItem, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$slug(CategoryItem v) => v.slug;
  static const Field<CategoryItem, String> _f$slug = Field(
    'slug',
    _$slug,
    opt: true,
  );
  static int? _$isJobCategory(CategoryItem v) => v.isJobCategory;
  static const Field<CategoryItem, int> _f$isJobCategory = Field(
    'isJobCategory',
    _$isJobCategory,
    key: r'is_job_category',
    opt: true,
  );
  static int? _$priceOptional(CategoryItem v) => v.priceOptional;
  static const Field<CategoryItem, int> _f$priceOptional = Field(
    'priceOptional',
    _$priceOptional,
    key: r'price_optional',
    opt: true,
  );
  static int? _$subcategoriesCount(CategoryItem v) => v.subcategoriesCount;
  static const Field<CategoryItem, int> _f$subcategoriesCount = Field(
    'subcategoriesCount',
    _$subcategoriesCount,
    key: r'subcategories_count',
    opt: true,
  );
  static int? _$allItemsCount(CategoryItem v) => v.allItemsCount;
  static const Field<CategoryItem, int> _f$allItemsCount = Field(
    'allItemsCount',
    _$allItemsCount,
    key: r'all_items_count',
    opt: true,
  );
  static String? _$translatedName(CategoryItem v) => v.translatedName;
  static const Field<CategoryItem, String> _f$translatedName = Field(
    'translatedName',
    _$translatedName,
    key: r'translated_name',
    opt: true,
  );
  static String? _$translatedDescription(CategoryItem v) =>
      v.translatedDescription;
  static const Field<CategoryItem, String> _f$translatedDescription = Field(
    'translatedDescription',
    _$translatedDescription,
    key: r'translated_description',
    opt: true,
  );
  static List<dynamic>? _$translations(CategoryItem v) => v.translations;
  static const Field<CategoryItem, List<dynamic>> _f$translations = Field(
    'translations',
    _$translations,
    opt: true,
  );
  static List<CategoryItem>? _$subcategories(CategoryItem v) => v.subcategories;
  static const Field<CategoryItem, List<CategoryItem>> _f$subcategories = Field(
    'subcategories',
    _$subcategories,
    opt: true,
  );

  @override
  final MappableFields<CategoryItem> fields = const {
    #id: _f$id,
    #sequence: _f$sequence,
    #name: _f$name,
    #image: _f$image,
    #parentCategoryId: _f$parentCategoryId,
    #description: _f$description,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #slug: _f$slug,
    #isJobCategory: _f$isJobCategory,
    #priceOptional: _f$priceOptional,
    #subcategoriesCount: _f$subcategoriesCount,
    #allItemsCount: _f$allItemsCount,
    #translatedName: _f$translatedName,
    #translatedDescription: _f$translatedDescription,
    #translations: _f$translations,
    #subcategories: _f$subcategories,
  };
  @override
  final bool ignoreNull = true;

  static CategoryItem _instantiate(DecodingData data) {
    return CategoryItem(
      id: data.dec(_f$id),
      sequence: data.dec(_f$sequence),
      name: data.dec(_f$name),
      image: data.dec(_f$image),
      parentCategoryId: data.dec(_f$parentCategoryId),
      description: data.dec(_f$description),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      slug: data.dec(_f$slug),
      isJobCategory: data.dec(_f$isJobCategory),
      priceOptional: data.dec(_f$priceOptional),
      subcategoriesCount: data.dec(_f$subcategoriesCount),
      allItemsCount: data.dec(_f$allItemsCount),
      translatedName: data.dec(_f$translatedName),
      translatedDescription: data.dec(_f$translatedDescription),
      translations: data.dec(_f$translations),
      subcategories: data.dec(_f$subcategories),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryItem>(map);
  }

  static CategoryItem fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryItem>(json);
  }
}

mixin CategoryItemMappable {
  String toJson() {
    return CategoryItemMapper.ensureInitialized().encodeJson<CategoryItem>(
      this as CategoryItem,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryItemMapper.ensureInitialized().encodeMap<CategoryItem>(
      this as CategoryItem,
    );
  }

  CategoryItemCopyWith<CategoryItem, CategoryItem, CategoryItem> get copyWith =>
      _CategoryItemCopyWithImpl<CategoryItem, CategoryItem>(
        this as CategoryItem,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryItemMapper.ensureInitialized().stringifyValue(
      this as CategoryItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryItemMapper.ensureInitialized().equalsValue(
      this as CategoryItem,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryItemMapper.ensureInitialized().hashValue(
      this as CategoryItem,
    );
  }
}

extension CategoryItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryItem, $Out> {
  CategoryItemCopyWith<$R, CategoryItem, $Out> get $asCategoryItem =>
      $base.as((v, t, t2) => _CategoryItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryItemCopyWith<$R, $In extends CategoryItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get translations;
  ListCopyWith<
    $R,
    CategoryItem,
    CategoryItemCopyWith<$R, CategoryItem, CategoryItem>
  >?
  get subcategories;
  $R call({
    int? id,
    int? sequence,
    String? name,
    String? image,
    int? parentCategoryId,
    String? description,
    int? status,
    String? createdAt,
    String? updatedAt,
    String? slug,
    int? isJobCategory,
    int? priceOptional,
    int? subcategoriesCount,
    int? allItemsCount,
    String? translatedName,
    String? translatedDescription,
    List<dynamic>? translations,
    List<CategoryItem>? subcategories,
  });
  CategoryItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryItem, $Out>
    implements CategoryItemCopyWith<$R, CategoryItem, $Out> {
  _CategoryItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryItem> $mapper =
      CategoryItemMapper.ensureInitialized();
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
  ListCopyWith<
    $R,
    CategoryItem,
    CategoryItemCopyWith<$R, CategoryItem, CategoryItem>
  >?
  get subcategories => $value.subcategories != null
      ? ListCopyWith(
          $value.subcategories!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(subcategories: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? sequence = $none,
    Object? name = $none,
    Object? image = $none,
    Object? parentCategoryId = $none,
    Object? description = $none,
    Object? status = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? slug = $none,
    Object? isJobCategory = $none,
    Object? priceOptional = $none,
    Object? subcategoriesCount = $none,
    Object? allItemsCount = $none,
    Object? translatedName = $none,
    Object? translatedDescription = $none,
    Object? translations = $none,
    Object? subcategories = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (sequence != $none) #sequence: sequence,
      if (name != $none) #name: name,
      if (image != $none) #image: image,
      if (parentCategoryId != $none) #parentCategoryId: parentCategoryId,
      if (description != $none) #description: description,
      if (status != $none) #status: status,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (slug != $none) #slug: slug,
      if (isJobCategory != $none) #isJobCategory: isJobCategory,
      if (priceOptional != $none) #priceOptional: priceOptional,
      if (subcategoriesCount != $none) #subcategoriesCount: subcategoriesCount,
      if (allItemsCount != $none) #allItemsCount: allItemsCount,
      if (translatedName != $none) #translatedName: translatedName,
      if (translatedDescription != $none)
        #translatedDescription: translatedDescription,
      if (translations != $none) #translations: translations,
      if (subcategories != $none) #subcategories: subcategories,
    }),
  );
  @override
  CategoryItem $make(CopyWithData data) => CategoryItem(
    id: data.get(#id, or: $value.id),
    sequence: data.get(#sequence, or: $value.sequence),
    name: data.get(#name, or: $value.name),
    image: data.get(#image, or: $value.image),
    parentCategoryId: data.get(#parentCategoryId, or: $value.parentCategoryId),
    description: data.get(#description, or: $value.description),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    slug: data.get(#slug, or: $value.slug),
    isJobCategory: data.get(#isJobCategory, or: $value.isJobCategory),
    priceOptional: data.get(#priceOptional, or: $value.priceOptional),
    subcategoriesCount: data.get(
      #subcategoriesCount,
      or: $value.subcategoriesCount,
    ),
    allItemsCount: data.get(#allItemsCount, or: $value.allItemsCount),
    translatedName: data.get(#translatedName, or: $value.translatedName),
    translatedDescription: data.get(
      #translatedDescription,
      or: $value.translatedDescription,
    ),
    translations: data.get(#translations, or: $value.translations),
    subcategories: data.get(#subcategories, or: $value.subcategories),
  );

  @override
  CategoryItemCopyWith<$R2, CategoryItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CategoryLinkMapper extends ClassMapperBase<CategoryLink> {
  CategoryLinkMapper._();

  static CategoryLinkMapper? _instance;
  static CategoryLinkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryLinkMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryLink';

  static String? _$url(CategoryLink v) => v.url;
  static const Field<CategoryLink, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
  );
  static String? _$label(CategoryLink v) => v.label;
  static const Field<CategoryLink, String> _f$label = Field(
    'label',
    _$label,
    opt: true,
  );
  static bool? _$active(CategoryLink v) => v.active;
  static const Field<CategoryLink, bool> _f$active = Field(
    'active',
    _$active,
    opt: true,
  );

  @override
  final MappableFields<CategoryLink> fields = const {
    #url: _f$url,
    #label: _f$label,
    #active: _f$active,
  };
  @override
  final bool ignoreNull = true;

  static CategoryLink _instantiate(DecodingData data) {
    return CategoryLink(
      url: data.dec(_f$url),
      label: data.dec(_f$label),
      active: data.dec(_f$active),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CategoryLink fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryLink>(map);
  }

  static CategoryLink fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryLink>(json);
  }
}

mixin CategoryLinkMappable {
  String toJson() {
    return CategoryLinkMapper.ensureInitialized().encodeJson<CategoryLink>(
      this as CategoryLink,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryLinkMapper.ensureInitialized().encodeMap<CategoryLink>(
      this as CategoryLink,
    );
  }

  CategoryLinkCopyWith<CategoryLink, CategoryLink, CategoryLink> get copyWith =>
      _CategoryLinkCopyWithImpl<CategoryLink, CategoryLink>(
        this as CategoryLink,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryLinkMapper.ensureInitialized().stringifyValue(
      this as CategoryLink,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryLinkMapper.ensureInitialized().equalsValue(
      this as CategoryLink,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryLinkMapper.ensureInitialized().hashValue(
      this as CategoryLink,
    );
  }
}

extension CategoryLinkValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryLink, $Out> {
  CategoryLinkCopyWith<$R, CategoryLink, $Out> get $asCategoryLink =>
      $base.as((v, t, t2) => _CategoryLinkCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryLinkCopyWith<$R, $In extends CategoryLink, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? url, String? label, bool? active});
  CategoryLinkCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryLinkCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryLink, $Out>
    implements CategoryLinkCopyWith<$R, CategoryLink, $Out> {
  _CategoryLinkCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryLink> $mapper =
      CategoryLinkMapper.ensureInitialized();
  @override
  $R call({
    Object? url = $none,
    Object? label = $none,
    Object? active = $none,
  }) => $apply(
    FieldCopyWithData({
      if (url != $none) #url: url,
      if (label != $none) #label: label,
      if (active != $none) #active: active,
    }),
  );
  @override
  CategoryLink $make(CopyWithData data) => CategoryLink(
    url: data.get(#url, or: $value.url),
    label: data.get(#label, or: $value.label),
    active: data.get(#active, or: $value.active),
  );

  @override
  CategoryLinkCopyWith<$R2, CategoryLink, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryLinkCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

