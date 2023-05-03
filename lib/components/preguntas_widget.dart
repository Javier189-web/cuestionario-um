import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preguntas_model.dart';
export 'preguntas_model.dart';

class PreguntasWidget extends StatefulWidget {
  const PreguntasWidget({
    Key? key,
    this.codigoqr,
  }) : super(key: key);

  final String? codigoqr;

  @override
  _PreguntasWidgetState createState() => _PreguntasWidgetState();
}

class _PreguntasWidgetState extends State<PreguntasWidget> {
  late PreguntasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreguntasModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<ApiCallResponse>(
            future: PreguntasCall.call(
              areaId: 'a2d5f012-1e28-4fe6-8f2c-3b4c50e0bc26',
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
              final textPreguntasResponse = snapshot.data!;
              return Text(
                textPreguntasResponse.jsonBody.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              );
            },
          ),
          RatingBar.builder(
            onRatingUpdate: (newValue) =>
                setState(() => _model.ratingBarValue = newValue),
            itemBuilder: (context, index) => Icon(
              Icons.star_rounded,
              color: FlutterFlowTheme.of(context).secondary,
            ),
            direction: Axis.horizontal,
            initialRating: _model.ratingBarValue ??= 3.0,
            unratedColor: FlutterFlowTheme.of(context).accent2,
            itemCount: 5,
            itemSize: 40.0,
            glowColor: FlutterFlowTheme.of(context).secondary,
          ),
        ],
      ),
    );
  }
}
