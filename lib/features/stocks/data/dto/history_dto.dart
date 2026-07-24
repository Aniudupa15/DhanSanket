import 'package:freezed_annotation/freezed_annotation.dart';

import 'ohlcv_bar_dto.dart';

part 'history_dto.freezed.dart';
part 'history_dto.g.dart';

@freezed
abstract class HistoryDto with _$HistoryDto {
  const factory HistoryDto({required String symbol, required String range, required List<OhlcvBarDto> bars}) =
      _HistoryDto;

  factory HistoryDto.fromJson(Map<String, dynamic> json) => _$HistoryDtoFromJson(json);
}
