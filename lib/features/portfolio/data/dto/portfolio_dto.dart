import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_dto.freezed.dart';
part 'portfolio_dto.g.dart';

@freezed
abstract class PortfolioDto with _$PortfolioDto {
  const factory PortfolioDto({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PortfolioDto;

  factory PortfolioDto.fromJson(Map<String, dynamic> json) => _$PortfolioDtoFromJson(json);
}
