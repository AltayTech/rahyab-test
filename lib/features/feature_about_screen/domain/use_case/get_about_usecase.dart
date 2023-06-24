import 'package:rahyab_test/Core/usecase/usecase.dart';

import '../../../../Core/resources/data_state.dart';
import '../repositories/about_repository.dart';

class GetAboutListUseCase extends UseCase<DataState<String>, String> {
  final AboutRepository aboutRepository;

  GetAboutListUseCase(this.aboutRepository);

  @override
  Future<DataState<String>> call(String param) {
    return aboutRepository.fetchAboutData(param);
  }
}
