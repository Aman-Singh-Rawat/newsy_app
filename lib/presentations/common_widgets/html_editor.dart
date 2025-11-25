import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class MyHtmlEditor extends StatefulWidget {
  const MyHtmlEditor({super.key});

  @override
  State<MyHtmlEditor> createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  final QuillController controller = QuillController.basic();
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuillSimpleToolbar(
          controller: controller,

          config: QuillSimpleToolbarConfig(
            showBoldButton: true,
            showItalicButton: true,
            showListBullets: true,
            showListNumbers: true,
            showLink: true,
            toolbarIconAlignment: WrapAlignment.start,
            toolbarIconCrossAlignment: WrapCrossAlignment.start,
            showAlignmentButtons: false,
            showBackgroundColorButton: false,
            showCenterAlignment: false,
            showClearFormat: false,
            showClipboardCopy: false,
            showClipboardCut: false,
            showClipboardPaste: false,
            showCodeBlock: false,
            showColorButton: false,
            showSuperscript: false,
            showDirection: false,
            showDividers: false,
            showFontFamily: false,
            showFontSize: false,
            showHeaderStyle: false,
            showIndent: false,
            showInlineCode: false,
            showJustifyAlignment: false,
            showLeftAlignment: false,
            showLineHeightButton: false,
            showListCheck: false,
            showQuote: false,
            showRedo: false,
            showRightAlignment: false,
            showSearchButton: false,
            showSmallButton: false,
            showStrikeThrough: false,
            showSubscript: false,
            showUnderLineButton: false,
            showUndo: false,
           // buttonOptions: QuillSimpleToolbarButtonOptions(color: C)
          ),
        ),
        QuillEditor(
          // Pass the controller here
          controller: controller,
          // if you want to control the scroll define a
          // scroll controller and pass it here
          scrollController: ScrollController(),
          // set true if you want the editor to be scrollable
          // when the keyboard appears or too much content
          // pass a focus node if you want to control
          // when the keyboard appears
          focusNode: FocusNode(),
          // if true the keyboard will appear
          // when the widget is rendered
          // set true if you want to disable editing
        ),
      ],
    );
  }
}
