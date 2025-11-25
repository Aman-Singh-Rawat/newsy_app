import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/features/my-news/widgets/add_cover_photos_widget.dart';
import 'package:newsy/presentations/features/my-news/widgets/add_tag.dart';
import 'package:newsy/presentations/features/my-news/widgets/select_category.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/bottom_navigation_btn.dart';
import 'package:newsy/presentations/common_widgets/buttons/create_news_bottom_Btn_background.dart';
import 'package:newsy/presentations/common_widgets/html_editor.dart';
import 'package:newsy/presentations/common_widgets/text_field_with_label_widget.dart';
import 'package:newsy/presentations/common_widgets/texts/screen_title_text.dart';
import 'package:newsy/presentations/common_widgets/texts/text_field_title.dart';

class CreateNewNews extends StatefulWidget {
  const CreateNewNews({super.key});

  @override
  State<CreateNewNews> createState() => _CreateNewNewsState();
}

class _CreateNewNewsState extends State<CreateNewNews> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _chipController = TextEditingController();
  String? _selectedCategory;

  bool get _isFieldsEmpty {
    if (_titleController.text.trim().isEmpty || _selectedCategory == null) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _titleController.addListener(() => setState(() {}));
    _chipController.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: TextStrings.createNewNews),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Add Cover Photos
              AddCoverPhotosWidget(),

              Divider().padSymmetric(vertical: 20.h),

              /// screen title
              ScreenTitleText(title: TextStrings.newsDetails),

              SizedBox(height: 20.h),
              CustomTextFieldWithLabel(
                label: TextStrings.title,
                hint: TextStrings.title,
                isFieldEmpty: _titleController.text.isEmpty,
                controller: _titleController,
              ),

              SizedBox(height: 20.h),

              /// Select Category title
              SelectCategory(
                onChanged: (value) {
                  setState(() => _selectedCategory = value);
                },
                isFieldEmpty: _selectedCategory == null,
              ),

              SizedBox(height: 20.h),

              /// "Add News/Article"
              TextFieldTitle(label: TextStrings.addNewsArticles),
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 6, bottom: 20.h),
                child: MyHtmlEditor(),
              ),

              /// Add Tag
              AddTag(
                chipController: _chipController,
                isFieldEmpty: _chipController.text.trim().isEmpty,
              ),
            ],
          ).padSymmetric(horizontal: 20.w),
        ),
      ),
      bottomNavigationBar: BottomNavigationItemBg(
        child: Row(
          children: [
            CreateNewsBottomBtnBackground(
              imagePath: ImageStrings.icSave,
              iconColor: _isFieldsEmpty
                  ? Colorr.buttonDisabled
                  : Colorr.primaryColor[400],
            ),
            SizedBox(width: 10.w),
            CreateNewsBottomBtnBackground(
              icon: Icons.calendar_today,
              iconColor: _isFieldsEmpty
                  ? Colorr.buttonDisabled
                  : Colorr.primaryColor[400],
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ElevatedButton(
                onPressed: _isFieldsEmpty ? null : () {},
                child: Text(TextStrings.publishNow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
