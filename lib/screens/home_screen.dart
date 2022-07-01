import 'package:flutter/material.dart';
import 'package:whatsapp/utils/strings.dart';
import 'package:whatsapp/widgets/buttons.dart';
import 'package:whatsapp/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String phone = "";
  String msg = "";
  String code = "+92";
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    PhoneNumberTextField(
                      hintText: AppStrings.kEnterYourNumber,
                      onChanged: (val) {
                        code = val.toString();
                      },
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(
                      hintText: 'write your message (optional)',
                    ),
                    AppButton(title: AppStrings.kNext, onTap: () => _next())
                  ]))),
    );
  }

  _next() {}
}
