import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/utils/app_colors.dart';


class VideoSelectorWidget extends StatefulWidget {
  const VideoSelectorWidget({super.key, required this.chooseAnotherVideo, required this.deleteVideo, required this.videoPlayerController});
  final VoidCallback chooseAnotherVideo;
  final VoidCallback deleteVideo;
  final VideoPlayerController videoPlayerController;


  @override
  State<VideoSelectorWidget> createState() => _VideoSelectorWidgetState();
}

class _VideoSelectorWidgetState extends State<VideoSelectorWidget> {
  String timePlay = "0:0";
  Timer? timer;
  bool showReplayIcon = false;
  bool showController = false;
  bool showPlayButton = true;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => renewTimeText());
    widget.videoPlayerController.addListener(() {
      checkVideo();
    }) ;


  }

  void checkVideo(){
    if (! widget.videoPlayerController.value.isPlaying && widget.videoPlayerController.value.isInitialized &&
        ( widget.videoPlayerController.value.duration == widget.videoPlayerController.value.position)) { //checking the duration and position every time
      showController=false;
      showPlayButton=false;
      showReplayIcon = true;
      setState(() {

      });
    }

  }
  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    timer?.cancel();
    super.dispose();
  }
  showingController(){
    showController = true;
    setState(() {

    });
    Future.delayed(const Duration(seconds: 10), () {

      showController = false;
      if( !widget.videoPlayerController.value.isPlaying && !showReplayIcon){
        showPlayButton = true;
        setState(() {

        });
      }
      setState(() {
        // Here you can write your code for open new view
      });

    });
  }
  renewTimeText()async{
    var time = await  widget.videoPlayerController.position;
    timePlay = "${time?.inMinutes}:${time?.inSeconds}";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
            child: SizedBox(
                child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              showingController();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FittedBox(
                                fit: BoxFit.contain, // Set BoxFit to cover the entire container
                                child: SizedBox(
                                    height: Get.height * 0.19,
                                    width: Get.width * 0.9,

                                    child: VideoPlayer( widget.videoPlayerController)),
                              ),
                            ),
                          ),


                          showController?Positioned(
                              top: Get.width*0.1,
                              left: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: Get.width*0.65,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Container(
                                        height: Get.height*0.07,
                                        width: Get.width*0.13,
                                        decoration:  BoxDecoration(
                                          color: Colors.black.withOpacity(0.50),
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 2),
                                              blurRadius: 6,
                                              color: Colors.black12,
                                            ),
                                          ],
                                        ),

                                        child: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: (){
                                              showingController();
                                              widget.videoPlayerController.seekTo(Duration(
                                                  seconds:  widget.videoPlayerController.value.position.inSeconds - 10));
                                            }, icon: const Icon(Icons.fast_forward,color: Colors.white,)),
                                      ),
                                      Container(
                                        height: Get.height*0.07,
                                        width: Get.width*0.13,
                                        decoration:  BoxDecoration(
                                          color: Colors.black.withOpacity(0.50),
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 2),
                                              blurRadius: 6,
                                              color: Colors.black12,
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: (){
                                              if( widget.videoPlayerController.value.isPlaying){
                                                widget.videoPlayerController.pause();
                                                showingController();
                                                setState(() {

                                                });
                                              }else{
                                                widget.videoPlayerController.play();
                                                showingController();
                                                setState(() {

                                                });
                                              }
                                            }, icon:  widget.videoPlayerController.value.isPlaying?const Icon(Icons.pause,color: Colors.white,):const Icon(Icons.play_arrow,color: Colors.white,)),
                                      ),
                                      Container(
                                        height: Get.height*0.07,
                                        width: Get.width*0.13,
                                        decoration:  BoxDecoration(
                                          color: Colors.black.withOpacity(0.50),
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 2),
                                              blurRadius: 6,
                                              color: Colors.black12,
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: (){
                                              showingController();
                                              widget.videoPlayerController.seekTo(Duration(
                                                  seconds:  widget.videoPlayerController.value.position.inSeconds + 10));
                                            }, icon: const Icon(Icons.fast_rewind,color: Colors.white,)),
                                      ),

                                    ],
                                  ),
                                ),
                              )):const SizedBox(),
                          showReplayIcon?InkWell(
                            onTap: (){
                              showReplayIcon = false;
                              showController = true;
                              widget.videoPlayerController.seekTo(Duration.zero);
                              widget.videoPlayerController.play();
                              setState(() {
                              });
                            },
                            child: Center(
                              child: AspectRatio(
                                aspectRatio:   widget.videoPlayerController.value.aspectRatio,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: Get.height*0.1,
                                      width: Get.width*0.2,
                                      decoration:  BoxDecoration(
                                        color: Colors.black.withOpacity(0.50),
                                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 6,
                                            color: Colors.black12,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.replay,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ):const SizedBox(),
                          showPlayButton?InkWell(
                            onTap: (){
                              showPlayButton = false;
                              widget.videoPlayerController.play();
                              showingController();
                              setState(() {

                              });
                            },
                            child: Center(
                              child: AspectRatio(
                                aspectRatio:   widget.videoPlayerController.value.aspectRatio,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: Get.height*0.1,
                                      width: Get.width*0.2,
                                      decoration:  BoxDecoration(
                                        color: Colors.black.withOpacity(0.50),
                                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 6,
                                            color: Colors.black12,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ):const SizedBox(),
                        ],
                      ),
                    )
                ))),

        Positioned(
          top: 5,
          left: 5,
          child: InkWell(
            onTap: (){
              widget.chooseAnotherVideo();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:kDarkBlueColor
              ),
              child: const Center(
                child: Icon(Icons.edit,color: kWhiteColor,),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child:InkWell(
            onTap: (){
              widget.deleteVideo();
            },

            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:kDarkBlueColor
              ),
              child: const Center(
                child: Icon(Icons.delete_outline,color: kWhiteColor,),
              ),
            ),
          ),

        ),

      ],
    );
  }
}
