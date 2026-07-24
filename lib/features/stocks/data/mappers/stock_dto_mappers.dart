import '../../domain/entities/bollinger.dart';
import '../../domain/entities/fundamentals.dart';
import '../../domain/entities/indicators.dart';
import '../../domain/entities/instrument_type.dart';
import '../../domain/entities/macd.dart';
import '../../domain/entities/pivot_points.dart';
import '../../domain/entities/quote.dart';
import '../../domain/entities/stock_detail.dart';
import '../../domain/entities/stoch_rsi.dart';
import '../../domain/entities/supertrend.dart';
import '../../domain/entities/volume_profile_bin.dart';
import '../dto/bollinger_dto.dart';
import '../dto/fundamentals_dto.dart';
import '../dto/indicators_dto.dart';
import '../dto/instrument_type_dto.dart';
import '../dto/macd_dto.dart';
import '../dto/pivot_points_dto.dart';
import '../dto/quote_dto.dart';
import '../dto/stock_detail_dto.dart';
import '../dto/stoch_rsi_dto.dart';
import '../dto/supertrend_dto.dart';
import '../dto/volume_profile_bin_dto.dart';

/// Shared DTO->entity mappers for `StockDetail`/`Indicators`/`Fundamentals` -
/// used by both `StockRepositoryImpl` (single-symbol endpoints) and
/// `ComparisonRepositoryImpl` (which composes the identical three shapes
/// per symbol from `/stocks/compare`), so the mapping logic exists once.

InstrumentType instrumentTypeToEntity(InstrumentTypeDto dto) {
  return switch (dto) {
    InstrumentTypeDto.equity => InstrumentType.equity,
    InstrumentTypeDto.etf => InstrumentType.etf,
    InstrumentTypeDto.reit => InstrumentType.reit,
    InstrumentTypeDto.invit => InstrumentType.invit,
  };
}

Quote quoteToEntity(QuoteDto dto) {
  return Quote(
    lastPrice: dto.lastPrice,
    change: dto.change,
    changePercent: dto.changePercent,
    open: dto.open,
    high: dto.high,
    low: dto.low,
    previousClose: dto.previousClose,
    volume: dto.volume,
    asOf: dto.asOf,
  );
}

StockDetail stockDetailToEntity(StockDetailDto dto) {
  return StockDetail(
    symbol: dto.symbol,
    isin: dto.isin,
    name: dto.name,
    series: dto.series,
    sector: dto.sector,
    industry: dto.industry,
    instrumentType: instrumentTypeToEntity(dto.instrumentType),
    listingDate: dto.listingDate,
    faceValue: dto.faceValue,
    quote: dto.quote != null ? quoteToEntity(dto.quote!) : null,
    quoteUnavailableReason: dto.quoteUnavailableReason,
  );
}

Macd macdToEntity(MacdDto dto) => Macd(macd: dto.macd, signal: dto.signal, histogram: dto.histogram);

Bollinger bollingerToEntity(BollingerDto dto) => Bollinger(upper: dto.upper, middle: dto.middle, lower: dto.lower);

Supertrend supertrendToEntity(SupertrendDto dto) => Supertrend(value: dto.value, direction: dto.direction);

StochRsi stochRsiToEntity(StochRsiDto dto) => StochRsi(k: dto.k, d: dto.d);

PivotPoints pivotPointsToEntity(PivotPointsDto dto) {
  return PivotPoints(pivot: dto.pivot, r1: dto.r1, r2: dto.r2, r3: dto.r3, s1: dto.s1, s2: dto.s2, s3: dto.s3);
}

VolumeProfileBin volumeBinToEntity(VolumeProfileBinDto dto) {
  return VolumeProfileBin(priceLow: dto.priceLow, priceHigh: dto.priceHigh, volume: dto.volume);
}

Indicators indicatorsToEntity(IndicatorsDto dto) {
  return Indicators(
    symbol: dto.symbol,
    asOf: dto.asOf,
    hasData: dto.hasData,
    sma20: dto.sma20,
    sma50: dto.sma50,
    sma200: dto.sma200,
    ema20: dto.ema20,
    ema50: dto.ema50,
    rsi14: dto.rsi14,
    macd: dto.macd != null ? macdToEntity(dto.macd!) : null,
    bollinger: dto.bollinger != null ? bollingerToEntity(dto.bollinger!) : null,
    vwap20: dto.vwap20,
    adx14: dto.adx14,
    atr14: dto.atr14,
    supertrend: dto.supertrend != null ? supertrendToEntity(dto.supertrend!) : null,
    stochasticRsi: dto.stochasticRsi != null ? stochRsiToEntity(dto.stochasticRsi!) : null,
    pivotPoints: dto.pivotPoints != null ? pivotPointsToEntity(dto.pivotPoints!) : null,
    volumeProfile: dto.volumeProfile.map(volumeBinToEntity).toList(),
    pointOfControl: dto.pointOfControl != null ? volumeBinToEntity(dto.pointOfControl!) : null,
  );
}

Fundamentals fundamentalsToEntity(FundamentalsDto dto) {
  return Fundamentals(
    symbol: dto.symbol,
    hasData: dto.hasData,
    latestPeriodEnd: dto.latestPeriodEnd,
    revenueGrowthYoy: dto.revenueGrowthYoy,
    revenueGrowthQoq: dto.revenueGrowthQoq,
    profitGrowthYoy: dto.profitGrowthYoy,
    profitGrowthQoq: dto.profitGrowthQoq,
    ttmEps: dto.ttmEps,
    peRatio: dto.peRatio,
    dividendYield: dto.dividendYield,
    bookValue: dto.bookValue,
    roe: dto.roe,
    roce: dto.roce,
    debtToEquity: dto.debtToEquity,
  );
}
