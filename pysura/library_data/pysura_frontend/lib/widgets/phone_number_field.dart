import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../common/app_text_style.dart';

class PhoneNumberField extends StatelessWidget {
  final Function(String?)? onNumberChanged;

  const PhoneNumberField({
    super.key,
    this.onNumberChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: null, // controller & initialValue value
      initialValue: null, // can't be supplied simultaneously
      shouldFormat: true, // default
      defaultCountry: IsoCode.US, // default
      autovalidateMode: AutovalidateMode.disabled, // default
      decoration: AppTextStyle.generateTextFieldDecoration(
          'Phone', 'Enter your phone number'),
      // validator: PhoneValidator.validMobile(), // default PhoneValidator.valid()
      isCountryChipPersistent: false, // default
      isCountrySelectionEnabled: true, // default
      countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
      showFlagInInput: true, // default
      flagSize: 16, // default
      enabled: true, // default
      autofocus: true,
      style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
      countryCodeStyle: GoogleFonts.poppins(
          // fontSize: 16,
          // color: kDarkGrey,
          ),
      onChanged: (PhoneNumber? number) {
        onNumberChanged?.call(number?.international);
      },
    );
  }
}
