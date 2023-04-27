import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'formulario_model.dart';
export 'formulario_model.dart';

class FormularioWidget extends StatefulWidget {
  const FormularioWidget({
    Key? key,
    this.codigoqr,
  }) : super(key: key);

  final String? codigoqr;

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
                '¡QUEREMOS ESCUCHARTE!',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    buttonSize: 48.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            'Este formulario consta de cinco opciones de respuesta que van desde \"Totalmente en desacuerdo\" hasta \"Totalmente de acuerdo\" representadas por los números del 1 al 5.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 871.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 1.0,
                                child: Stack(
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
                                        final columnPreguntasResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final preguntas =
                                                (PreguntasCall.preguntas(
                                                      columnPreguntasResponse
                                                          .jsonBody,
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList() ??
                                                    [];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: List.generate(
                                                  preguntas.length,
                                                  (preguntasIndex) {
                                                final preguntasItem =
                                                    preguntas[preguntasIndex];
                                                return Text(
                                                  preguntasItem,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                );
                                              }),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.01, 0.0),
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
                                              final pregunta =
                                                  (PreguntasCall.preguntas(
                                                        columnPreguntasResponse
                                                            .jsonBody,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: List.generate(
                                                    pregunta.length,
                                                    (preguntaIndex) {
                                                  final preguntaItem =
                                                      pregunta[preguntaIndex];
                                                  return Text(
                                                    'Hello World',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  );
                                                }),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
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
        );
      },
    );
  }
}
