// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'package_model.dart';

class PackageModelMapper extends ClassMapperBase<PackageModel> {
  PackageModelMapper._();

  static PackageModelMapper? _instance;
  static PackageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PackageModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PackageModel';

  static int? _$id(PackageModel v) => v.id;
  static const Field<PackageModel, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(PackageModel v) => v.name;
  static const Field<PackageModel, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$translatedName(PackageModel v) => v.translatedName;
  static const Field<PackageModel, String> _f$translatedName = Field(
    'translatedName',
    _$translatedName,
    key: r'translated_name',
    opt: true,
  );
  static num? _$finalPrice(PackageModel v) => v.finalPrice;
  static const Field<PackageModel, num> _f$finalPrice = Field(
    'finalPrice',
    _$finalPrice,
    key: r'final_price',
    opt: true,
  );
  static String? _$duration(PackageModel v) => v.duration;
  static const Field<PackageModel, String> _f$duration = Field(
    'duration',
    _$duration,
    opt: true,
  );
  static String? _$itemLimit(PackageModel v) => v.itemLimit;
  static const Field<PackageModel, String> _f$itemLimit = Field(
    'itemLimit',
    _$itemLimit,
    key: r'item_limit',
    opt: true,
  );
  static String? _$type(PackageModel v) => v.type;
  static const Field<PackageModel, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static bool? _$isActive(PackageModel v) => v.isActive;
  static const Field<PackageModel, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    key: r'is_active',
    opt: true,
  );
  static String _$displayName(PackageModel v) => v.displayName;
  static const Field<PackageModel, String> _f$displayName = Field(
    'displayName',
    _$displayName,
    key: r'display_name',
    mode: FieldMode.member,
  );
  static bool _$isFree(PackageModel v) => v.isFree;
  static const Field<PackageModel, bool> _f$isFree = Field(
    'isFree',
    _$isFree,
    key: r'is_free',
    mode: FieldMode.member,
  );
  static bool _$active(PackageModel v) => v.active;
  static const Field<PackageModel, bool> _f$active = Field(
    'active',
    _$active,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<PackageModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #translatedName: _f$translatedName,
    #finalPrice: _f$finalPrice,
    #duration: _f$duration,
    #itemLimit: _f$itemLimit,
    #type: _f$type,
    #isActive: _f$isActive,
    #displayName: _f$displayName,
    #isFree: _f$isFree,
    #active: _f$active,
  };

  static PackageModel _instantiate(DecodingData data) {
    return PackageModel(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      translatedName: data.dec(_f$translatedName),
      finalPrice: data.dec(_f$finalPrice),
      duration: data.dec(_f$duration),
      itemLimit: data.dec(_f$itemLimit),
      type: data.dec(_f$type),
      isActive: data.dec(_f$isActive),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PackageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PackageModel>(map);
  }

  static PackageModel fromJson(String json) {
    return ensureInitialized().decodeJson<PackageModel>(json);
  }
}

mixin PackageModelMappable {
  String toJson() {
    return PackageModelMapper.ensureInitialized().encodeJson<PackageModel>(
      this as PackageModel,
    );
  }

  Map<String, dynamic> toMap() {
    return PackageModelMapper.ensureInitialized().encodeMap<PackageModel>(
      this as PackageModel,
    );
  }

  PackageModelCopyWith<PackageModel, PackageModel, PackageModel> get copyWith =>
      _PackageModelCopyWithImpl<PackageModel, PackageModel>(
        this as PackageModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PackageModelMapper.ensureInitialized().stringifyValue(
      this as PackageModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return PackageModelMapper.ensureInitialized().equalsValue(
      this as PackageModel,
      other,
    );
  }

  @override
  int get hashCode {
    return PackageModelMapper.ensureInitialized().hashValue(
      this as PackageModel,
    );
  }
}

extension PackageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PackageModel, $Out> {
  PackageModelCopyWith<$R, PackageModel, $Out> get $asPackageModel =>
      $base.as((v, t, t2) => _PackageModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PackageModelCopyWith<$R, $In extends PackageModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? name,
    String? translatedName,
    num? finalPrice,
    String? duration,
    String? itemLimit,
    String? type,
    bool? isActive,
  });
  PackageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PackageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PackageModel, $Out>
    implements PackageModelCopyWith<$R, PackageModel, $Out> {
  _PackageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PackageModel> $mapper =
      PackageModelMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? translatedName = $none,
    Object? finalPrice = $none,
    Object? duration = $none,
    Object? itemLimit = $none,
    Object? type = $none,
    Object? isActive = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (translatedName != $none) #translatedName: translatedName,
      if (finalPrice != $none) #finalPrice: finalPrice,
      if (duration != $none) #duration: duration,
      if (itemLimit != $none) #itemLimit: itemLimit,
      if (type != $none) #type: type,
      if (isActive != $none) #isActive: isActive,
    }),
  );
  @override
  PackageModel $make(CopyWithData data) => PackageModel(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    translatedName: data.get(#translatedName, or: $value.translatedName),
    finalPrice: data.get(#finalPrice, or: $value.finalPrice),
    duration: data.get(#duration, or: $value.duration),
    itemLimit: data.get(#itemLimit, or: $value.itemLimit),
    type: data.get(#type, or: $value.type),
    isActive: data.get(#isActive, or: $value.isActive),
  );

  @override
  PackageModelCopyWith<$R2, PackageModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PackageModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

