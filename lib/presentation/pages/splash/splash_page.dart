import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/constants/assets.dart';
import '../../bloc/news_list/news_list_cubit.dart';
import '../main/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final audioPlayer = AudioPlayer();

  late final AnimationController _firstPartController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _firstPartAnimation = CurvedAnimation(
    parent: _firstPartController,
    curve: Curves.easeIn,
  );

  late final AnimationController _secondPartController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..forward();

  late final Animation<double> _secondPartAnimation = CurvedAnimation(
    parent: _secondPartController,
    curve: Curves.easeIn,
  );

  final _firstText = 'Sən yarımın qasidisən';
  final _secondText = 'Əylən sənə çay demişəm...';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        audioPlayer.setAsset('assets/qasid.mp3');
        audioPlayer.play();

        audioPlayer.processingStateStream.listen(
          (state) {
            if (state == ProcessingState.completed) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return BlocProvider(
                      create: (_) =>
                          GetIt.I.get<NewsListCubit>()..fetchAllNews(),
                      child: const MainPage(),
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              AppIcons.qasid,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: _firstPartAnimation,
            child: Text(_firstText),
          ),
          const SizedBox(height: 5),
          FadeTransition(
            opacity: _secondPartAnimation,
            child: Text(_secondText),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _firstPartController.dispose();
    _secondPartController.dispose();
    super.dispose();
  }
}
