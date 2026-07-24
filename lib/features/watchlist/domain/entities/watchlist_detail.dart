import 'watchlist_item.dart';

class WatchlistDetail {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<WatchlistItem> items;

  const WatchlistDetail({required this.id, required this.name, required this.createdAt, required this.items});
}
