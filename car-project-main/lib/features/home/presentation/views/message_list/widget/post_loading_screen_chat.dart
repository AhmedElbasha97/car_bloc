import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/app_colors.dart';
class PostLoadingScreenChat extends StatelessWidget {
  const PostLoadingScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Container(
            color: kLightBlueColor,
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5,),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: Get.height * 0.13,
                            width: Get.width * 0.13,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFDFDDDF)

                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: Get.height * 0.11,
                                  width: Get.width * 0.11,
                                  decoration:  const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  Color(0xFFDFDDDF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kGrayColor,
                                        blurRadius: 2,
                                        offset:
                                        Offset(1, 1), // Shadow position
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                .slide(),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [

                                Container(
                                  height: Get.height * 0.015,
                                  width: Get.width * 0.25,
                                  decoration:   BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:  const Color(0xFFDFDDDF),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: kGrayColor,
                                        blurRadius: 2,
                                        offset:
                                        Offset(1, 1), // Shadow position
                                      ),
                                    ],

                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                    .animate() // this wraps the previous Animate in another Animate
                                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                    .slide(),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              height: Get.height * 0.015,
                              width: Get.width * 0.2,
                              decoration:   BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:  const Color(0xFFDFDDDF),
                                boxShadow: const [
                                  BoxShadow(
                                    color: kGrayColor,
                                    blurRadius: 2,
                                    offset:
                                    Offset(1, 1), // Shadow position
                                  ),
                                ],

                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                .slide(),
                            const SizedBox(height: 5,),
                            Container(
                              height: Get.height * 0.015,
                              width: Get.width * 0.3,
                              decoration:   BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:  const Color(0xFFDFDDDF),
                                boxShadow: const [
                                  BoxShadow(
                                    color: kGrayColor,
                                    blurRadius: 2,
                                    offset:
                                    Offset(1, 1), // Shadow position
                                  ),
                                ],

                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                .slide(),                                      ],
                        )
                      ],
                    ),
                    const Icon(Icons.keyboard_control_outlined,color: kDarkBlueColor,),                              ],
                ),
                Container(
                  height: Get.height * 0.015,
                  width: Get.width * 0.9,
                  decoration:   BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:  const Color(0xFFDFDDDF),
                    boxShadow: const [
                      BoxShadow(
                        color: kGrayColor,
                        blurRadius: 2,
                        offset:
                        Offset(1, 1), // Shadow position
                      ),
                    ],

                  ),
                ).animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                    .animate() // this wraps the previous Animate in another Animate
                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                    .slide(),
                const SizedBox(height: 5,),
                Container(
                  height: Get.height * 0.015,
                  width: Get.width * 0.9,
                  decoration:   BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:  const Color(0xFFDFDDDF),
                    boxShadow: const [
                      BoxShadow(
                        color: kGrayColor,
                        blurRadius: 2,
                        offset:
                        Offset(1, 1), // Shadow position
                      ),
                    ],

                  ),
                ).animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                    .animate() // this wraps the previous Animate in another Animate
                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                    .slide(),
                const SizedBox(height: 5,),
                Container(
                  height: Get.height * 0.015,
                  width: Get.width * 0.9,
                  decoration:   BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:  const Color(0xFFDFDDDF),
                    boxShadow: const [
                      BoxShadow(
                        color: kGrayColor,
                        blurRadius: 2,
                        offset:
                        Offset(1, 1), // Shadow position
                      ),
                    ],

                  ),
                ).animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                    .animate() // this wraps the previous Animate in another Animate
                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                    .slide(),
                const SizedBox(height: 5,),
                Container(
                  height: Get.height * 0.015,
                  width: Get.width * 0.5,
                  decoration:   BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:  const Color(0xFFDFDDDF),
                    boxShadow: const [
                      BoxShadow(
                        color: kGrayColor,
                        blurRadius: 2,
                        offset:
                        Offset(1, 1), // Shadow position
                      ),
                    ],

                  ),
                ).animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                    .animate() // this wraps the previous Animate in another Animate
                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                    .slide(),

                const SizedBox(height: 10,),
                Container(
                  width: Get.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        height: Get.height * 0.015,
                        width: Get.width * 0.2,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  const Color(0xFFDFDDDF),
                          boxShadow: const [
                            BoxShadow(
                              color: kGrayColor,
                              blurRadius: 2,
                              offset:
                              Offset(1, 1), // Shadow position
                            ),
                          ],

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                      Container(
                        height: Get.height * 0.015,
                        width: Get.width * 0.2,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  const Color(0xFFDFDDDF),
                          boxShadow: const [
                            BoxShadow(
                              color: kGrayColor,
                              blurRadius: 2,
                              offset:
                              Offset(1, 1), // Shadow position
                            ),
                          ],

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                      Container(
                        height: Get.height * 0.015,
                        width: Get.width * 0.2,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  const Color(0xFFDFDDDF),
                          boxShadow: const [
                            BoxShadow(
                              color: kGrayColor,
                              blurRadius: 2,
                              offset:
                              Offset(1, 1), // Shadow position
                            ),
                          ],

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Divider(
                  color: kYellowColor,
                  height: 1,
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                const SizedBox(height: 10,),
                Container(
                  width: Get.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        height: Get.height * 0.015,
                        width: Get.width * 0.2,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  const Color(0xFFDFDDDF),
                          boxShadow: const [
                            BoxShadow(
                              color: kGrayColor,
                              blurRadius: 2,
                              offset:
                              Offset(1, 1), // Shadow position
                            ),
                          ],

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                      Container(
                        height: Get.height * 0.015,
                        width: Get.width * 0.2,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  const Color(0xFFDFDDDF),
                          boxShadow: const [
                            BoxShadow(
                              color: kGrayColor,
                              blurRadius: 2,
                              offset:
                              Offset(1, 1), // Shadow position
                            ),
                          ],

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                      Container(
                        height: Get.height * 0.015,
                        width: Get.width * 0.2,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  const Color(0xFFDFDDDF),
                          boxShadow: const [
                            BoxShadow(
                              color: kGrayColor,
                              blurRadius: 2,
                              offset:
                              Offset(1, 1), // Shadow position
                            ),
                          ],

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Divider(
                  color: kYellowColor,
                  height: 1,
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                const SizedBox(height: 10,),
                Column(
                  children: [
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: Get.height * 0.07,
                          ),
                          width: Get.width*0.95,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:  InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.13,
                                    width: Get.width * 0.13,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFDFDDDF)

                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: Get.height * 0.11,
                                          width: Get.width * 0.11,
                                          decoration:  const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:  Color(0xFFDFDDDF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: kGrayColor,
                                                blurRadius: 2,
                                                offset:
                                                Offset(1, 1), // Shadow position
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: Get.width*0.75,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kDarkBlueColor,width: 2),
                                      color: Colors.white,
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.3,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.2,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                              const SizedBox(height: 5,),
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                              const SizedBox(height: 5,),
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                              const SizedBox(height: 5,),
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                            ],
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),Column(
                  children: [
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: Get.height * 0.07,
                          ),
                          width: Get.width*0.95,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:  InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.13,
                                    width: Get.width * 0.13,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFDFDDDF)

                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: Get.height * 0.11,
                                          width: Get.width * 0.11,
                                          decoration:  const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:  Color(0xFFDFDDDF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: kGrayColor,
                                                blurRadius: 2,
                                                offset:
                                                Offset(1, 1), // Shadow position
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: Get.width*0.75,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kDarkBlueColor,width: 2),
                                      color: Colors.white,
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.3,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.2,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),

                                              const SizedBox(height: 5,),
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                            ],
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),Column(
                  children: [
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: Get.height * 0.07,
                          ),
                          width: Get.width*0.95,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:  InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.13,
                                    width: Get.width * 0.13,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFDFDDDF)

                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: Get.height * 0.11,
                                          width: Get.width * 0.11,
                                          decoration:  const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:  Color(0xFFDFDDDF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: kGrayColor,
                                                blurRadius: 2,
                                                offset:
                                                Offset(1, 1), // Shadow position
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: Get.width*0.75,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kDarkBlueColor,width: 2),
                                      color: Colors.white,
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.3,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.2,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                              const SizedBox(height: 5,),
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.45,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),


                                            ],
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: Get.height * 0.07,
                          ),
                          width: Get.width*0.95,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:  InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: Get.height * 0.13,
                                    width: Get.width * 0.13,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFDFDDDF)

                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: Get.height * 0.11,
                                          width: Get.width * 0.11,
                                          decoration:  const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:  Color(0xFFDFDDDF),
                                            boxShadow: [
                                              BoxShadow(
                                                color: kGrayColor,
                                                blurRadius: 2,
                                                offset:
                                                Offset(1, 1), // Shadow position
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: Get.width*0.75,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kDarkBlueColor,width: 2),
                                      color: Colors.white,
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.3,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.2,
                                            decoration:   BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFFDFDDDF),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: kGrayColor,
                                                  blurRadius: 2,
                                                  offset:
                                                  Offset(1, 1), // Shadow position
                                                ),
                                              ],

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.9,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),
                                              const SizedBox(height: 5,),
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.45,
                                                decoration:   BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:  const Color(0xFFDFDDDF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: kGrayColor,
                                                      blurRadius: 2,
                                                      offset:
                                                      Offset(1, 1), // Shadow position
                                                    ),
                                                  ],

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                                  .slide(),


                                            ],
                                          ),
                                        )

                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kBlueColor.withAlpha(55))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}
