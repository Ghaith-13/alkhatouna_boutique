// ignore_for_file: must_be_immutable

import 'package:alkhatouna/Locale/app_localization.dart';
import 'package:alkhatouna/core/extensions/padding_extensions.dart';
import 'package:alkhatouna/core/utils/app_colors.dart';
import 'package:alkhatouna/core/utils/app_constant.dart';
import 'package:alkhatouna/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:alkhatouna/services/youtube_video_player/src/player/youtube_player.dart';
import 'package:alkhatouna/services/youtube_video_player/src/utils/youtube_player_controller.dart';
import 'package:alkhatouna/services/youtube_video_player/src/utils/youtube_player_flags.dart';
import 'package:alkhatouna/services/youtube_video_player/src/widgets/duration_widgets.dart';
import 'package:alkhatouna/services/youtube_video_player/src/widgets/playback_speed_button.dart';
import 'package:alkhatouna/services/youtube_video_player/src/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({super.key});

  @override
  State<TutorialsScreen> createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().gettutorials(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppConstant.customAppBar(
            context,
            "Tutorials videos",
            true,
            withTranslate: true,
            IconColor: AppColors.blackColor,
            backgroundColor: Colors.white,
            elvation: 0,
          ),
          body: state.loadingArticles
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Column(
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 300.h,
                              ),
                            )),
                        20.ph,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 300.h,
                              ),
                            )),
                        20.ph,
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.sp),
                              child: Container(
                                color: Colors.black,
                                width: 1.sw,
                                height: 300.h,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              : state.tutorial == null
                  ? Center(
                      child: Column(
                      children: [
                        Lottie.asset('assets/images/empty_data.json'),
                        Text(
                          "Sorry, there are no videos.".tr(context),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                      ],
                    ))
                  : state.tutorial!.length == 0
                      ? Center(
                          child: Column(
                          children: [
                            Lottie.asset('assets/images/empty_data.json'),
                            Text(
                              "Sorry, there are no videos.".tr(context),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ],
                        ))
                      : ListView.builder(
                          itemCount: state.tutorial!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(15.sp),
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.tutorial![index].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.sp),
                                  ),
                                  10.ph,
                                  ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: YouTubePlayer(
                                          url: state.tutorial![index].link ??
                                              "")),
                                ],
                              ),
                            );
                          },
                        ),
        );
      },
    );
  }
}

class YouTubePlayer extends StatefulWidget {
  String url;
  YouTubePlayer({super.key, required this.url});

  @override
  State<YouTubePlayer> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? "",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        // disableDragSeek: false,
        // loop: false,
        // isLive: false,
        forceHD: false,
        // enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
        const PlaybackSpeedButton()
      ],
    );
  }
}
