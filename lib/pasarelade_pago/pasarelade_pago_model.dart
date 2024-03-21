import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pasarelade_pago_widget.dart' show PasareladePagoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasareladePagoModel extends FlutterFlowModel<PasareladePagoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for Ciudad widget.
  String? ciudadValue1;
  FormFieldController<String>? ciudadValueController1;
  // State field(s) for Ciudad widget.
  String? ciudadValue2;
  FormFieldController<String>? ciudadValueController2;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameController1;
  String? Function(BuildContext, String?)? yourNameController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameController2;
  String? Function(BuildContext, String?)? yourNameController2Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode3;
  TextEditingController? yourNameController3;
  String? Function(BuildContext, String?)? yourNameController3Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode4;
  TextEditingController? yourNameController4;
  String? Function(BuildContext, String?)? yourNameController4Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode5;
  TextEditingController? yourNameController5;
  String? Function(BuildContext, String?)? yourNameController5Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode6;
  TextEditingController? yourNameController6;
  String? Function(BuildContext, String?)? yourNameController6Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NOMBRECOMPLETO widget.
  FocusNode? nombrecompletoFocusNode;
  TextEditingController? nombrecompletoController;
  String? Function(BuildContext, String?)? nombrecompletoControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for TARJETA widget.
  FocusNode? tarjetaFocusNode;
  TextEditingController? tarjetaController;
  String? Function(BuildContext, String?)? tarjetaControllerValidator;
  // State field(s) for MES widget.
  FocusNode? mesFocusNode;
  TextEditingController? mesController;
  String? Function(BuildContext, String?)? mesControllerValidator;
  // State field(s) for YEAR widget.
  FocusNode? yearFocusNode;
  TextEditingController? yearController;
  String? Function(BuildContext, String?)? yearControllerValidator;
  // State field(s) for CLAVE widget.
  FocusNode? claveFocusNode;
  TextEditingController? claveController;
  String? Function(BuildContext, String?)? claveControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? ordenCopy;
  // Stores action output result for [Backend Call - API (Obtener token card)] action in Button widget.
  ApiCallResponse? creartokerCard;
  // Stores action output result for [Backend Call - API (Crear Pago Tarjeta)] action in Button widget.
  ApiCallResponse? pagar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? orden;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    yourNameFocusNode1?.dispose();
    yourNameController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameController3?.dispose();

    yourNameFocusNode4?.dispose();
    yourNameController4?.dispose();

    yourNameFocusNode5?.dispose();
    yourNameController5?.dispose();

    yourNameFocusNode6?.dispose();
    yourNameController6?.dispose();

    nombrecompletoFocusNode?.dispose();
    nombrecompletoController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    tarjetaFocusNode?.dispose();
    tarjetaController?.dispose();

    mesFocusNode?.dispose();
    mesController?.dispose();

    yearFocusNode?.dispose();
    yearController?.dispose();

    claveFocusNode?.dispose();
    claveController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
}
