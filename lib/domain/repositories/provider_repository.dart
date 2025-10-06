import 'package:movies_app/domain/entities/provider.dart';

abstract class ProviderRepository {
  Future<List<Provider>> getProviderByMovieId(String idMovie);
}
