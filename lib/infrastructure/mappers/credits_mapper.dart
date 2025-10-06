import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/infrastructure/models/moviedb/credits_reponse.dart';

class CreditsMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: getImageUrl(cast.profilePath),
    character: cast.character,
  );

  static String getImageUrl(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$path';
  }
}
