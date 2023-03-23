import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';

class PhoneNumberTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? readOnly;
  final String hintText;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? suffixIcon;
  final Function(CountryCode)? onChanged;
  final Function(String? value)? validator;
  const PhoneNumberTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.validator,
    this.suffixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.kgrey),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: CountryCodePicker(
                padding: const EdgeInsets.only(left: 5),
                backgroundColor: AppColors.kgrey,
                onChanged: onChanged,
                initialSelection: 'PK',
                favorite: const ['+92', 'PK'],
                showFlag: false,
                showFlagDialog: true,
                alignLeft: true,
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: TextFormField(
              maxLines: maxLines != null ? null : 1,
              controller: controller,
              onTap: onTap,
              readOnly: readOnly ?? false,
              cursorColor: AppColors.kGreen,
              validator: (value) => (validator!(value!)),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, top: 18, bottom: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  suffixIcon: suffixIcon,
                  fillColor: AppColors.kgrey,
                  labelText: hintText,
                  labelStyle: StyleRefer.kGilroy),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? readOnly;
  final String hintText;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? suffixIcon;
  final Function(String? value)? validator;
  const CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.kgrey),
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        maxLines: maxLines != null ? null : 1,
        controller: controller,
        onTap: onTap,
        keyboardType: TextInputType.phone,
        readOnly: readOnly ?? false,
        cursorColor: AppColors.kGreen,
        validator: (value) => (validator!(value!)),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            suffixIcon: suffixIcon,
            fillColor: AppColors.kgrey,
            labelText: hintText,
            labelStyle: StyleRefer.kGilroy),
      ),
    );
  }
}
