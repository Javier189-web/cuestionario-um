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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        RatingBar.builder(
          onRatingUpdate: (newValue) =>
              setState(() => _model.ratingBarValue = newValue),
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
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.apiResultxb0 = await RespuestasCall.call(
              codigo: 1999987,
              preguntaId: '3de98f8a-788f-4382-b9e2-3c8bda630a81',
              respuestaTexto: 'holeeee',
              respuestaNumero: '1',
            );
            if ((_model.apiResultxb0?.succeeded ?? true)) {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('yes'),
                    content: Text('yes'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
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
                    title: Text('f'),
                    content: Text('f'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }

            setState(() {});
          },
          child: Text(
            _model.ratingBarValue.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ),
      ],
    );
  }
}
