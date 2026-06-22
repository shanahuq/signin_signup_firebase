import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signin_signup_project/ui_pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isvisible = true;
  bool ischeck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create Account....',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Join us and start your journey',
                  style: TextStyle(
                    color: const Color.fromARGB(171, 0, 0, 0),
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  prefix: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  prefix: const Icon(Icons.mail_outline, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: SizedBox(
                  height: 50.h,
                  child: TextField(
                    textAlign: TextAlign.start,
                    obscureText: isvisible,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      prefix: const Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      suffix: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          icon: Icon(
                            isvisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 50.h,
                child: TextField(
                  obscureText: isvisible,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(fontSize: 12.sp),
                    prefix: Icon(Icons.lock_outline, color: Colors.grey),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },
                      icon: Icon(
                        isvisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Checkbox(
                    value: ischeck,
                    onChanged: (value) {
                      setState(() {
                        ischeck = value!;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  Text('I agree to the', style: TextStyle(fontSize: 12.sp)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Terms of Service',
                      style: TextStyle(fontSize: 12.sp, color: Colors.green),
                    ),
                  ),
                  Text('and', style: TextStyle(fontSize: 12.sp)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 12.sp, color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        color: const Color.fromARGB(168, 0, 0, 0),
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 10.h),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.g_mobiledata_rounded, size: 30.sp),
                label: Text('Continue with Google'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(500.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.apple, size: 30.sp),
                label: Text('Continue with Apple'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(500.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an Account?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color.fromARGB(170, 0, 0, 0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 12.sp, color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
