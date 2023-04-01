import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/modules/users_screen/provider/users_provider.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProv = ref.watch(usersProvider);
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Users',
          suffixIcon: _textEditingController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _textEditingController.clear();
                    userProv.search('', false);
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
        ),
        onChanged: (val) {
          userProv.search(val, true);
        },
      ),
    );
  }
}
