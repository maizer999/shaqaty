// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_mappable/dart_mappable.dart';

part 'login_response.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class LoginResponse with LoginResponseMappable {
  final String? status;
  final String? message;
  final UserData? data;
  final LoginMeta? meta;

  const LoginResponse({
    this.status,
    this.message,
    this.data,
    this.meta,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase, ignoreNull: true)
class UserData with UserDataMappable {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? emailVerifiedAt;
  final String? profile;
  final String? type;
  final String? fcmId;
  final int? notification;
  final String? firebaseId;
  final String? address;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? countryCode;
  final int? showPersonalDetails;
  final int? isVerified;
  final int? autoApproveItem;

  const UserData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.emailVerifiedAt,
    this.profile,
    this.type,
    this.fcmId,
    this.notification,
    this.firebaseId,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.countryCode,
    this.showPersonalDetails,
    this.isVerified,
    this.autoApproveItem,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class LoginMeta with LoginMetaMappable {
  final String? token;

  const LoginMeta({
    this.token,
  });
}
