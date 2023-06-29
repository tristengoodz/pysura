import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '/common/utils.dart';

class PhoneNumberField extends StatelessWidget {
  final Function(String?)? onNumberChanged;

  const PhoneNumberField({
    super.key,
    this.onNumberChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: null,
      // controller & initialValue value
      initialValue: null,
      // can't be supplied simultaneously
      shouldFormat: true,
      // default
      defaultCountry: IsoCode.US,
      // default
      autovalidateMode: AutovalidateMode.disabled,
      // default
      decoration:
          generateTextFieldDecoration(context, 'Phone', 'Your phone number'),
      // validator: PhoneValidator.validMobile(), // default PhoneValidator.valid()
      isCountryChipPersistent: false,
      // default
      isCountrySelectionEnabled: true,
      // default
      countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
      showFlagInInput: true,
      // default
      flagSize: 16,
      // default
      enabled: true,
      // default
      autofocus: true,
      style: Theme.of(context).textTheme.titleMedium,
      onChanged: (PhoneNumber? number) {
        onNumberChanged?.call(number?.international);
      },
    );
  }
}
