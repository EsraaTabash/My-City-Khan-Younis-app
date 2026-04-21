// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_application_1/core/theme/app_colors.dart';
// import 'package:flutter_application_1/core/theme/app_text_styles.dart';

// class CommonListItem extends StatelessWidget {
//   final String title;
//   final VoidCallback? onTap;
//   final Widget? leading;
//   final Widget? trailing;
//   final EdgeInsetsGeometry? margin;
//   final double height;
//   final Color? backgroundColor;
//   final Border? border;

//   const CommonListItem({
//     super.key,
//     required this.title,
//     this.onTap,
//     this.leading,
//     this.trailing,
//     this.margin,
//     this.height = 52,
//     this.backgroundColor,
//     this.border,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: margin ?? EdgeInsets.only(bottom: 12.h),
//       decoration: BoxDecoration(
//         color: backgroundColor ?? AppColors.white,
//         borderRadius: BorderRadius.circular(10.r),
//         border: border,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 6,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(10.r),
//           child: SizedBox(
//             height: height.h,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 14.w),
//               child: Row(
//                 children: [
//                   leading ??
//                       Icon(
//                         Icons.chevron_left,
//                         color: AppColors.textSecondary,
//                         size: 26.sp,
//                       ),
//                   SizedBox(width: 12.w),
//                   Expanded(
//                     child: Text(
//                       title,
//                       textAlign: TextAlign.right,
//                       style: AppTextStyles.regular20,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   SizedBox(width: 12.w),
//                   trailing ?? const SizedBox.shrink(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
