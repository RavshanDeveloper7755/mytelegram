import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram/presentation/core/constants/constants.dart';
import 'package:telegram/presentation/main_page/settings/settings.dart';
import 'package:telegram/presentation/main_page/chats/chats.dart';
import 'package:telegram/presentation/main_page/contacts/contacts.dart';

import 'bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

   @override
   Widget build(BuildContext context) => BlocBuilder<MainBloc, MainState>(
     // buildWhen: (previous, current) =>
     //     previous.bottomMenu != current.bottomMenu,
     builder: (_, state) => Scaffold(
       body: IndexedStack(
         index: state.bottomMenu.index,
         children: const [Chats(), Contacts(), Settings()],
       ),
       bottomNavigationBar: BottomNavigationBar(
        // key: Constants.bottomNavigatorKey,
         onTap: (index) {
           context
               .read<MainBloc>()
               .add(SetBottomMenuEvent(menu: BottomMenu.values[index]));
         },
         currentIndex: state.bottomMenu.index,
         items: [
           _navigationBarItem(
             label: "Home",
             icon: Icons.chat,
             activeIcon: Icons.chat,
           ),
          _navigationBarItem(
            label: 'Category',
            icon: Icons.contacts,
            activeIcon: Icons.contacts,
          ),
          _navigationBarItem(
            label: 'Profile',
            icon: Icons.settings,
            activeIcon: Icons.settings,
          ),
        ],
      ),
    ),
  );

  BottomNavigationBarItem _navigationBarItem({
    Widget? widget,
    required String label,
    IconData? icon,
    required IconData activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: widget ?? Icon(icon, color: AppColors.grey,),
        activeIcon: widget ?? Icon(activeIcon, color: AppColors.C_ff36b8b8,),
        label: '',
        tooltip: label,
      );
}