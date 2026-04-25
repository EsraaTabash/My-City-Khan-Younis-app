import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/AppCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_application_1/core/utils/validators.dart';
import 'package:flutter_application_1/features/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double topSectionHeight = 260;
  final double cardTop = 223;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/home', arguments: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: topSectionHeight.h,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/login_bg.png',
                      fit: BoxFit.cover,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary.withOpacity(0.65),
                            AppColors.secondary.withOpacity(0.65),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),

                    SafeArea(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 128.h),
                          child: Text(
                            'مرحباً بك مجدداً',
                            style: AppTextStyles.semiBold20.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFFF8FAFC),
                ),
              ),
            ],
          ),

          Positioned(
            top: cardTop.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                AppCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 64.h,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/stars.png'),
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              'تسجيل الدخول',
                              style: AppTextStyles.semiBold25.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 45.h),

                        CustomTextField(
                          controller: _idController,
                          label: 'رقم الهوية',
                          hintText: 'مثال: 803563154',
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          validator: AppValidators.validateId,
                        ),

                        SizedBox(height: 18.h),

                        CustomTextField(
                          controller: _passwordController,
                          label: 'كلمة المرور',
                          hintText: '************',
                          obscureText: true,
                          textAlign: TextAlign.center,
                          validator: AppValidators.validatePassword,
                        ),

                        SizedBox(height: 20.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'مستخدم جديد؟',
                              style: AppTextStyles.regular14.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              'نسيت كلمة المرور؟',
                              style: AppTextStyles.secondaryText14.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 31.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PrimaryButton(
                    text: 'تسجيل الدخول',
                    onPressed: _submitLogin,
                    height: 50,
                    borderRadius: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
