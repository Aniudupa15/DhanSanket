import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/portfolio/domain/entities/portfolio.dart';
import 'package:dhan_sanket/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_event.dart';
import 'package:dhan_sanket/features/portfolio/presentation/bloc/portfolio_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  late MockPortfolioRepository repository;

  final portfolio = Portfolio(id: 'p1', name: 'Main', createdAt: DateTime(2026, 1, 1));

  setUp(() {
    repository = MockPortfolioRepository();
  });

  blocTest<PortfolioBloc, PortfolioState>(
    'emits loading then loaded on request',
    build: () {
      when(() => repository.list()).thenAnswer((_) async => Success([portfolio]));
      return PortfolioBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const PortfoliosRequested()),
    expect: () => [isA<PortfolioLoading>(), isA<PortfolioLoaded>()],
  );

  blocTest<PortfolioBloc, PortfolioState>(
    'create: refetches the list on success',
    build: () {
      when(() => repository.create(any())).thenAnswer((_) async => Success(portfolio));
      when(() => repository.list()).thenAnswer((_) async => Success([portfolio]));
      return PortfolioBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const PortfolioCreateRequested('Main')),
    expect: () => [isA<PortfolioLoaded>()],
  );

  blocTest<PortfolioBloc, PortfolioState>(
    'create: emits error on failure',
    build: () {
      when(() => repository.create(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return PortfolioBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const PortfolioCreateRequested('Main')),
    expect: () => [isA<PortfolioError>()],
  );
}
