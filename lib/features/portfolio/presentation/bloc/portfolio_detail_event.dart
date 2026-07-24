import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

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
