import '../../../../core/error/result.dart';
import '../entities/watchlist.dart';
import '../entities/watchlist_detail.dart';

abstract class WatchlistRepository {
  Future<Result<List<Watchlist>>> list();
  Future<Result<Watchlist>> create(String name);
  Future<Result<void>> delete(String id);
  Future<Result<WatchlistDetail>> getDetail(String id);
  Future<Result<WatchlistDetail>> addItem(String id, String symbol);
  Future<Result<WatchlistDetail>> removeItem(String id, String symbol);
}
