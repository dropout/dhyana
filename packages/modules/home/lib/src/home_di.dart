import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:home/src/public/enum/home_screen_view_state.dart';
import 'package:home/src/public/viewmodel/home_screen_cubit.dart';

extension HomeModuleDependencyInjection on GetIt {
  
  void registerHomeModuleDependencies() {


    registerFactoryParam<HomeScreenCubit, HomeScreenViewState?, void>(
      (initialSessionType, _) => HomeScreenCubit(
        initialState: (initialSessionType != null) 
          ? HomeScreenState(sessionType: initialSessionType) 
          : null,
        crashlyticsService: get<CrashlyticsService>(),
      ),
    );

    
  }

}
