part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class OnSelectedState extends AppState {}

final class OnPageChangedState extends AppState {}
