// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../../core/utils/app_colors.dart';


class LoadingMessageListWidget extends StatelessWidget {
   LoadingMessageListWidget({super.key});
  List<bool> fakingMessages = [true,false,false,false,true,true,true,false,true,true];
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        decoration:    const BoxDecoration(
          color: kLightBlueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius:  const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child:Padding(
            padding:  const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                  Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                  children: [
                  Row(
                  mainAxisAlignment:
                  fakingMessages[index]? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                  Container(
                  padding: const EdgeInsets.all(10),
                  width:MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                  color: const Color(0xFFF2F0F3),
                  borderRadius: BorderRadius.only(
                  bottomRight:  Radius.circular(fakingMessages[index]? 12 : 0),
                  bottomLeft:  const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  topLeft: Radius.circular(fakingMessages[index] ? 0 : 12),
                  )),
                  child:    Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 20,
                    decoration: BoxDecoration(
                        color: const Color(0xFFDFDDDF),
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ).animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 1200.ms, color:  kDarkBlueColor.withAlpha(10))
                      .animate() // this wraps the previous Animate in another Animate
                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                      .slide(),
                  ).animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 1200.ms, color:  kDarkBlueColor.withAlpha(10))
                      .animate() // this wraps the previous Animate in another Animate
                      .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                      .slide(),
                  ],
                  ),
                  Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                  mainAxisAlignment:
                  fakingMessages[index]? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color(0xFFDFDDDF),
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ).animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1200.ms, color:  kDarkBlueColor.withAlpha(10))
                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                        .slide(),
                  ],
                  ),
                  )
                  ],
                  ),
                  )


                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
