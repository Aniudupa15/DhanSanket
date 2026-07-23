import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

/// The backend serializes Python `Decimal` fields as JSON strings - verified
/// live against the real API (e.g. `"change_percent":"20.00000000000000000000"`)
/// - so this parses to/from Dart's `Decimal` (package:decimal) rather than
/// `double`, avoiding float rounding on money/percentage values.
class DecimalConverter implements JsonConverter<Decimal, String> {
  const DecimalConverter();

  @override
  Decimal fromJson(String json) => Decimal.parse(json);

  @override
  String toJson(Decimal object) => object.toString();
}

/// Same as [DecimalConverter], for nullable Decimal fields.
class NullableDecimalConverter implements JsonConverter<Decimal?, String?> {
  const NullableDecimalConverter();

  @override
  Decimal? fromJson(String? json) => json == null ? null : Decimal.parse(json);

  @override
  String? toJson(Decimal? object) => object?.toString();
}
