// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_application_1/core/theme/app_colors.dart';
// import 'package:flutter_application_1/core/theme/app_gradients.dart';
// import 'package:flutter_application_1/core/theme/app_text_styles.dart';

// class GradientHeader extends StatelessWidget {
//   final String title;
//   final Widget? leading;
//   final Widget? trailing;
//   final double height;
//   final EdgeInsetsGeometry? padding;
//   final bool showSkyline;
//   final String? backgroundAsset;

//   const GradientHeader({
//     super.key,
//     required this.title,
//     this.leading,
//     this.trailing,
//     this.height = 120,
//     this.padding,
//     this.showSkyline = true,
//     this.backgroundAsset,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height.h,
//       width: double.infinity,
//       padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
//       decoration: BoxDecoration(
//         gradient: AppGradients.header,
//       ),
//       child: Stack(
//         children: [
//           if (backgroundAsset != null)
//             Positioned.fill(
//               child: Opacity(
//                 opacity: 0.18,
//                 child: Image.asset(
//                   backgroundAsset!,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           if (showSkyline)
//             Positioned(
//               left: 0,
//               right: 0,
//               top: 0,
//               child: Opacity(
//                 opacity: 0.12,
//                 child: Container(
//                   height: 45.h,
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//           SafeArea(
//             bottom: false,
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 40.w,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: leading,
//                   ),
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: Text(
//                       title,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyles.semiBold25.copyWith(
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 40.w,
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: trailing,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
