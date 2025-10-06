import 'package:movies_app/domain/entities/provider.dart';
import 'package:movies_app/infrastructure/models/moviedb/providers_providerdb.dart';

class ProviderMapper {
  static Provider providerToEntity(FlatRate flatRate) => Provider(
    logoPath: getImageUrl(flatRate.logoPath),
    providerId: flatRate.providerId,
    providerName: flatRate.providerName,
  );

  static String getImageUrl(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    }
    return 'https://media.themoviedb.org/t/p/original/$path';
  }
}
