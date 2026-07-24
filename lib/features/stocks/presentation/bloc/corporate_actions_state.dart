import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/corporate_action.dart';

sealed class CorporateActionsState extends Equatable {
  const CorporateActionsState();

  @override
  List<Object?> get props => [];
}

class CorporateActionsInitial extends CorporateActionsState {
  const CorporateActionsInitial();
}

class CorporateActionsLoading extends CorporateActionsState {
  const CorporateActionsLoading();
}

class CorporateActionsLoaded extends CorporateActionsState {
  final List<CorporateAction> actions;

  const CorporateActionsLoaded(this.actions);

  @override
  List<Object?> get props => [actions];
}

class CorporateActionsError extends CorporateActionsState {
  final Failure failure;

  const CorporateActionsError(this.failure);

  @override
  List<Object?> get props => [failure];
}
