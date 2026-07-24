enum MarketSession { preOpen, open, afterHours, closed }

class MarketHoursStatus {
  final MarketSession session;
  final Duration timeUntilNextTransition;

  /// true if the next transition is "market opens" (or enters pre-open),
  /// false if it's "market closes".
  final bool isNextTransitionOpen;

  const MarketHoursStatus({
    required this.session,
    required this.timeUntilNextTransition,
    required this.isNextTransitionOpen,
  });
}

/// NSE equity cash-market session boundaries in IST (9:00 pre-open, 9:15
/// regular open, 15:30 close, treated as "after hours" through 16:00) -
/// computed purely client-side from real, stable, well-documented NSE
/// session times, no backend call needed. Known simplification: weekends
/// are handled, exchange holidays are not (no holiday calendar exists
/// anywhere in either app) - documented here rather than silently wrong.
class MarketHours {
  MarketHours._();

  static const _preOpenHour = 9, _preOpenMinute = 0;
  static const _openHour = 9, _openMinute = 15;
  static const _closeHour = 15, _closeMinute = 30;
  static const _afterHoursEndHour = 16, _afterHoursEndMinute = 0;

  static MarketHoursStatus statusAt(DateTime now) {
    final ist = now.toUtc().add(const Duration(hours: 5, minutes: 30));
    final isWeekend = ist.weekday == DateTime.saturday || ist.weekday == DateTime.sunday;

    // `ist` is a UTC-flagged DateTime whose wall-clock fields represent IST -
    // every boundary compared against it must be constructed the same way
    // (DateTime.utc, not the local-timezone DateTime(...) constructor),
    // otherwise comparisons silently depend on the running device's own
    // timezone instead of IST.
    final preOpenStart = DateTime.utc(ist.year, ist.month, ist.day, _preOpenHour, _preOpenMinute);
    final openStart = DateTime.utc(ist.year, ist.month, ist.day, _openHour, _openMinute);
    final closeStart = DateTime.utc(ist.year, ist.month, ist.day, _closeHour, _closeMinute);
    final afterHoursEnd = DateTime.utc(ist.year, ist.month, ist.day, _afterHoursEndHour, _afterHoursEndMinute);

    if (!isWeekend && !ist.isBefore(preOpenStart) && ist.isBefore(openStart)) {
      return MarketHoursStatus(
        session: MarketSession.preOpen,
        timeUntilNextTransition: openStart.difference(ist),
        isNextTransitionOpen: true,
      );
    }
    if (!isWeekend && !ist.isBefore(openStart) && ist.isBefore(closeStart)) {
      return MarketHoursStatus(
        session: MarketSession.open,
        timeUntilNextTransition: closeStart.difference(ist),
        isNextTransitionOpen: false,
      );
    }
    if (!isWeekend && !ist.isBefore(closeStart) && ist.isBefore(afterHoursEnd)) {
      return MarketHoursStatus(
        session: MarketSession.afterHours,
        timeUntilNextTransition: _nextPreOpen(ist).difference(ist),
        isNextTransitionOpen: true,
      );
    }

    return MarketHoursStatus(
      session: MarketSession.closed,
      timeUntilNextTransition: _nextPreOpen(ist).difference(ist),
      isNextTransitionOpen: true,
    );
  }

  static DateTime _nextPreOpen(DateTime ist) {
    var candidate = DateTime.utc(ist.year, ist.month, ist.day, _preOpenHour, _preOpenMinute);
    if (!ist.isBefore(candidate)) {
      candidate = candidate.add(const Duration(days: 1));
    }
    while (candidate.weekday == DateTime.saturday || candidate.weekday == DateTime.sunday) {
      candidate = candidate.add(const Duration(days: 1));
    }
    return candidate;
  }
}
