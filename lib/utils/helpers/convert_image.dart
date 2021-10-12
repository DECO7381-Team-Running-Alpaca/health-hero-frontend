import 'package:flutter/material.dart';

class ConvertImage extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const ConvertImage({
    @required this.builder,
    Key key,
  }) : super(key: key);

  @override
   ConvertImageState createState() =>  ConvertImageState();
}

class  ConvertImageState extends State <ConvertImage> {
  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}