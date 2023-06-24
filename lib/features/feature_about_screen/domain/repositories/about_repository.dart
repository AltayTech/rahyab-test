import '../../../../Core/resources/data_state.dart';

abstract class AboutRepository {
  Future<DataState<String>> fetchAboutData(String daysList);
}
