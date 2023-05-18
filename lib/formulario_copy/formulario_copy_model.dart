import '/backend/api_requests/api_calls.dart';
import '/components/cerrar_widget.dart';
import '/components/preguntas_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormularioCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // Model for cerrar component.
  late CerrarModel cerrarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cerrarModel = createModel(context, () => CerrarModel());
  }

  void dispose() {
    instantTimer?.cancel();
    cerrarModel.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
