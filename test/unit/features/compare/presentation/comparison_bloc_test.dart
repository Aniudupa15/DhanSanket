import 'package:bloc_test/bloc_test.dart';
import 'package:dhan_sanket/core/error/failure.dart';
import 'package:dhan_sanket/core/error/result.dart';
import 'package:dhan_sanket/features/compare/domain/entities/comparison_entry.dart';
import 'package:dhan_sanket/features/compare/domain/repositories/comparison_repository.dart';
import 'package:dhan_sanket/features/compare/presentation/bloc/comparison_bloc.dart';
import 'package:dhan_sanket/features/compare/presentation/bloc/comparison_event.dart';
import 'package:dhan_sanket/features/compare/presentation/bloc/comparison_state.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/fundamentals.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/indicators.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/instrument_type.dart';
import 'package:dhan_sanket/features/stocks/domain/entities/stock_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockComparisonRepository extends Mock implements ComparisonRepository {}

void main() {
  late MockComparisonRepository repository;

  setUp(() {
    repository = MockComparisonRepository();
  });

  blocTest<ComparisonBloc, ComparisonState>(
    'emits loading then loaded on a successful comparison',
    build: () {
      when(() => repository.compare(any())).thenAnswer(
        (_) async => Success([
          ComparisonEntry(
            detail: const StockDetail(
              symbol: 'RELIANCE',
              isin: null,
              name: 'Reliance Industries',
              series: 'EQ',
              sector: null,
              industry: null,
              instrumentType: InstrumentType.equity,
              listingDate: null,
              faceValue: null,
              quote: null,
              quoteUnavailableReason: null,
            ),
            indicators: const Indicators(
              symbol: 'RELIANCE',
              asOf: null,
              hasData: false,
              sma20: null,
              sma50: null,
              sma200: null,
              ema20: null,
              ema50: null,
              rsi14: null,
              macd: null,
              bollinger: null,
              vwap20: null,
              adx14: null,
              atr14: null,
              supertrend: null,
              stochasticRsi: null,
              pivotPoints: null,
              volumeProfile: [],
              pointOfControl: null,
            ),
            fundamentals: const Fundamentals(
              symbol: 'RELIANCE',
              hasData: false,
              latestPeriodEnd: null,
              revenueGrowthYoy: null,
              revenueGrowthQoq: null,
              profitGrowthYoy: null,
              profitGrowthQoq: null,
              ttmEps: null,
              peRatio: null,
              dividendYield: null,
              bookValue: null,
              roe: null,
              roce: null,
              debtToEquity: null,
            ),
          ),
        ]),
      );
      return ComparisonBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const ComparisonRequested(['RELIANCE', 'TCS'])),
    expect: () => [const ComparisonLoading(), isA<ComparisonLoaded>()],
  );

  blocTest<ComparisonBloc, ComparisonState>(
    'emits loading then error on failure',
    build: () {
      when(() => repository.compare(any())).thenAnswer((_) async => const Error(NetworkFailure()));
      return ComparisonBloc(repository: repository);
    },
    act: (bloc) => bloc.add(const ComparisonRequested(['RELIANCE', 'TCS'])),
    expect: () => [const ComparisonLoading(), isA<ComparisonError>()],
  );
}
