import 'package:get_it/get_it.dart';
import 'package:minimalist_state_management/features/counter/counter_state.dart';
import 'package:minimalist_state_management/features/post_list_view/list_view_state.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<CounterState>(CounterState());
  getIt.registerSingleton<ListViewState>(ListViewState());

// Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<AppModel>(AppModel());
}
