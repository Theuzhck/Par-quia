import '../entities/parish_entity.dart';
import '../entities/usuario_entity.dart';

abstract class SaveChangeSuggestionRepository {
  Future<bool> call(ParishEntity parishEntity, UserEntity userEntity);
}
