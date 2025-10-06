import 'package:dio/dio.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/domain/datasources/provider_datasource.dart';
import 'package:movies_app/domain/entities/provider.dart';
import 'package:movies_app/infrastructure/mappers/provider_mapper.dart';
import 'package:movies_app/infrastructure/models/moviedb/providers_providerdb.dart';

class ProviderDbDataSource extends ProviderDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrlMovie,
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'Authorization': Environment.movieApiToken,
      },
    ),
  );

  @override
  Future<List<Provider>> getProviderByMovieId(String idMovie) async {
    final response = await dio.get('/movie/$idMovie/watch/providers');
    final watchProviders = WatchProviders.fromJson(response.data);

    final listFlatRate = watchProviders.results?.co?.flatRate ?? [];

    final value = listFlatRate
        .map((flatRate) => ProviderMapper.providerToEntity(flatRate))
        .toList();

    return value;
  }
}
