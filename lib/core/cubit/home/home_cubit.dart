import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooyaa_app/core/cubit/home/home_states.dart';
import 'package:sooyaa_app/core/model/home_data_model.dart';

import '../../Services/api_services.dart';
import '../../Services/end_points.dart';
import '../../errors/api_failure.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeDataModel? homeDataModel;

  Future<void> getHomeData() async {
    emit(GetHomeDataLoadingState());

    try {
      var value = await DioHelper.getData(url: homePage);
      homeDataModel = HomeDataModel.fromJson(value.data);
      print("data get successfully --------------");
      print(value.data);
      emit(GetHomeDataSuccessState());
    } on DioException catch (e) {
      emit(
        GetHomeDataFailureState(
          errMessage: ApiFailures.fromDioException(e).errMessage,
        ),
      );
    } catch (e) {
      print("data errored ====== --------------");

      emit(GetHomeDataFailureState(errMessage: e.toString()));
    }
  }

}