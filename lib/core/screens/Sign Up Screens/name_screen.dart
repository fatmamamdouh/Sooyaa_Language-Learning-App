import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/Validator/validator.dart';
import '../../customs/AppBar/icons_app_bar.dart';
import '../../customs/Buttons/custom_btn.dart';
import '../../customs/TextFields/custom_textfield.dart';
import '../../resources/app_images.dart';
import '../../resources/app_texts.dart';


class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: iconsAppBar(context: context, image: AppImages.cat),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.nameTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10.h),
                Text(
                  AppTexts.firstName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  hint: AppTexts.nameHint,
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                  validator: (validator) =>
                      Validator.validateName(name: validator!),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppTexts.lastName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  hint: AppTexts.nameHint,
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  validator: (validator) => Validator.validateName(
                    name: validator!,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppTexts.nameRules,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 300.h),
                Center(
                  child: CustomBtn(
                      hidden: false,
                      title: AppTexts.continueBtn,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "createPassword");
                        }
                      }),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
