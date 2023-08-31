import 'package:flutter/material.dart';
import 'package:telegram/presentation/main_page/chats/widgets/appbar.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: AppBarWidget(),
      ),
      body: Center(
        child: ListTile(
        ),
      ),
    );
  }
}
