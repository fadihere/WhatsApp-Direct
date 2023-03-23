import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/utils/strings.dart';
import 'package:whatsapp/widgets/buttons.dart';
import 'package:whatsapp/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _phone = TextEditingController(text: "");
  final TextEditingController _msg = TextEditingController(text: "");
  String _code = "+92";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Direct'),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      PhoneNumberTextField(
                        hintText: AppStrings.kEnterYourNumber,
                        onChanged: (val) {
                          _code = val.toString();
                        },
                        controller: _phone,
                        validator: _validateMobile,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'write your message (optional)',
                        controller: _msg,
                      ),
                      AppButton(
                        title: AppStrings.kNext,
                        onTap: _next,
                      )
                    ]),
              ))),
    );
  }

  _next() async {
    if (!_formKey.currentState!.validate()) return;
    final code = Uri.dataFromString(_code);
    final url = Uri.parse(
        "https://api.whatsapp.com/send/?phone=$code${_phone.text}&text=${_msg.text}");
    await launchUrl(url);
  }

  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a phone number";
    }
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
