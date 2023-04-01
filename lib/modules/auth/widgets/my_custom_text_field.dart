import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/core/extensions/build_context_x.dart';
import 'package:kabaten_task/modules/auth/enums/enums.dart';
import 'package:kabaten_task/modules/auth/helper/helper.dart';
import 'package:kabaten_task/modules/auth/provider/provider.dart';

class MyCustomTextFormField extends StatelessWidget {
  const MyCustomTextFormField({
    Key? key,
    this.headerText = "",
    this.keyboardType,
    this.hintText,
    this.validator,
    this.onChange,
    required this.flag,
    this.icon,
    this.readOnly,
    this.textFieldBackGroundColor,
  }) : super(key: key);

  final String headerText;
  final TextInputType? keyboardType;
  final String? hintText;
  final Function(String? value)? validator;
  final Function(String? value)? onChange;
  final RegistrationEnums flag;
  final IconButton? icon;
  final bool? readOnly;
  final Color? textFieldBackGroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header of TextField based on flag
        Text(
          headerText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        Consumer(builder: (_, ref, __) {
          final authProv = ref.watch(authProvider);

          /// text field controller selection based on flag
          final textEditingController =
              SelectTheFieldControllerBasedOnFlagPassed(
                  flag: flag, authProvider: authProv);

          /// toggle password text visibility
          final togglePasswordField =
              TogglePasswordField(flag: flag, myRegistrationProvider: authProv);

          return Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: keyboardType,
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: textEditingController.value(),
                    obscureText: togglePasswordField.toggleObscure(),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: hintText,
                      fillColor: textFieldBackGroundColor,
                      filled: textFieldBackGroundColor != null ? true : false,
                      contentPadding: const EdgeInsets.all(8),
                      hintStyle: context.textTheme.bodyMedium
                          ?.copyWith(color: MyAppColors.grey, fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: context.colorScheme.secondary),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: context.colorScheme.secondary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: context.colorScheme.secondary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: context.colorScheme.secondary),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      suffixIcon: icon != null
                          ? IconButton(
                              onPressed: () {},
                              icon: icon!,
                            )
                          : null,
                    ),
                    autofocus: false,
                    maxLines: 1,
                    validator: (String? value) {
                      /// registration validators helper class
                      RegisterTextFieldValidators(
                              flag, authProv, value, context)
                          .validatedRegistrationTextFields();
                    },
                    onChanged: (String? value) {
                      /// registration on change methods text field helper class
                      RegisterTextFieldChanges(flag, authProv, value, context)
                          .onChange();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
