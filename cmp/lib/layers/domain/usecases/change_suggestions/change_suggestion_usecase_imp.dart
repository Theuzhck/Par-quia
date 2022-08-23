import 'package:cmp/layers/domain/entities/usuario_entity.dart';
import 'package:cmp/layers/domain/entities/parish_entity.dart';
import 'package:cmp/layers/domain/repositories/save_change)suggestion_repository.dart';
import 'package:cmp/layers/domain/usecases/change_suggestions/change_suggestion_usecase.dart';

class ChangeSuggestionUseCaseImp implements SaveChangeSuggestionUseCase {
  final SaveChangeSuggestionRepository _saveChangeSuggestionRepository;

  ChangeSuggestionUseCaseImp(this._saveChangeSuggestionRepository);
  @override
  Future<bool> call(ParishEntity parishEntity, UserEntity userEntity) async {
    return await _saveChangeSuggestionRepository(parishEntity, userEntity);
  }
}
