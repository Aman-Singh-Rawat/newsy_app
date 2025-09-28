import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:newsy/core/theme/app_colors.dart';

class ChooseYourNewsWidget extends StatefulWidget {
  final Map<String, Object> newsSource;
  const ChooseYourNewsWidget({super.key, required this.newsSource});

  @override
  State<ChooseYourNewsWidget> createState() => _ChooseYourNewsWidgetState();
}

class _ChooseYourNewsWidgetState extends State<ChooseYourNewsWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isSelected = !_isSelected),
      child: Container(
        width: double.infinity,
        height: 125.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: _isSelected
              ? Border.all(color: Colorr.primaryColor[400]!, width: 2.0.w)
              : Border.all(color: Colors.grey.shade200, width: 1.w),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colorr.primaryColor[50],
                    backgroundImage: NetworkImage(
                      widget.newsSource["logo"] as String,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.newsSource["name"] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,

                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // checkbox
            Positioned(
              top: 5.h,
              right: 5.w,
              child: Checkbox(
                value: _isSelected,

                activeColor: Colorr.primaryColor[400],
                fillColor: WidgetStatePropertyAll(
                  _isSelected ? Colorr.primaryColor[400] : Colors.white,
                ),
                onChanged: (value) => setState(() => _isSelected = value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
