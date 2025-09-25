import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchViewWidget extends StatelessWidget {
  final bool isFieldEmpty;

  const SearchViewWidget({super.key, this.isFieldEmpty = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
        fillColor: const Color(0xFFf5f6fa),
        hintText: 'Search',
        hintStyle: GoogleFonts.poppins(
          color: Colors.black54,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(isFieldEmpty ? Icons.search : Icons.clear),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
