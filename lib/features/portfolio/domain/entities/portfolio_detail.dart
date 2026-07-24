import 'holding.dart';

class PortfolioDetail {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<Holding> holdings;

  const PortfolioDetail({required this.id, required this.name, required this.createdAt, required this.holdings});
}
