import 'package:app/controller/cubit_transfer/transfer_cubit.dart';
import 'package:app/views/home/home_screen.dart';
import 'package:app/views/transfer/transfer_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : currentPage = defaultX,
        super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;
  static int get defaultX => 0;

  PageController controller = PageController(initialPage: defaultX);

  List<Widget> screens = const [
    HomeScreen(),
    TransferScreen(),
    // Center(
    //   child: Text("TransferScreen",
    //       style: TextStyle(
    //         fontSize: 18,
    //         fontWeight: FontWeight.w700,
    //       )),
    // ),
  ];
  List<BottomNavigationBarItem> items() => [
        BottomNavigationBarItem(
          icon: Icon((currentPage == 0) ? Icons.home : Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              (currentPage == 1) ? Icons.money_rounded : Icons.money_outlined),
          label: 'Transfers',
        ),
      ];

  void onSelected(int index) {
    currentPage = index;
    controller.jumpToPage(currentPage);
    (currentPage == 0)
        ? TransferCubit().getAllUsers()
        : TransferCubit().getAllTransfers();

    emit(OnSelectedState());
  }

  void onPageChanged(int index) {
    currentPage = index;
    (currentPage == 0)
        ? TransferCubit().getAllUsers()
        : TransferCubit().getAllTransfers();

    emit(OnPageChangedState());
  }
}
