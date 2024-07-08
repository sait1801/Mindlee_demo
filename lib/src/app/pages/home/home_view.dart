import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:mindlee_demo/src/app/constants.dart';
import 'package:mindlee_demo/src/app/pages/home/home_controller.dart';
import 'package:mindlee_demo/src/app/pages/home/widgets/footer_buttons.dart';
import 'package:mindlee_demo/src/app/pages/home/widgets/header_buttons.dart';
import 'package:mindlee_demo/src/app/pages/home/widgets/scrollable_cards.dart';

class HomeView extends View {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(
      HomeController(),
    );
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget get view {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, controller) {
        return Scaffold(
          key: globalKey,
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: backgroundGradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/background_image_demo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    const HeaderButtons(),
                    const Divider(
                      color: Color.fromRGBO(236, 239, 243, 0.1),
                    ),
                    ScrollableCards(
                      messages: controller.messages,
                      controller: controller,
                    ),
                    const FooterButtons(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
