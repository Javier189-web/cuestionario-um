import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'star_model.dart';
export 'star_model.dart';

class StarWidget extends StatefulWidget {
  const StarWidget({Key? key}) : super(key: key);

  @override
  _StarWidgetState createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  late StarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: PreguntasCall.call(
        areaId: FFAppState().idAreaQr,
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
        final columnPreguntasResponse = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FutureBuilder<ApiCallResponse>(
              future: FFAppState().polo(
                requestFn: () => RespuestasCall.call(
                  respuestaNumero: _model.ratingBarValue?.toString(),
                ),
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
                final ratingBarRespuestasResponse = snapshot.data!;
                return RatingBar.builder(
                  onRatingUpdate: (newValue) async {
                    setState(() => _model.ratingBarValue = newValue);
                    setState(() {
                      FFAppState().numStar = _model.ratingBarValue!;
                    });
                    _model.apiResult12f = await RespuestasCall.call(
                      codigo: 999998,
                      respuestaNumero: FFAppState().numStar.toString(),
                      preguntaId: (PreguntasCall.idPreguntaN(
                        columnPreguntasResponse.jsonBody,
                      ) as List)
                          .map<String>((s) => s.toString())
                          .toList()
                          .first
                          .toString(),
                    );
                    if (!(_model.apiResult12f?.succeeded ?? true)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('f'),
                            content: Text('f'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    setState(() {});
                  },
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  direction: Axis.horizontal,
                  initialRating: _model.ratingBarValue ??= 1.0,
                  unratedColor: FlutterFlowTheme.of(context).accent3,
                  itemCount: 5,
                  itemSize: 30.0,
                  glowColor: FlutterFlowTheme.of(context).tertiary,
                );
              },
            ),
            Text(
              FFAppState().idAreaQr,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ],
        );
      },
    );
  }
}
