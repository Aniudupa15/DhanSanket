import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_paths.dart';
import '../../domain/entities/screener_result.dart';

class ScreenerResultTile extends StatelessWidget {
  final ScreenerResult result;

  const ScreenerResultTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(result.symbol),
      subtitle: Text(result.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result.close.toString()),
          Text('RSI ${result.rsi14?.toString() ?? 'N/A'}', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      onTap: () => context.push(RoutePaths.stockDetail(result.symbol)),
    );
  }
}
