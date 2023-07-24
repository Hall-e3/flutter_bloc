// ignore_for_file: must_be_immutable

part of 'app_bloc.dart';

class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object> get props => [];
}

class SetCurrentItem extends AppBlocEvent {
  int currentItem;
  SetCurrentItem({required this.currentItem});

  @override
  List<Object> get props => [currentItem];
}
