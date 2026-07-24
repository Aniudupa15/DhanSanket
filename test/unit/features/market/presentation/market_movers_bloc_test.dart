import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/entities/market_mover.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/network/live_socket_service.dart';
import 'package:dhan_sanket/features/market/domain/entities/mover_category.dart';
import 'package:dhan_sanket/features/market/domain/repositories/market_repository.dart';
import 'package:dhan_sanket/features/market/presentation/bloc/market_movers_bloc.dart';
import 'package:dhan_sanket/features/market/presentation/bloc/market_movers_event.dart';
import 'package:dhan_sanket/features/market/presentation/bloc/market_movers_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fakes/mock_live_socket_service.dart';

class MockMarketRepository extends Mock implements MarketRepository {}

void main() {
  late MockMarketRepository repository;
  late MockLiveSocketService liveSocketService;

  final mover = MarketMover(
    symbol: 'RELIANCE',
    name: 'Reliance Industries',
    lastPrice: Decimal.fromInt(1300),
    change: Decimal.fromInt(10),
    changePercent: Decimal.parse('0.8'),
    volume: 1000,
  );

  setUpAll(() {
    registerFallbackValue(MoverCategory.gainers);
  });

  setUp(() {
    repository = MockMarketRepository();
    liveSocketService = MockLiveSocketService();
  });

  blocTest<MarketMoversBloc, MarketMoversState>(
    'emits loading then loaded on a successful fetch',
    build: () {
      when(() => repository.getMovers(any(), period: any(named: 'period'))).thenAnswer((_) async => Success([mover]));
      return MarketMoversBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const MarketMoversRequested(MoverCategory.gainers)),
    expect: () => [const MarketMoversLoading(), isA<MarketMoversLoaded>()],
  );

  blocTest<MarketMoversBloc, MarketMoversState>(
    'emits loading then error on failure',
    build: () {
      when(
        () => repository.getMovers(any(), period: any(named: 'period')),
      ).thenAnswer((_) async => const Error(NetworkFailure()));
      return MarketMoversBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const MarketMoversRequested(MoverCategory.losers)),
    expect: () => [const MarketMoversLoading(), isA<MarketMoversError>()],
  );

  blocTest<MarketMoversBloc, MarketMoversState>(
    'patches the list on a live market snapshot matching the current category',
    build: () {
      when(() => repository.getMovers(any(), period: any(named: 'period'))).thenAnswer((_) async => Success([mover]));
      return MarketMoversBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) async {
      bloc.add(const MarketMoversRequested(MoverCategory.gainers));
      await Future<void>.delayed(const Duration(milliseconds: 10));
      liveSocketService.emit(const MarketSnapshotLiveEvent(gainers: [], losers: [], mostActive: []));
    },
    wait: const Duration(milliseconds: 50),
    skip: 2,
    expect: () => [isA<MarketMoversLoaded>()],
  );
}
