import '../../../../Core/resources/data_state.dart';
import '../entities/experience_entity.dart';

abstract class ExperienceRepository {
  Future<DataState<List<ExperienceEntity>>> fetchExperienceData();
}
