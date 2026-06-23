import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            Center(
              child: Text(
                'Welcome Home',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
