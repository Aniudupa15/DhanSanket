import 'package:dhan_sanket/core/market/market_hours.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 2024-01-01 is a real, known Monday. IST = UTC + 5:30, so a UTC instant
  // representing IST H:M on 2024-01-01 is 2024-01-01 (H-5):(M-30) UTC (or
  // the previous day, rolling back, if that's negative). Each case below is
  // constructed directly to avoid fragile Duration-offset arithmetic.

  test('before pre-open on a weekday is closed, counting down to today\'s pre-open', () {
    // IST 03:00 Monday = UTC 2023-12-31 21:30
    final utc = DateTime.utc(2023, 12, 31, 21, 30);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.closed);
    expect(status.isNextTransitionOpen, isTrue);
    expect(status.timeUntilNextTransition, const Duration(hours: 6));
  });

  test('at 09:00 IST on a weekday is pre-open', () {
    // IST 09:00 Monday = UTC 03:30
    final utc = DateTime.utc(2024, 1, 1, 3, 30);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.preOpen);
    expect(status.isNextTransitionOpen, isTrue);
    expect(status.timeUntilNextTransition, const Duration(minutes: 15));
  });

  test('at 09:15 IST on a weekday is open, counting down to close', () {
    // IST 09:15 Monday = UTC 03:45
    final utc = DateTime.utc(2024, 1, 1, 3, 45);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.open);
    expect(status.isNextTransitionOpen, isFalse);
    expect(status.timeUntilNextTransition, const Duration(hours: 6, minutes: 15));
  });

  test('at 15:30 IST on a weekday is after-hours', () {
    // IST 15:30 Monday = UTC 10:00
    final utc = DateTime.utc(2024, 1, 1, 10, 0);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.afterHours);
    expect(status.isNextTransitionOpen, isTrue);
  });

  test('at 16:00 IST on a weekday is closed, counting down to tomorrow\'s pre-open', () {
    // IST 16:00 Monday = UTC 10:30
    final utc = DateTime.utc(2024, 1, 1, 10, 30);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.closed);
    expect(status.timeUntilNextTransition, const Duration(hours: 17));
  });

  test('Saturday is closed regardless of time of day', () {
    // IST 10:00 Saturday (2024-01-06) = UTC 04:30
    final utc = DateTime.utc(2024, 1, 6, 4, 30);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.closed);
  });

  test('Sunday at any time skips ahead to Monday pre-open', () {
    // IST 10:00 Sunday (2024-01-07) = UTC 04:30
    final utc = DateTime.utc(2024, 1, 7, 4, 30);
    final status = MarketHours.statusAt(utc);

    expect(status.session, MarketSession.closed);
    // From Sunday 10:00 IST to Monday (2024-01-08) 09:00 IST is 23 hours.
    expect(status.timeUntilNextTransition, const Duration(hours: 23));
  });
}
