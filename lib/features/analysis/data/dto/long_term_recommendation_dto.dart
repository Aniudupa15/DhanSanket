import 'package:freezed_annotation/freezed_annotation.dart';

part 'long_term_recommendation_dto.freezed.dart';
part 'long_term_recommendation_dto.g.dart';

@freezed
abstract class LongTermRecommendationDto with _$LongTermRecommendationDto {
  const factory LongTermRecommendationDto({
    required String symbol,
    required String name,
    @JsonKey(name: 'as_of') required DateTime asOf,
    required String signal,
    required int confidence, // plain int, not Decimal - confirmed from backend schema
    @JsonKey(name: 'risk_level') required String riskLevel,
    @JsonKey(name: 'growth_potential') required String growthPotential,
    @JsonKey(name: 'investment_tenure') required String investmentTenure,
    @Default([]) List<String> reasoning,
  }) = _LongTermRecommendationDto;

  factory LongTermRecommendationDto.fromJson(Map<String, dynamic> json) => _$LongTermRecommendationDtoFromJson(json);
}
