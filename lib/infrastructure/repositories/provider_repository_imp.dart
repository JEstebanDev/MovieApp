import 'package:movies_app/domain/datasources/provider_datasource.dart';
import 'package:movies_app/domain/entities/provider.dart';
import 'package:movies_app/domain/repositories/provider_repository.dart';

class ProviderRepositoryImp extends ProviderRepository {
  final ProviderDatasource providerDatasource;

  ProviderRepositoryImp(this.providerDatasource);

  @override
  Future<List<Provider>> getProviderByMovieId(String idMovie) {
    return providerDatasource.getProviderByMovieId(idMovie);
  }
}
