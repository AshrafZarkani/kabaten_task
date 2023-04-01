import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

class UsersListController extends ChangeNotifier {
  int _currentPageNumber = 1;
  bool _last = false;
  bool _isSearching = false;
  DataState _dataState = DataState.uninitialized;
  bool get _didLastLoad => _last;
  bool get isSearching => _isSearching;
  DataState get dataState => _dataState;
  List<UserData> _dataList = [];
  List<UserData> searchResult = [];
  List<UserData> get dataList => _dataList;
  Timer? _debounce;

  search(String val, bool searching) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    if (val.isEmpty) {
      _debounce = Timer(const Duration(milliseconds: 500), () {
        searchResult.clear();
        _isSearching = false;
        notifyListeners();
        return;
      });
    }
    _isSearching = searching;
    searchResult = [];
    if (searching) {
      _debounce = Timer(const Duration(milliseconds: 500), () {
        for (var element in _dataList) {
          if (element.fullName
              .toString()
              .trim()
              .toLowerCase()
              .contains(val.trim().toLowerCase())) {
            searchResult.add(element);
            notifyListeners();
          }
        }
      });
    }
    notifyListeners();
  }

  fetchUsersList({bool isRefresh = false}) async {
    if (!isRefresh) {
      _dataState = (_dataState == DataState.uninitialized)
          ? DataState.initialFetching
          : DataState.moreFetching;
    } else {
      _currentPageNumber = 0;
      _dataState = DataState.refreshing;
    }
    notifyListeners();
    try {
      if (_didLastLoad) {
        _dataState = DataState.noMoreData;
      } else {
        final res = await UsersApi().getUserList(_currentPageNumber);
        UsersList userProfile = UsersList.fromJson(res);
        if (res != null &&
            (userProfile.status == "200" || userProfile.status == "201")) {
          if (userProfile.data?.isNotEmpty == true) {
            for (var element in userProfile.data!) {
              _dataList.add(element);
            }
          } else {
            if (_currentPageNumber > 1) {
              _last = true;
            }
          }
        }
        if (_dataState == DataState.refreshing) {
          _dataList.clear();
        }
        _dataState = DataState.fetched;
        _currentPageNumber++;
      }
      notifyListeners();
    } catch (e) {
      _dataState = DataState.error;
      notifyListeners();
    }
  }
}
