import '../../entities/parish_entity.dart';

abstract class GetParishByHourConfessionUseCase {
  ParishEntity call(DateTime confessionTime);
}
