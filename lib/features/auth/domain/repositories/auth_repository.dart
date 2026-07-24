import '../../../../core/error/result.dart';
import '../entities/user_profile.dart';

abstract class AuthRepository {
  Future<Result<UserProfile>> register({required String email, required String password, required String displayName});

  Future<Result<UserProfile>> login({required String email, required String password});

  Future<Result<void>> logout();

  /// Attempts to restore a session from a stored refresh token at app
  /// launch. `Success(null)` means "no session to restore" (not an error) -
  /// distinct from `Error`, which means a session existed but restoring it
  /// failed.
  Future<Result<UserProfile?>> restoreSession();

  Future<Result<UserProfile>> updateProfile({String? displayName, String? email});
}
