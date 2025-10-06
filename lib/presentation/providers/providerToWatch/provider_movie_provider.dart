import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infrastructure/datasources/providersdb_datasource.dart';
import 'package:movies_app/infrastructure/repositories/provider_repository_imp.dart';

final providersToWatchProvide = Provider((ref) {
  return ProviderRepositoryImp(ProviderDbDataSource());
});
