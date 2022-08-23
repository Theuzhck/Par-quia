import '../../entities/usuario_entity.dart';
import '../../entities/parish_entity.dart';

abstract class SaveChangeSuggestionUseCase {
  Future<bool> call(ParishEntity parishEntity, UserEntity userEntity);
}
