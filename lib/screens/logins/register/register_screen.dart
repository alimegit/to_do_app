import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/data/local/storage_repository.dart';
import 'package:to_do_app/screens/home_screen/home_screen.dart';
import 'package:to_do_app/screens/logins/register/button.dart';
import 'package:to_do_app/screens/logins/register/textformfield.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';

import '../../../utils/images/app_images.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  late SharedPreferences _pref;

  Future<void> _getSharedInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getSharedInstance();
    super.initState();
  }


  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_1A1A2F,
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,

            child: Column(
              children: [
                SizedBox(height: 50.h,),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Ro'yhatdan o'ting!",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90.r),
                        child: Image.asset(
                          AppImages.logo,
                          width: 180,
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                  SizedBox(height: 70.h,),
                  TextFormFields(controller: nameController, fullText: "Ismingizni kiriting"),
                  SizedBox(height: 45.h,),
                  TextFormFields(controller: surNameController, fullText: "Familiyangizni kiriting"),
                SizedBox(height: 70,),
                LogButton(text: "Ro'yhatdan o'tish",   onTap: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Ro'yhatdan muvaffaqiyatli o'tdingiz!")),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>HomeScreen()));
                    StorageRepository.setString(
                        key: 'name', value: nameController.text);
                    StorageRepository.setString(
                        key: 'surName', value: surNameController.text);
                  }
                },
                )
              ],
            ),
          ),
        )
    );
  }
}
