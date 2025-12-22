// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_response.dart';

class LoginResponseMapper extends ClassMapperBase<LoginResponse> {
  LoginResponseMapper._();

  static LoginResponseMapper? _instance;
  static LoginResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginResponseMapper._());
      UserDataMapper.ensureInitialized();
      LoginMetaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoginResponse';

  static String? _$status(LoginResponse v) => v.status;
  static const Field<LoginResponse, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$message(LoginResponse v) => v.message;
  static const Field<LoginResponse, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static UserData? _$data(LoginResponse v) => v.data;
  static const Field<LoginResponse, UserData> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static LoginMeta? _$meta(LoginResponse v) => v.meta;
  static const Field<LoginResponse, LoginMeta> _f$meta = Field(
    'meta',
    _$meta,
    opt: true,
  );

  @override
  final MappableFields<LoginResponse> fields = const {
    #status: _f$status,
    #message: _f$message,
    #data: _f$data,
    #meta: _f$meta,
  };

  static LoginResponse _instantiate(DecodingData data) {
    return LoginResponse(
      status: data.dec(_f$status),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      meta: data.dec(_f$meta),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoginResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginResponse>(map);
  }

  static LoginResponse fromJson(String json) {
    return ensureInitialized().decodeJson<LoginResponse>(json);
  }
}

mixin LoginResponseMappable {
  String toJson() {
    return LoginResponseMapper.ensureInitialized().encodeJson<LoginResponse>(
      this as LoginResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return LoginResponseMapper.ensureInitialized().encodeMap<LoginResponse>(
      this as LoginResponse,
    );
  }

  LoginResponseCopyWith<LoginResponse, LoginResponse, LoginResponse>
  get copyWith => _LoginResponseCopyWithImpl<LoginResponse, LoginResponse>(
    this as LoginResponse,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return LoginResponseMapper.ensureInitialized().stringifyValue(
      this as LoginResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoginResponseMapper.ensureInitialized().equalsValue(
      this as LoginResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return LoginResponseMapper.ensureInitialized().hashValue(
      this as LoginResponse,
    );
  }
}

extension LoginResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginResponse, $Out> {
  LoginResponseCopyWith<$R, LoginResponse, $Out> get $asLoginResponse =>
      $base.as((v, t, t2) => _LoginResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoginResponseCopyWith<$R, $In extends LoginResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDataCopyWith<$R, UserData, UserData>? get data;
  LoginMetaCopyWith<$R, LoginMeta, LoginMeta>? get meta;
  $R call({String? status, String? message, UserData? data, LoginMeta? meta});
  LoginResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginResponse, $Out>
    implements LoginResponseCopyWith<$R, LoginResponse, $Out> {
  _LoginResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginResponse> $mapper =
      LoginResponseMapper.ensureInitialized();
  @override
  UserDataCopyWith<$R, UserData, UserData>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  LoginMetaCopyWith<$R, LoginMeta, LoginMeta>? get meta =>
      $value.meta?.copyWith.$chain((v) => call(meta: v));
  @override
  $R call({
    Object? status = $none,
    Object? message = $none,
    Object? data = $none,
    Object? meta = $none,
  }) => $apply(
    FieldCopyWithData({
      if (status != $none) #status: status,
      if (message != $none) #message: message,
      if (data != $none) #data: data,
      if (meta != $none) #meta: meta,
    }),
  );
  @override
  LoginResponse $make(CopyWithData data) => LoginResponse(
    status: data.get(#status, or: $value.status),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    meta: data.get(#meta, or: $value.meta),
  );

  @override
  LoginResponseCopyWith<$R2, LoginResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoginResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserDataMapper extends ClassMapperBase<UserData> {
  UserDataMapper._();

  static UserDataMapper? _instance;
  static UserDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserData';

  static int? _$id(UserData v) => v.id;
  static const Field<UserData, int> _f$id = Field('id', _$id, opt: true);
  static String? _$name(UserData v) => v.name;
  static const Field<UserData, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$email(UserData v) => v.email;
  static const Field<UserData, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$mobile(UserData v) => v.mobile;
  static const Field<UserData, String> _f$mobile = Field(
    'mobile',
    _$mobile,
    opt: true,
  );
  static String? _$emailVerifiedAt(UserData v) => v.emailVerifiedAt;
  static const Field<UserData, String> _f$emailVerifiedAt = Field(
    'emailVerifiedAt',
    _$emailVerifiedAt,
    key: r'email_verified_at',
    opt: true,
  );
  static String? _$profile(UserData v) => v.profile;
  static const Field<UserData, String> _f$profile = Field(
    'profile',
    _$profile,
    opt: true,
  );
  static String? _$type(UserData v) => v.type;
  static const Field<UserData, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static String? _$fcmId(UserData v) => v.fcmId;
  static const Field<UserData, String> _f$fcmId = Field(
    'fcmId',
    _$fcmId,
    key: r'fcm_id',
    opt: true,
  );
  static int? _$notification(UserData v) => v.notification;
  static const Field<UserData, int> _f$notification = Field(
    'notification',
    _$notification,
    opt: true,
  );
  static String? _$firebaseId(UserData v) => v.firebaseId;
  static const Field<UserData, String> _f$firebaseId = Field(
    'firebaseId',
    _$firebaseId,
    key: r'firebase_id',
    opt: true,
  );
  static String? _$address(UserData v) => v.address;
  static const Field<UserData, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$createdAt(UserData v) => v.createdAt;
  static const Field<UserData, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(UserData v) => v.updatedAt;
  static const Field<UserData, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$deletedAt(UserData v) => v.deletedAt;
  static const Field<UserData, String> _f$deletedAt = Field(
    'deletedAt',
    _$deletedAt,
    key: r'deleted_at',
    opt: true,
  );
  static String? _$countryCode(UserData v) => v.countryCode;
  static const Field<UserData, String> _f$countryCode = Field(
    'countryCode',
    _$countryCode,
    key: r'country_code',
    opt: true,
  );
  static int? _$showPersonalDetails(UserData v) => v.showPersonalDetails;
  static const Field<UserData, int> _f$showPersonalDetails = Field(
    'showPersonalDetails',
    _$showPersonalDetails,
    key: r'show_personal_details',
    opt: true,
  );
  static int? _$isVerified(UserData v) => v.isVerified;
  static const Field<UserData, int> _f$isVerified = Field(
    'isVerified',
    _$isVerified,
    key: r'is_verified',
    opt: true,
  );
  static int? _$autoApproveItem(UserData v) => v.autoApproveItem;
  static const Field<UserData, int> _f$autoApproveItem = Field(
    'autoApproveItem',
    _$autoApproveItem,
    key: r'auto_approve_item',
    opt: true,
  );

  @override
  final MappableFields<UserData> fields = const {
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #mobile: _f$mobile,
    #emailVerifiedAt: _f$emailVerifiedAt,
    #profile: _f$profile,
    #type: _f$type,
    #fcmId: _f$fcmId,
    #notification: _f$notification,
    #firebaseId: _f$firebaseId,
    #address: _f$address,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #deletedAt: _f$deletedAt,
    #countryCode: _f$countryCode,
    #showPersonalDetails: _f$showPersonalDetails,
    #isVerified: _f$isVerified,
    #autoApproveItem: _f$autoApproveItem,
  };
  @override
  final bool ignoreNull = true;

  static UserData _instantiate(DecodingData data) {
    return UserData(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      email: data.dec(_f$email),
      mobile: data.dec(_f$mobile),
      emailVerifiedAt: data.dec(_f$emailVerifiedAt),
      profile: data.dec(_f$profile),
      type: data.dec(_f$type),
      fcmId: data.dec(_f$fcmId),
      notification: data.dec(_f$notification),
      firebaseId: data.dec(_f$firebaseId),
      address: data.dec(_f$address),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      deletedAt: data.dec(_f$deletedAt),
      countryCode: data.dec(_f$countryCode),
      showPersonalDetails: data.dec(_f$showPersonalDetails),
      isVerified: data.dec(_f$isVerified),
      autoApproveItem: data.dec(_f$autoApproveItem),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserData>(map);
  }

  static UserData fromJson(String json) {
    return ensureInitialized().decodeJson<UserData>(json);
  }
}

mixin UserDataMappable {
  String toJson() {
    return UserDataMapper.ensureInitialized().encodeJson<UserData>(
      this as UserData,
    );
  }

  Map<String, dynamic> toMap() {
    return UserDataMapper.ensureInitialized().encodeMap<UserData>(
      this as UserData,
    );
  }

  UserDataCopyWith<UserData, UserData, UserData> get copyWith =>
      _UserDataCopyWithImpl<UserData, UserData>(
        this as UserData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserDataMapper.ensureInitialized().stringifyValue(this as UserData);
  }

  @override
  bool operator ==(Object other) {
    return UserDataMapper.ensureInitialized().equalsValue(
      this as UserData,
      other,
    );
  }

  @override
  int get hashCode {
    return UserDataMapper.ensureInitialized().hashValue(this as UserData);
  }
}

extension UserDataValueCopy<$R, $Out> on ObjectCopyWith<$R, UserData, $Out> {
  UserDataCopyWith<$R, UserData, $Out> get $asUserData =>
      $base.as((v, t, t2) => _UserDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserDataCopyWith<$R, $In extends UserData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? emailVerifiedAt,
    String? profile,
    String? type,
    String? fcmId,
    int? notification,
    String? firebaseId,
    String? address,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? countryCode,
    int? showPersonalDetails,
    int? isVerified,
    int? autoApproveItem,
  });
  UserDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserData, $Out>
    implements UserDataCopyWith<$R, UserData, $Out> {
  _UserDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserData> $mapper =
      UserDataMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? email = $none,
    Object? mobile = $none,
    Object? emailVerifiedAt = $none,
    Object? profile = $none,
    Object? type = $none,
    Object? fcmId = $none,
    Object? notification = $none,
    Object? firebaseId = $none,
    Object? address = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? deletedAt = $none,
    Object? countryCode = $none,
    Object? showPersonalDetails = $none,
    Object? isVerified = $none,
    Object? autoApproveItem = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (email != $none) #email: email,
      if (mobile != $none) #mobile: mobile,
      if (emailVerifiedAt != $none) #emailVerifiedAt: emailVerifiedAt,
      if (profile != $none) #profile: profile,
      if (type != $none) #type: type,
      if (fcmId != $none) #fcmId: fcmId,
      if (notification != $none) #notification: notification,
      if (firebaseId != $none) #firebaseId: firebaseId,
      if (address != $none) #address: address,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (deletedAt != $none) #deletedAt: deletedAt,
      if (countryCode != $none) #countryCode: countryCode,
      if (showPersonalDetails != $none)
        #showPersonalDetails: showPersonalDetails,
      if (isVerified != $none) #isVerified: isVerified,
      if (autoApproveItem != $none) #autoApproveItem: autoApproveItem,
    }),
  );
  @override
  UserData $make(CopyWithData data) => UserData(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    email: data.get(#email, or: $value.email),
    mobile: data.get(#mobile, or: $value.mobile),
    emailVerifiedAt: data.get(#emailVerifiedAt, or: $value.emailVerifiedAt),
    profile: data.get(#profile, or: $value.profile),
    type: data.get(#type, or: $value.type),
    fcmId: data.get(#fcmId, or: $value.fcmId),
    notification: data.get(#notification, or: $value.notification),
    firebaseId: data.get(#firebaseId, or: $value.firebaseId),
    address: data.get(#address, or: $value.address),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    deletedAt: data.get(#deletedAt, or: $value.deletedAt),
    countryCode: data.get(#countryCode, or: $value.countryCode),
    showPersonalDetails: data.get(
      #showPersonalDetails,
      or: $value.showPersonalDetails,
    ),
    isVerified: data.get(#isVerified, or: $value.isVerified),
    autoApproveItem: data.get(#autoApproveItem, or: $value.autoApproveItem),
  );

  @override
  UserDataCopyWith<$R2, UserData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoginMetaMapper extends ClassMapperBase<LoginMeta> {
  LoginMetaMapper._();

  static LoginMetaMapper? _instance;
  static LoginMetaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginMetaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginMeta';

  static String? _$token(LoginMeta v) => v.token;
  static const Field<LoginMeta, String> _f$token = Field(
    'token',
    _$token,
    opt: true,
  );

  @override
  final MappableFields<LoginMeta> fields = const {#token: _f$token};

  static LoginMeta _instantiate(DecodingData data) {
    return LoginMeta(token: data.dec(_f$token));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginMeta fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginMeta>(map);
  }

  static LoginMeta fromJson(String json) {
    return ensureInitialized().decodeJson<LoginMeta>(json);
  }
}

mixin LoginMetaMappable {
  String toJson() {
    return LoginMetaMapper.ensureInitialized().encodeJson<LoginMeta>(
      this as LoginMeta,
    );
  }

  Map<String, dynamic> toMap() {
    return LoginMetaMapper.ensureInitialized().encodeMap<LoginMeta>(
      this as LoginMeta,
    );
  }

  LoginMetaCopyWith<LoginMeta, LoginMeta, LoginMeta> get copyWith =>
      _LoginMetaCopyWithImpl<LoginMeta, LoginMeta>(
        this as LoginMeta,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LoginMetaMapper.ensureInitialized().stringifyValue(
      this as LoginMeta,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoginMetaMapper.ensureInitialized().equalsValue(
      this as LoginMeta,
      other,
    );
  }

  @override
  int get hashCode {
    return LoginMetaMapper.ensureInitialized().hashValue(this as LoginMeta);
  }
}

extension LoginMetaValueCopy<$R, $Out> on ObjectCopyWith<$R, LoginMeta, $Out> {
  LoginMetaCopyWith<$R, LoginMeta, $Out> get $asLoginMeta =>
      $base.as((v, t, t2) => _LoginMetaCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoginMetaCopyWith<$R, $In extends LoginMeta, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? token});
  LoginMetaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginMetaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginMeta, $Out>
    implements LoginMetaCopyWith<$R, LoginMeta, $Out> {
  _LoginMetaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginMeta> $mapper =
      LoginMetaMapper.ensureInitialized();
  @override
  $R call({Object? token = $none}) =>
      $apply(FieldCopyWithData({if (token != $none) #token: token}));
  @override
  LoginMeta $make(CopyWithData data) =>
      LoginMeta(token: data.get(#token, or: $value.token));

  @override
  LoginMetaCopyWith<$R2, LoginMeta, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoginMetaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

