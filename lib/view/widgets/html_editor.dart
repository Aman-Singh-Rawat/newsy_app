import 'dart:convert';
import 'dart:io' as io show Directory, File;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class MyHtmlEditor extends StatefulWidget {
  const MyHtmlEditor({super.key});

  @override
  State<MyHtmlEditor> createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  late final QuillController _controller;
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic(
      config: QuillControllerConfig(
        clipboardConfig: QuillClipboardConfig(
          enableExternalRichPaste: true,
          onImagePaste: (imageBytes) async {
            if (kIsWeb) {
              // Dart IO is unsupported on the web.
              return null;
            }
            // Save the image somewhere and return the image URL that will be
            // stored in the Quill Delta JSON (the document).
            final newFileName =
                'image-file-${DateTime.now().toIso8601String()}.png';
            final newPath = path.join(
              io.Directory.systemTemp.path,
              newFileName,
            );
            final file = await io.File(
              newPath,
            ).writeAsBytes(imageBytes, flush: true);
            return file.path;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          QuillSimpleToolbar(
            controller: _controller,
            config: QuillSimpleToolbarConfig(
              decoration: BoxDecoration(),

              dialogTheme: QuillDialogTheme(
                dialogBackgroundColor: Colors.white,
              ),
              iconTheme: QuillIconTheme(
                iconButtonSelectedData: IconButtonData(
                  color: Colorr.primaryColor[400],
                ),
              ),
              multiRowsDisplay: false,

              showBoldButton: true,
              showItalicButton: true,
              showListBullets: true,
              showListNumbers: true,
              showLink: true,

              // Hide everything else
              showUnderLineButton: false,
              showStrikeThrough: false,
              showAlignmentButtons: false,
              showFontFamily: false,
              showFontSize: false,
              showSubscript: false,
              showSuperscript: false,
              showCodeBlock: false,
              showQuote: false,
              showInlineCode: false,
              showDirection: false,
              showBackgroundColorButton: false,
              showColorButton: false,
              showListCheck: false,
              showSearchButton: false,
              showIndent: false,
              showUndo: false,
              showRedo: false,
              showClipboardPaste: false,
              showHeaderStyle: false,
              showClearFormat: false,
            ),
          ),

          Expanded(
            child: QuillEditor(
              focusNode: _editorFocusNode,
              scrollController: _editorScrollController,
              controller: _controller,
              config: QuillEditorConfig(
                placeholder: 'Start writing your notes...',
                padding: const EdgeInsets.all(16),
                embedBuilders: [
                  ...FlutterQuillEmbeds.editorBuilders(
                    imageEmbedConfig: QuillEditorImageEmbedConfig(
                      imageProviderBuilder: (context, imageUrl) {
                        // https://pub.dev/packages/flutter_quill_extensions#-image-assets
                        if (imageUrl.startsWith('assets/')) {
                          return AssetImage(imageUrl);
                        }
                        return null;
                      },
                    ),
                  ),
                  TimeStampEmbedBuilder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorScrollController.dispose();
    _editorFocusNode.dispose();
    super.dispose();
  }
}

class TimeStampEmbed extends Embeddable {
  const TimeStampEmbed(String value) : super(timeStampType, value);

  static const String timeStampType = 'timeStamp';

  static TimeStampEmbed fromDocument(Document document) =>
      TimeStampEmbed(jsonEncode(document.toDelta().toJson()));

  Document get document => Document.fromJson(jsonDecode(data));
}

class TimeStampEmbedBuilder extends EmbedBuilder {
  @override
  String get key => 'timeStamp';

  @override
  String toPlainText(Embed node) {
    return node.value.data;
  }

  @override
  Widget build(BuildContext context, EmbedContext embedContext) {
    return Row(
      children: [
        const Icon(Icons.access_time_rounded),
        Text(embedContext.node.value.data as String),
      ],
    );
  }
}
