import '../../entities/parish_entity.dart';
import 'get_parish_by_name_usecase.dart';

abstract class GetParishByNameUseCaseImp implements GetParishByNameUseCase {
  @override
  ParishEntity call(ParishEntity parishEntity) {
    if (parishEntity.parishName == 'a') {
      return ParishEntity(
          parishName: "Paróquia A",
          parishPriestName: "Padre A",
          parishForay: "Forania A",
          parishVicariate: "Vicariato AA",
          parishLocation: 10.0,
          massTimes: [],
          parishPhones: [],
          worshipTimes: []);
    } else {
      return ParishEntity(
          parishName: "Paróquia B",
          parishPriestName: "Padre B",
          parishForay: "Forania B",
          parishVicariate: "Vicariato B",
          parishLocation: 20.0,
          massTimes: [],
          parishPhones: [],
          worshipTimes: []);
    }
  }
}
