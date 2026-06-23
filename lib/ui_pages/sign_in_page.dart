import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:signin_signup_project/ui_pages/home_page.dart';
import 'package:signin_signup_project/ui_pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isvisible = true;
  bool ischecked = true;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Login success");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      print("Login error: ${e.code}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Login failed")));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('email');

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithPopup(googleProvider);

      User? user = userCredential.user;

      print("Name : ${user?.displayName}");
      print("Email : ${user?.email}");
      print("UID : ${user?.uid}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Google Sign In Failed")),
      );
    } catch (e) {
      print(e);
    }
  }

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
                  'Welcome Back...',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in to continue to your account',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color.fromARGB(167, 0, 0, 0),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: email_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  prefix: const Icon(Icons.email_outlined, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: password_controller,
                obscureText: isvisible,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  prefix: const Icon(Icons.lock_outline, color: Colors.grey),
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
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                          });
                        },
                        activeColor: Colors.deepPurple,
                      ),
                      Text('Remember me', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  signIn(email_controller.text, password_controller.text);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      'or continue with',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20.h),
              OutlinedButton.icon(
                onPressed: () async {
                  await signInWithGoogle();
                },
                icon: const Icon(Icons.g_mobiledata, size: 50),
                label: const Text('Continue with Google'),
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
                icon: const Icon(Icons.apple_sharp, size: 35),
                label: const Text('Continue with Apple'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(500.w, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 12.sp,
                        ),
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
