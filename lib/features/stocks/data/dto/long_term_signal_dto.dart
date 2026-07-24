import 'package:freezed_annotation/freezed_annotation.dart';

part 'long_term_signal_dto.freezed.dart';
part 'long_term_signal_dto.g.dart';

@freezed
abstract class LongTermSignalDto with _$LongTermSignalDto {
  const factory LongTermSignalDto({
    required String symbol,
    @JsonKey(name: 'has_data') @Default(false) bool hasData,
    @Default('HOLD') String signal,
    @Default(0) int confidence, // plain int, not Decimal - confirmed from backend schema
    @JsonKey(name: 'investment_horizon') @Default('Long-term (1-3+ years)') String investmentHorizon,
    @JsonKey(name: 'risk_level') @Default('Unknown') String riskLevel,
    @JsonKey(name: 'growth_potential') @Default('Unknown') String growthPotential,
    @Default([]) List<String> strengths,
    @Default([]) List<String> weaknesses,
    @Default([]) List<String> opportunities,
    @Default([]) List<String> risks,
    @Default([]) List<String> reasoning,
    required String disclaimer,
  }) = _LongTermSignalDto;

  factory LongTermSignalDto.fromJson(Map<String, dynamic> json) => _$LongTermSignalDtoFromJson(json);
}
