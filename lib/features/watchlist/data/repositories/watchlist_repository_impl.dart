import 'package:dio/dio.dart';

import '../../../../core/error/result.dart';
import '../../../../core/network/dio_error_mapper.dart';
import '../../domain/entities/watchlist.dart';
import '../../domain/entities/watchlist_detail.dart';
import '../../domain/entities/watchlist_item.dart';
import '../../domain/repositories/watchlist_repository.dart';
import '../datasources/watchlist_remote_data_source.dart';
import '../dto/watchlist_detail_dto.dart';
import '../dto/watchlist_dto.dart';
import '../dto/watchlist_item_dto.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistRemoteDataSource _remote;

  WatchlistRepositoryImpl(this._remote);

  @override
  Future<Result<List<Watchlist>>> list() async {
    try {
      final dtos = await _remote.list();
      return Success(dtos.map(_toEntity).toList());
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Watchlist>> create(String name) async {
    try {
      return Success(_toEntity(await _remote.create(name)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      await _remote.delete(id);
      return const Success(null);
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<WatchlistDetail>> getDetail(String id) async {
    try {
      return Success(_toDetailEntity(await _remote.getDetail(id)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<WatchlistDetail>> addItem(String id, String symbol) async {
    try {
      return Success(_toDetailEntity(await _remote.addItem(id, symbol)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  @override
  Future<Result<WatchlistDetail>> removeItem(String id, String symbol) async {
    try {
      return Success(_toDetailEntity(await _remote.removeItem(id, symbol)));
    } on DioException catch (e) {
      return Error(DioErrorMapper.map(e));
    }
  }

  Watchlist _toEntity(WatchlistDto dto) {
    return Watchlist(id: dto.id, name: dto.name, createdAt: dto.createdAt, itemCount: dto.itemCount);
  }

  WatchlistItem _itemToEntity(WatchlistItemDto dto) {
    return WatchlistItem(
      symbol: dto.symbol,
      name: dto.name,
      addedAt: dto.addedAt,
      lastPrice: dto.lastPrice,
      change: dto.change,
      changePercent: dto.changePercent,
    );
  }

  WatchlistDetail _toDetailEntity(WatchlistDetailDto dto) {
    return WatchlistDetail(
      id: dto.id,
      name: dto.name,
      createdAt: dto.createdAt,
      items: dto.items.map(_itemToEntity).toList(),
    );
  }
}
