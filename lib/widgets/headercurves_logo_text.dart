import 'dart:typed_data';

import 'package:chat/pages/my_profile.dart';
import 'package:chat/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class HeaderMultiCurvesImage extends StatelessWidget {
  final Color color;

  final ui.Image image;

  final bool isEmpty;
  final double height;

  HeaderMultiCurvesImage(
      {@required this.color,
      this.image,
      this.isEmpty = false,
      this.height = 1.8});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: size.width / this.height,
            child: (isEmpty)
                ? HeaderMultiCurves(
                    color: currentTheme.scaffoldBackgroundColor,
                  )
                : CustomPaint(
                    painter: _HeaderTwoCurvesPainterImage(
                        color: this.color, opacity: 1.0, image: this.image))),
        /*  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
            
          ],
        )
 */
        /*      Container(
          padding: EdgeInsets.only(top: 40, left: 275),
          child: StyledLogo(),
        ), */
      ],
    );
  }
}

class HeaderMultiCurvesImageEmptyText extends StatelessWidget {
  final Color color;

  final ui.Image image;

  final bool isEmpty;
  final double height;
  final String title;
  final String subtitle;

  HeaderMultiCurvesImageEmptyText(
      {@required this.color,
      this.image,
      this.isEmpty = false,
      this.height = 3.0,
      this.title = "",
      this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: size.height / this.height,
            child: (isEmpty)
                ? HeaderMultiCurves(
                    color: currentTheme.scaffoldBackgroundColor,
                  )
                : CustomPaint(
                    painter: _HeaderTwoCurvesPainterImage(
                        color: this.color, opacity: 1.0, image: this.image))),
        Container(
          padding: EdgeInsets.only(top: size.height / 5, left: 50),
          child: Text(
            this.title,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: size.height / 6, left: 50),
          child: Text(
            this.subtitle,
            style: TextStyle(
                fontSize: 19,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
        ),

        /*      Container(
          padding: EdgeInsets.only(top: 40, left: 275),
          child: StyledLogo(),
        ), */
      ],
    );
  }
}

class HeaderMultiCurves extends StatelessWidget {
  final Color color;

  HeaderMultiCurves({@required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: size.height / 3.5,
            child: CustomPaint(
                painter:
                    _HeaderTwoCurvesPainter(color: this.color, opacity: 1.0))),

        /*      Container(
          padding: EdgeInsets.only(top: 40, left: 275),
          child: StyledLogo(),
        ), */
      ],
    );
  }
}

class HeaderCurvesText extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  HeaderCurvesText(
      {@required this.color, @required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 270,
          child: CustomPaint(
              painter:
                  _HeaderTwoCurvesPainter(color: this.color, opacity: 1.0)),
        ),
        Container(
          padding: EdgeInsets.only(top: 150, left: 20),
          child: Text(
            this.title,
            style: TextStyle(
                fontSize: 32,
                color: Colors.black87,
                fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 190, left: 22),
          child: Text(
            this.subtitle,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class StyledLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Icon(
                  Icons.place_sharp,
                  size: 32,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  flex: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Logo',
                          style:
                              TextStyle(fontSize: 24, color: Colors.black)))),
            ]));
  }
}

class _HeaderTwoCurvesPainterImage extends CustomPainter {
  final Color color;
  final double opacity;
  final ui.Image image;

  _HeaderTwoCurvesPainterImage(
      {@required this.color, @required this.opacity, this.image});

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // var rect = Offset.zero & size;

/*     pencil.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffF5E40A),
        Color(0xffEFD40B),
        Color(0xffBE9109),
      ],
    ).createShader(rect); */
    // properties
/*     pencil.color = this.color.withOpacity(opacity);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 20; */

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(0, size.height * 0.99);
    //path.lineTo(size.width, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.20, size.height * 1.0,
        size.width * 0.5, size.height * 0.99);
    path.quadraticBezierTo(
        size.width * 0.99, size.height * 0.99, size.width, size.height * 0.99);
    path.lineTo(size.width, 0);

    canvas.drawPath(
        path,
        pencil
          ..shader = ImageShader(image, TileMode.mirror, TileMode.mirror,
              Float64List.fromList(Matrix4.identity().scaled(0.5).storage))
          ..style = PaintingStyle.fill);

    //canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _HeaderTwoCurvesPainter extends CustomPainter {
  final Color color;
  final double opacity;

  _HeaderTwoCurvesPainter({@required this.color, @required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    var rect = Offset.zero & size;

    pencil.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [this.color, this.color, this.color],
    ).createShader(rect);
    // properties
    pencil.color = this.color.withOpacity(opacity);
    pencil.style = PaintingStyle.fill; // .stroke = bordes, .fill = relleno
    pencil.strokeWidth = 20;

    final path = new Path();

    // Dibujar con path y el pencil

    path.lineTo(0, size.height * 0.90);
    //path.lineTo(size.width, size.height * 0.25);

    path.quadraticBezierTo(size.width * 0.30, size.height * 1.1,
        size.width * 0.5, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.70, size.width, size.height * 0.90);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderMultiCurvesText extends StatelessWidget {
  final Color color;
  final String subtitle;
  final String title;

  HeaderMultiCurvesText(
      {@required this.color, @required this.subtitle, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 270,
            child: CustomPaint(
                painter:
                    _HeaderTwoCurvesPainter(color: this.color, opacity: 0.80))),
        Container(
            width: double.infinity,
            height: 220,
            child: CustomPaint(
                painter:
                    _HeaderTwoCurvesPainter(color: this.color, opacity: 1.0))),
        Container(
            width: double.infinity,
            height: 290,
            child: CustomPaint(
                painter:
                    _HeaderTwoCurvesPainter(color: this.color, opacity: 0.1))),
        /*      Container(
          padding: EdgeInsets.only(top: 40, left: 275),
          child: StyledLogo(),
        ), */
        Container(
          padding: EdgeInsets.only(top: 200, left: 20),
          child: Text(
            this.title,
            style: TextStyle(
                fontSize: 40,
                color: Colors.black87,
                fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 150, left: 20),
          child: Text(
            this.subtitle,
            style: TextStyle(
                fontSize: 19,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

Route createRouteMyProfile() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyProfilePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.fastLinearToSlowEaseIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 700),
  );
}
