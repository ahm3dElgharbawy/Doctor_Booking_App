import 'package:doctor_booking/features/home/data/models/home.dart';
import 'package:doctor_booking/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  late HomeModel homeData;

  void getHomeData() {
    emit(HomeLoading());
    homeRepo.homeData((failure) {
      emit(HomeFailure(failure.message));
    }, (data) {
      homeData = HomeModel.fromJson(data['data']);
      emit(HomeSuccess());
    });
  }
}
