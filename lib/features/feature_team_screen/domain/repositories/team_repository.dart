import 'package:rahyab_test/features/feature_team_screen/domain/entities/team_entity.dart';

import '../../../../Core/resources/data_state.dart';

abstract class TeamRepository {
  Future<DataState<List<TeamEntity>>> fetchTeamData();
}
