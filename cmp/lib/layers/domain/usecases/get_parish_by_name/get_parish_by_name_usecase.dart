import '../../entities/parish_entity.dart';

abstract class GetParishByNameUseCase {
  ParishEntity call(ParishEntity parishEntity);
}
