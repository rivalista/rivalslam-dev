import '/components/common_pagination_app_bar/common_pagination_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'choose_favourites_view_widget.dart' show ChooseFavouritesViewWidget;
import 'package:flutter/material.dart';

class ChooseFavouritesViewModel
    extends FlutterFlowModel<ChooseFavouritesViewWidget> {
  ///  Local state fields for this page.

  List<String> isSelected = [''];
  void addToIsSelected(String item) => isSelected.add(item);
  void removeFromIsSelected(String item) => isSelected.remove(item);
  void removeAtIndexFromIsSelected(int index) => isSelected.removeAt(index);
  void insertAtIndexInIsSelected(int index, String item) =>
      isSelected.insert(index, item);
  void updateIsSelectedAtIndex(int index, Function(String) updateFn) =>
      isSelected[index] = updateFn(isSelected[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CommonPaginationAppBar component.
  late CommonPaginationAppBarModel commonPaginationAppBarModel;

  @override
  void initState(BuildContext context) {
    commonPaginationAppBarModel =
        createModel(context, () => CommonPaginationAppBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    commonPaginationAppBarModel.dispose();
  }
}
