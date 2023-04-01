import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/modules/users_screen/provider/users_provider.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

class ListViewWidget extends ConsumerStatefulWidget {
  final List<UserData> _data;
  bool _isLoading;

  ListViewWidget(this._data, this._isLoading, {super.key});

  @override
  ConsumerState<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends ConsumerState<ListViewWidget> {
  late DataState _dataState;

  @override
  Widget build(BuildContext context) {
    final userProv = ref.watch(usersProvider);
    _dataState = userProv.dataState;
    return SafeArea(child: _scrollNotificationWidget(userProv));
  }

  Widget _scrollNotificationWidget(UsersListController userProv) {
    return Column(
      children: [
        Expanded(
            child: NotificationListener<ScrollNotification>(
                onNotification: _scrollNotification,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await _onRefresh();
                  },
                  child: userProv.isSearching
                      ? ListView.builder(
                          itemCount: userProv.searchResult.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, NamedRoutes.userDetails,
                                        arguments:
                                            userProv.searchResult[index].id);
                                  },
                                  child: Card(
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          userProv.searchResult[index]
                                                  .fullName ??
                                              "",
                                        ),
                                      )),
                                ));
                          },
                        )
                      : ListView.builder(
                          itemCount: widget._data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, NamedRoutes.userDetails,
                                        arguments: widget._data[index].id);
                                  },
                                  child: Card(
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          widget._data[index].fullName ?? "",
                                        ),
                                      )),
                                ));
                          },
                        ),
                ))),
        if (_dataState == DataState.moreFetching)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  bool _scrollNotification(ScrollNotification scrollInfo) {
    if (!widget._isLoading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        widget._data.isNotEmpty) {
      widget._isLoading = true;
      ref.watch(usersProvider).fetchUsersList();
    }
    return true;
  }

  _onRefresh() async {
    if (!widget._isLoading) {
      widget._isLoading = true;
      ref.watch(usersProvider).fetchUsersList(isRefresh: true);
    }
  }
}
