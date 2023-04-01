import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/modules/users_screen/provider/users_provider.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersProv = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyAppColors.white,
        title: const SearchField(),
        elevation: 1,
      ),
      body: Builder(
        builder: (BuildContext context) {
          switch (usersProv.dataState) {
            case DataState.uninitialized:
              Future(() {
                usersProv.fetchUsersList();
              });
              return ListViewWidget(usersProv.dataList, true);
            case DataState.initialFetching:
              return const Center(child: CircularProgressIndicator());
            case DataState.moreFetching:
            case DataState.refreshing:
              return ListViewWidget(usersProv.dataList, true);
            case DataState.fetched:
            case DataState.error:
            case DataState.noMoreData:
              return ListViewWidget(usersProv.dataList, false);
          }
        },
      ),
    );
  }
}
