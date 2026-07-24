import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/core/network/live_socket_service.dart';
import 'package:dhan_sanket/features/watchlist/domain/entities/watchlist_detail.dart';
import 'package:dhan_sanket/features/watchlist/domain/entities/watchlist_item.dart';
import 'package:dhan_sanket/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_detail_bloc.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_detail_event.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fakes/mock_live_socket_service.dart';

class MockWatchlistRepository extends Mock implements WatchlistRepository {}

void main() {
  late MockWatchlistRepository repository;
  late MockLiveSocketService liveSocketService;

  final detail = WatchlistDetail(id: 'w1', name: 'Tech', createdAt: DateTime(2026, 1, 1), items: const []);
  final detailWithItem = WatchlistDetail(
    id: 'w1',
    name: 'Tech',
    createdAt: DateTime(2026, 1, 1),
    items: [
      WatchlistItem(
        symbol: 'RELIANCE',
        name: 'Reliance Industries',
        addedAt: DateTime(2026, 1, 1),
        lastPrice: Decimal.fromInt(100),
        change: Decimal.fromInt(1),
        changePercent: Decimal.parse('1'),
      ),
    ],
  );

  setUp(() {
    repository = MockWatchlistRepository();
    liveSocketService = MockLiveSocketService();
  });

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'emits loading then loaded on request',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      return WatchlistDetailBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const WatchlistDetailRequested('w1')),
    expect: () => [isA<WatchlistDetailLoading>(), isA<WatchlistDetailLoaded>()],
  );

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'addItem emits the updated detail on success',
    build: () {
      when(() => repository.addItem(any(), any())).thenAnswer((_) async => Success(detail));
      return WatchlistDetailBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const WatchlistItemAddRequested('w1', 'RELIANCE')),
    expect: () => [isA<WatchlistDetailLoaded>()],
  );

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'removeItem emits an error on failure',
    build: () {
      when(() => repository.removeItem(any(), any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return WatchlistDetailBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) => bloc.add(const WatchlistItemRemoveRequested('w1', 'RELIANCE')),
    expect: () => [isA<WatchlistDetailError>()],
  );

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'patches an item\'s price fields on a live quote for its symbol',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detailWithItem));
      return WatchlistDetailBloc(repository: repository, liveSocketService: liveSocketService);
    },
    act: (bloc) async {
      bloc.add(const WatchlistDetailRequested('w1'));
      await Future<void>.delayed(const Duration(milliseconds: 10));
      liveSocketService.emit(
        QuoteLiveEvent(
          symbol: 'RELIANCE',
          lastPrice: Decimal.fromInt(110),
          change: Decimal.fromInt(11),
          changePercent: Decimal.parse('11'),
          volume: 500,
          asOf: DateTime(2026, 1, 2),
        ),
      );
    },
    wait: const Duration(milliseconds: 50),
    skip: 2,
    expect: () => [isA<WatchlistDetailLoaded>()],
    verify: (bloc) {
      final state = bloc.state as WatchlistDetailLoaded;
      expect(state.detail.items.single.lastPrice, Decimal.fromInt(110));
    },
  );
}
