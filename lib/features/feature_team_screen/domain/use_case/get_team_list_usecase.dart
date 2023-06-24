import 'package:rahyab_test/Core/params/no_param.dart';
import 'package:rahyab_test/Core/usecase/usecase.dart';
import 'package:rahyab_test/features/feature_team_screen/domain/entities/team_entity.dart';

import '../../../../Core/resources/data_state.dart';
import '../repositories/team_repository.dart';

class GetTeamListUseCase
    extends UseCase<DataState<List<TeamEntity>>, NoParams> {
  final TeamRepository teamRepository;

  GetTeamListUseCase(this.teamRepository);

  @override
  Future<DataState<List<TeamEntity>>> call(param) {
    return teamRepository.fetchTeamData();
  }
}
