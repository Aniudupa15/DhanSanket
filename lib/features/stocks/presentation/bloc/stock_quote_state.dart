import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/stock_detail.dart';

sealed class StockQuoteState extends Equatable {
  const StockQuoteState();

  @override
  List<Object?> get props => [];
}

class StockQuoteInitial extends StockQuoteState {
  const StockQuoteInitial();
}

class StockQuoteLoading extends StockQuoteState {
  const StockQuoteLoading();
}

class StockQuoteLoaded extends StockQuoteState {
  final StockDetail detail;

  const StockQuoteLoaded(this.detail);

  @override
  List<Object?> get props => [detail];
}

class StockQuoteError extends StockQuoteState {
  final Failure failure;

  const StockQuoteError(this.failure);

  @override
  List<Object?> get props => [failure];
}
