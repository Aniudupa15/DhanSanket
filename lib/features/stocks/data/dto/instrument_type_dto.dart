import 'package:json_annotation/json_annotation.dart';

enum InstrumentTypeDto {
  @JsonValue('EQUITY')
  equity,
  @JsonValue('ETF')
  etf,
  @JsonValue('REIT')
  reit,
  @JsonValue('INVIT')
  invit,
}
