import 'package:dio/dio.dart';

import '../../../../bootstrap/env.dart';
import '../../domain/entities/momentum_pick.dart';

class MomentumRemoteDataSource {
  final Dio _dio;

  MomentumRemoteDataSource(this._dio);

  /// The momentum router is mounted at the backend ROOT (`/trading/...`), NOT
  /// under `/api/v1` like the rest of the API. So we strip the versioned suffix
  /// from the shared base URL and hit the root path with an absolute URL (Dio
  /// uses it as-is, overriding baseUrl; the auth interceptor still attaches the
  /// bearer token).
  String get _tradingBase => AppConfig.baseUrl.replaceFirst(RegExp(r'/api/v\d+/?$'), '');

  Future<List<MomentumPick>> getRanking({int top = 10}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_tradingBase/trading/momentum/ranking',
      queryParameters: {'top': top},
    );
    final picks = (response.data?['picks'] as List<dynamic>?) ?? const [];
    return picks.asMap().entries.map((entry) {
      final json = entry.value as Map<String, dynamic>;
      return MomentumPick(
        rank: (json['rank'] as int?) ?? entry.key + 1,
        symbol: json['symbol'] as String,
        name: (json['name'] as String?) ?? json['symbol'] as String,
        trailingReturnPct: (json['trailing_return_pct'] as num).toDouble(),
        lastClose: (json['last_close'] as num).toDouble(),
        signalRaw: json['signal'] as String?,
        holdPeriodRaw: json['hold_period'] as String?,
        confidenceRaw: (json['confidence'] as num?)?.toInt(),
      );
    }).toList();
  }
}
