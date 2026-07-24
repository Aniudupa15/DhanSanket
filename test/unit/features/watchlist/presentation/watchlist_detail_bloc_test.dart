import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/watchlist/domain/entities/watchlist_detail.dart';
import 'package:dhan_sanket/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_detail_bloc.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_detail_event.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWatchlistRepository extends Mock implements WatchlistRepository {}

void main() {
  late MockWatchlistRepository repository;

  final detail = WatchlistDetail(id: 'w1', name: 'Tech', createdAt: DateTime(2026, 1, 1), items: const []);

  setUp(() {
    repository = MockWatchlistRepository();
  });

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'emits loading then loaded on request',
    build: () {
      when(() => repository.getDetail(any())).thenAnswer((_) async => Success(detail));
      return WatchlistDetailBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const WatchlistDetailRequested('w1')),
    expect: () => [isA<WatchlistDetailLoading>(), isA<WatchlistDetailLoaded>()],
  );

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'addItem emits the updated detail on success',
    build: () {
      when(() => repository.addItem(any(), any())).thenAnswer((_) async => Success(detail));
      return WatchlistDetailBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const WatchlistItemAddRequested('w1', 'RELIANCE')),
    expect: () => [isA<WatchlistDetailLoaded>()],
  );

  blocTest<WatchlistDetailBloc, WatchlistDetailState>(
    'removeItem emits an error on failure',
    build: () {
      when(() => repository.removeItem(any(), any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return WatchlistDetailBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const WatchlistItemRemoveRequested('w1', 'RELIANCE')),
    expect: () => [isA<WatchlistDetailError>()],
  );
}
