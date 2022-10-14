import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../core/constants/assets.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import '../main/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _firstPartController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _firstPartAnimation = CurvedAnimation(
    parent: _firstPartController,
    curve: Curves.fastLinearToSlowEaseIn,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final getIt = GetIt.instance;
        await getIt.allReady();

        _firstPartController.addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) =>
                        getIt.get<NewsListCubit>()..fetchAllNews(),
                    child: const MainPage(),
                  ),
                ),
              );
            }
          },
        );

        _firstPartController.forward();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _firstPartAnimation,
            child: Center(
              child: SvgPicture.asset(
                AppIcons.qasid,
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstPartController.dispose();
    super.dispose();
  }
}
