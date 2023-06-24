import 'package:rahyab_test/Core/params/no_param.dart';
import 'package:rahyab_test/Core/usecase/usecase.dart';

import '../../../../Core/resources/data_state.dart';
import '../entities/experience_entity.dart';
import '../repositories/experience_repository.dart';

class GetExperienceListUseCase
    extends UseCase<DataState<List<ExperienceEntity>>, NoParams> {
  final ExperienceRepository experienceRepository;

  GetExperienceListUseCase(this.experienceRepository);

  @override
  Future<DataState<List<ExperienceEntity>>> call(param) {
    return experienceRepository.fetchExperienceData();
  }
}
