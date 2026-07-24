enum AlertType {
  priceAbove,
  priceBelow,
  percentChangeAbove,
  percentChangeBelow,
  rsiAbove,
  rsiBelow,
  volumeSpike,
  new52WeekHigh,
  new52WeekLow,
}

extension AlertTypeConditionKey on AlertType {
  /// The single required key in `condition` for this alert type, or `null`
  /// for the two 52-week types which need no condition at all.
  String? get conditionKey {
    return switch (this) {
      AlertType.priceAbove || AlertType.priceBelow => 'price',
      AlertType.percentChangeAbove || AlertType.percentChangeBelow => 'percent',
      AlertType.rsiAbove || AlertType.rsiBelow => 'threshold',
      AlertType.volumeSpike => 'multiplier',
      AlertType.new52WeekHigh || AlertType.new52WeekLow => null,
    };
  }
}
