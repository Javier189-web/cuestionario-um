import '/backend/api_requests/api_calls.dart';
import '/components/cerrar_widget.dart';
import '/components/star_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'formulario_model.dart';
export 'formulario_model.dart';

class FormularioWidget extends StatefulWidget {
  const FormularioWidget({
    Key? key,
    this.codigoqr,
    this.starVar,
  }) : super(key: key);

  final String? codigoqr;
  final double? starVar;

  @override
  _FormularioWidgetState createState() => _FormularioWidgetState();
}

class _FormularioWidgetState extends State<FormularioWidget> {
  late FormularioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: PreguntasCall.call(
        areaId: widget.codigoqr,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final formularioPreguntasResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                'Formulario de ${(PreguntasCall.departamento(
                  formularioPreguntasResponse.jsonBody,
                ) as List).map<String>((s) => s.toString()).toList().first}',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              actions: [
                wrapWithModel(
                  model: _model.cerrarModel,
                  updateCallback: () => setState(() {}),
                  child: CerrarWidget(),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'QUEREMOS ESUCHARTE',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Text(
                                'Este formulario consta de cinco opciones de respuesta que van desde \"Totalmente en desacuerdo\" hasta \"Totalmente de acuerdo\" representadas por estrellas.',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FutureBuilder<ApiCallResponse>(
                                future: PreguntasCall.call(
                                  areaId: widget.codigoqr,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnPreguntasResponse =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Stack(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: PreguntasCall.call(
                                                      areaId: widget.codigoqr,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final columnPreguntasResponse =
                                                          snapshot.data!;
                                                      return Builder(
                                                        builder: (context) {
                                                          final preguntaVar = (PreguntasCall
                                                                      .preguntas(
                                                                columnPreguntasResponse
                                                                    .jsonBody,
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()
                                                                  ?.toList() ??
                                                              [];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: List.generate(
                                                                preguntaVar
                                                                    .length,
                                                                (preguntaVarIndex) {
                                                              final preguntaVarItem =
                                                                  preguntaVar[
                                                                      preguntaVarIndex];
                                                              return Text(
                                                                preguntaVarItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          PreguntasCall.call(
                                                        areaId: widget.codigoqr,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final columnPreguntasResponse =
                                                            snapshot.data!;
                                                        return Builder(
                                                          builder: (context) {
                                                            final preguntasVar = (PreguntasCall
                                                                        .preguntas(
                                                                  columnPreguntasResponse
                                                                      .jsonBody,
                                                                ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    ?.toList() ??
                                                                [];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: List.generate(
                                                                  preguntasVar
                                                                      .length,
                                                                  (preguntasVarIndex) {
                                                                final preguntasVarItem =
                                                                    preguntasVar[
                                                                        preguntasVarIndex];
                                                                return Expanded(
                                                                  child:
                                                                      StarWidget(
                                                                    key: Key(
                                                                        'Keykvi_${preguntasVarIndex}_of_${preguntasVar.length}'),
                                                                    starVar:
                                                                        2.0,
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<ApiCallResponse>(
                                    future: PreguntasCall.call(
                                      areaId: widget.codigoqr,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      final textPreguntasResponse =
                                          snapshot.data!;
                                      return Text(
                                        (PreguntasCall.idPreguntaN(
                                          textPreguntasResponse.jsonBody,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()[0]
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      );
                                    },
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: PreguntasCall.call(
                                      areaId: widget.codigoqr,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      final textPreguntasResponse =
                                          snapshot.data!;
                                      return Text(
                                        (PreguntasCall.idPreguntaN(
                                          textPreguntasResponse.jsonBody,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()[1]
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      );
                                    },
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: PreguntasCall.call(
                                      areaId: widget.codigoqr,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      final textPreguntasResponse =
                                          snapshot.data!;
                                      return Text(
                                        (PreguntasCall.idPreguntaN(
                                          textPreguntasResponse.jsonBody,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()[2]
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      );
                                    },
                                  ),
                                  Text(
                                    widget.starVar.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.9,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Stack(
                                      children: [
                                        Text(
                                          (PreguntasCall.preguntas(
                                            formularioPreguntasResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              .last,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Stack(
                                      children: [
                                        TextFormField(
                                          controller: _model.textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Comentario',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x77595959),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x77595959),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x77595959),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x77595959),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLines: 5,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FutureBuilder<ApiCallResponse>(
                                    future: PreguntaTextoCall.call(
                                      areaId: widget.codigoqr,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      final buttonPreguntaTextoResponse =
                                          snapshot.data!;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          _model.apiResultadoRespuestas =
                                              await RespuestasCall.call(
                                            respuestaTexto:
                                                _model.textController.text,
                                            codigo: 1999990,
                                            preguntaId:
                                                (PreguntaTextoCall.preguntaId(
                                              buttonPreguntaTextoResponse
                                                  .jsonBody,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()
                                                    .first
                                                    .toString(),
                                          );
                                          if ((_model.apiResultadoRespuestas
                                                  ?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Respuesta'),
                                                  content: Text(
                                                      'Se envió correctamente'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Respuesta'),
                                                  content: Text(
                                                      'No envió correctamente'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: 'Responder',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
