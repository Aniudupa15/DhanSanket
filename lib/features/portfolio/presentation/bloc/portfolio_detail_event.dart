import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/live_socket_service.dart';
import '../../domain/entities/transaction_type.dart';

sealed class PortfolioDetailEvent extends Equatable {
  const PortfolioDetailEvent();

  @override
  List<Object?> get props => [];
}

class PortfolioDetailRequested extends PortfolioDetailEvent {
  final String portfolioId;

  const PortfolioDetailRequested(this.portfolioId);

  @override
  List<Object?> get props => [portfolioId];
}

class PortfolioTransactionAddRequested extends PortfolioDetailEvent {
  final String portfolioId;
  final String symbol;
  final TransactionType transactionType;
  final Decimal quantity;
  final Decimal price;
  final DateTime transactionDate;

  const PortfolioTransactionAddRequested({
    required this.portfolioId,
    required this.symbol,
    required this.transactionType,
    required this.quantity,
    required this.price,
    required this.transactionDate,
  });

  @override
  List<Object?> get props => [portfolioId, symbol, transactionType, quantity, price, transactionDate];
}

/// Internal - fed by the [LiveSocketService] subscription started in the
/// Bloc's constructor, not dispatched directly by the UI.
class PortfolioDetailLiveUpdateReceived extends PortfolioDetailEvent {
  final QuoteLiveEvent liveEvent;

  const PortfolioDetailLiveUpdateReceived(this.liveEvent);

  @override
  List<Object?> get props => [liveEvent];
}
