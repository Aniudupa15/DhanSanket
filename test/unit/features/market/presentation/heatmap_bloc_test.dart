import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/market/domain/entities/heatmap.dart';
import 'package:dhan_sanket/features/market/domain/entities/heatmap_bucket.dart';
import 'package:dhan_sanket/features/market/domain/entities/heatmap_tile.dart';
import 'package:dhan_sanket/features/market/domain/repositories/market_repository.dart';
import 'package:dhan_sanket/features/market/presentation/bloc/heatmap_bloc.dart';
import 'package:dhan_sanket/features/market/presentation/bloc/heatmap_event.dart';
import 'package:dhan_sanket/features/market/presentation/bloc/heatmap_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMarketRepository extends Mock implements MarketRepository {}

void main() {
  late MockMarketRepository repository;

  final heatmap = Heatmap(
    tiles: [
      HeatmapTile(
        symbol: 'RELIANCE',
        name: 'Reliance Industries',
        lastPrice: Decimal.fromInt(1300),
        changePercent: Decimal.parse('3.5'),
        volume: 1000,
        bucket: HeatmapBucket.strongGain,
      ),
    ],
    notes: const [],
  );

  setUp(() {
    repository = MockMarketRepository();
  });

  blocTest<HeatmapBloc, HeatmapState>(
    'emits loading then loaded on a successful fetch',
    build: () {
      when(() => repository.getHeatmap()).thenAnswer((_) async => Success(heatmap));
      return HeatmapBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const HeatmapRequested()),
    expect: () => [const HeatmapLoading(), isA<HeatmapLoaded>()],
  );

  blocTest<HeatmapBloc, HeatmapState>(
    'emits loading then error on failure',
    build: () {
      when(() => repository.getHeatmap()).thenAnswer((_) async => const Error(NetworkFailure()));
      return HeatmapBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const HeatmapRequested()),
    expect: () => [const HeatmapLoading(), isA<HeatmapError>()],
  );
}
