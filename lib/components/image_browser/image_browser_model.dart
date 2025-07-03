import '/flutter_flow/flutter_flow_util.dart';
import 'image_browser_widget.dart' show ImageBrowserWidget;
import 'package:flutter/material.dart';

class ImageBrowserModel extends FlutterFlowModel<ImageBrowserWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataAxn = false;
  FFUploadedFile uploadedLocalFile_uploadDataAxn =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataAxn = '';

  bool isDataUploading_uploadDataTfk = false;
  FFUploadedFile uploadedLocalFile_uploadDataTfk =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataTfk = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
