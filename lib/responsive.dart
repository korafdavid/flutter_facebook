import 'package:flutter/widgets.dart';


class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen})
      : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return largeScreen;
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}


  bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1200 &&
        MediaQuery.of(context).size.width > 800;
  }



