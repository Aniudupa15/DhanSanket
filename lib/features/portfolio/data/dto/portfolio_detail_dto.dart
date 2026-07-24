import 'package:freezed_annotation/freezed_annotation.dart';

import 'holding_dto.dart';

part 'portfolio_detail_dto.freezed.dart';
part 'portfolio_detail_dto.g.dart';

@freezed
abstract class PortfolioDetailDto with _$PortfolioDetailDto {
  const factory PortfolioDetailDto({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required List<HoldingDto> holdings,
  }) = _PortfolioDetailDto;

  factory PortfolioDetailDto.fromJson(Map<String, dynamic> json) => _$PortfolioDetailDtoFromJson(json);
}
