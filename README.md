# DhanSanket

A production-grade Flutter client for real NSE (National Stock Exchange of India) market data,
watchlists, portfolios, alerts, and rule-based AI signals - built against the
[stock_app_backend](https://github.com/Aniudupa15) FastAPI service, deployed live at
`https://stock-app-backend-f1oz.onrender.com`.

## Features

- **Auth**: register/login, secure token storage, transparent access-token refresh, session
  restore on app launch, profile editing.
- **Dashboard**: market status, index quotes, gainers/losers/most-active/52-week movers, latest
  news, and any data-availability notes surfaced directly (never hidden).
- **Stocks**: search, full detail (quote, price chart, 12 technical indicators, corporate
  actions, per-symbol news), rule-based intraday and long-term signals, recent search history.
- **Watchlists**: create/delete, add/remove symbols, live quotes per item.
- **Portfolio**: create/delete, record buy/sell transactions, live holdings valuation, XIRR-based
  performance summary.
- **Alerts & notifications**: price/percent-change/RSI/volume-spike/52-week-high-low alerts, a
  notification inbox with unread badges.
- **News feed**: filterable by category, independent of any single stock.
- **Market movers & heatmap**: full gainers/losers/most-active/52-week lists, a volume-weighted
  heatmap grid.
- **Compare**: side-by-side detail/indicators/fundamentals for 2-5 symbols.
- **Screener**: filter the market by RSI, price range, 50-day SMA, and volume.
- **AI chat assistant**: a rule-based (not an LLM) assistant that answers questions about your
  portfolio, watchlist, alerts, and stock indicators by dispatching to the same services the rest
  of the app uses - every reply names which intent it matched, so it's never presented as more
  than templated reasoning over real computed values.
- **Offline awareness**: a persistent banner when the device itself has no network path,
  distinct from a reachable-but-erroring server (which gets a normal retry view instead).

## Architecture

Clean architecture, one vertical slice per feature under `lib/features/<feature>/`:

```
lib/
  bootstrap/        # DI (get_it), MaterialApp.router wiring, env config
  core/             # Shared: networking, error types, theme, router, storage, widgets, entities
  features/
    <feature>/
      domain/       # Entities + repository interfaces - no Flutter/Dio imports
      data/         # DTOs (freezed + json_serializable), datasources (Dio), repository impls
      presentation/ # Bloc (flutter_bloc), pages, widgets
```

- **State management**: `flutter_bloc` - one Bloc per screen/concern, sealed event/state classes.
- **DI**: `get_it` - repositories/datasources are lazy singletons; page-scoped Blocs are factories
  (fresh instance per push) so they're always disposed correctly by `BlocProvider`.
- **Networking**: `dio` with a single auth interceptor that attaches the bearer token and
  transparently refreshes it on 401 (deduping concurrent refreshes so the single-use refresh
  token is never burned twice).
- **Money/precision**: every backend `Decimal` field is parsed via the `decimal` package, never
  `double`, to match the backend's own arbitrary-precision semantics.
- **Routing**: `go_router` - tab roots live in a `ShellRoute` (bottom nav visible); detail screens
  are top-level routes reached via `context.push(...)` (bottom nav hidden, back returns to the tab).
- **Error handling**: every repository method returns `Result<T>` (`Success`/`Error`), never
  throws past the data layer. Every list/detail screen renders one of the same three states via
  shared `AppLoadingView`/`AppErrorView` widgets plus a non-empty empty-state message.

## Getting started

### Prerequisites

- Flutter (stable channel; see `pubspec.yaml`'s `environment.sdk` constraint for the minimum Dart
  SDK).

### Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Run

By default the app points at the live deployed backend:

```bash
flutter run -d chrome
```

To point at a local backend instead:

```bash
# Android emulator (10.0.2.2 is the emulator's loopback to the host)
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api/v1

# Web / desktop / iOS simulator
flutter run --dart-define=API_BASE_URL=http://localhost:8000/api/v1
```

### Test

```bash
flutter analyze
flutter test
```

### Build

```bash
flutter build apk --release
flutter build appbundle --release
flutter build web --release
```

## CI/CD

`.github/workflows/ci.yml` runs on every push/PR to `main`: codegen, `dart format` check,
`flutter analyze`, `flutter test`. On pushes to `main` and version tags, it additionally builds
APK/AAB/Web artifacts and uploads them.

## Known gaps (documented, not hidden)

- **Sector/industry data** is unavailable for all stocks (no free bulk source found) - fields are
  present but always `null`, never faked.
- **Fundamentals** (`book_value`/`roe`/`roce`/`debt_to_equity`) are always `null` today for the
  same reason; the UI renders them as "N/A" rather than hiding the row.
- **Market cap** isn't available, so the heatmap sizes tiles by trading volume instead, and says
  so in its own `notes` field.
- A stock's live quote can occasionally be `null` with a `quote_unavailable_reason` when NSE's
  own upstream API rate-limits or blocks the backend - the UI surfaces the reason string directly
  rather than showing a generic error.
