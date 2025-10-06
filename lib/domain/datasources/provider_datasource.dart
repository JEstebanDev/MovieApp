import 'package:movies_app/domain/entities/provider.dart';

abstract class ProviderDatasource {
  Future<List<Provider>> getProviderByMovieId(String idMovie);
}
