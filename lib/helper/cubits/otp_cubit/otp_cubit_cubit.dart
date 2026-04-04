import 'package:bloc/bloc.dart';
import 'package:celiac_mobile/core/api/dio_consumer.dart';
import 'package:celiac_mobile/core/services/get_it.dart';
import 'package:celiac_mobile/core/view_model/send_otp_vm.dart';
import 'package:meta/meta.dart';

part 'otp_cubit_state.dart';

class OtpCubitCubit extends Cubit<OtpState> {
  OtpCubitCubit() : super(OtpInitial());
  Future<void> sendOtp({required String phoneNumber}) async {
    emit(OtpLoading());
    final result = await SendOtpVm(
      apiConsumer: getIt<DioConsumer>(),
    ).postOtp(phoneNumber: phoneNumber);
    result.fold(
      (failure) {
        emit(OtpErrorState(errorMessage: failure.toString()));
      },
      (autoGenerate) {
        emit(OtpVerifyNumber());
      },
    );
  }
  Future<void> verifyOtp({required String otp}) async {
    emit(OtpLoading());
    final result = await SendOtpVm(
      apiConsumer: getIt<DioConsumer>(),
    ).verifyOtp(otp: otp);
    result.fold(
      (failure) {
        emit(OtpErrorState(errorMessage: failure.toString()));
      },
      (autoGenerate) {
        emit(OtpVerifyOTP());
      },
    );
  }
}
