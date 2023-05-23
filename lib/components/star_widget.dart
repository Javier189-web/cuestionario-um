import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'star_model.dart';
export 'star_model.dart';

class StarWidget extends StatefulWidget {
  const StarWidget({
    Key? key,
    this.starVar,
  }) : super(key: key);

  final double? starVar;

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
          initialRating: _model.ratingBarValue ??= widget.starVar!,
          unratedColor: FlutterFlowTheme.of(context).accent3,
          itemCount: 5,
          itemSize: 30.0,
          glowColor: FlutterFlowTheme.of(context).tertiary,
        ),
        Text(
          _model.ratingBarValue.toString(),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ],
    );
  }
}
