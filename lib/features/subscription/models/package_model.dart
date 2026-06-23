// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_mappable/dart_mappable.dart';

part 'package_model.mapper.dart';

/// A single subscription package returned by `GET /get-package`.
@MappableClass(caseStyle: CaseStyle.snakeCase)
class PackageModel with PackageModelMappable {
  final int? id;
  final String? name;
  final String? translatedName;

  /// Price of the package. `0` (or null) means the package is FREE.
  final num? finalPrice;

  /// Duration in days, or the literal string `"unlimited"`.
  final String? duration;

  /// Item/ad limit as a number string, or the literal string `"unlimited"`.
  final String? itemLimit;

  final String? type;

  /// True when the current user already has this package active.
  final bool? isActive;

  const PackageModel({
    this.id,
    this.name,
    this.translatedName,
    this.finalPrice,
    this.duration,
    this.itemLimit,
    this.type,
    this.isActive,
  });

  /// Prefer the localized name when the backend provides one.
  String get displayName =>
      (translatedName != null && translatedName!.trim().isNotEmpty)
          ? translatedName!
          : (name ?? '');

  bool get isFree => (finalPrice ?? 0) == 0;

  bool get active => isActive ?? false;
}