import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/watchlist/domain/entities/watchlist.dart';
import 'package:dhan_sanket/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:dhan_sanket/features/watchlist/presentation/bloc/watchlist_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWatchlistRepository extends Mock implements WatchlistRepository {}

void main() {
  late MockWatchlistRepository repository;

  final watchlist = Watchlist(id: 'w1', name: 'Tech', createdAt: DateTime(2026, 1, 1), itemCount: 0);

  setUp(() {
    repository = MockWatchlistRepository();
  });

  blocTest<WatchlistBloc, WatchlistState>(
    'emits loading then loaded on request',
    build: () {
      when(() => repository.list()).thenAnswer((_) async => Success([watchlist]));
      return WatchlistBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const WatchlistsRequested()),
    expect: () => [isA<WatchlistLoading>(), isA<WatchlistLoaded>()],
  );

  blocTest<WatchlistBloc, WatchlistState>(
    'create: refetches the list on success',
    build: () {
      when(() => repository.create(any())).thenAnswer((_) async => Success(watchlist));
      when(() => repository.list()).thenAnswer((_) async => Success([watchlist]));
      return WatchlistBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const WatchlistCreateRequested('Tech')),
    expect: () => [isA<WatchlistLoaded>()],
    verify: (_) => verify(() => repository.list()).called(1),
  );

  blocTest<WatchlistBloc, WatchlistState>(
    'create: emits error without refetching on failure',
    build: () {
      when(() => repository.create(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return WatchlistBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const WatchlistCreateRequested('Tech')),
    expect: () => [isA<WatchlistError>()],
    verify: (_) => verifyNever(() => repository.list()),
  );
}
