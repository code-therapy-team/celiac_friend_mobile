part of 'otp_cubit_cubit.dart';

@immutable
sealed class OtpState {}
final class OtpInitial extends OtpState {}
final class OtpLoading extends OtpState {}
final class OtpSetName extends OtpState {}
final class OtpVerifyNumber extends OtpState {}
final class OtpVerifyOTP extends OtpState {}
final class OtpErrorState extends OtpState {
  final String errorMessage;
  OtpErrorState({required this.errorMessage});
}
