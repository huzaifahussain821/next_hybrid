
// import '../utilities/app_exports.dart';

// class CustomDrawerWidget extends StatefulWidget {
//   const CustomDrawerWidget({super.key});

//   @override
//   State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
// }

// class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppThemes.black,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             30.verticalSpace,
//             Image.asset(
//               AppConstants.animatedAppLogo,
//               scale: 4.5,
//               color: AppThemes.white,
//             ),
//             20.verticalSpace,
//             ListView(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               padding: EdgeInsets.zero,
//               children: [
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.homeIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Home",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       Get.back();

//                       // Get.offAll(() => const DashboardView(),
//                       //     binding: DashboardBinding());
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.merchantIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Merchant",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       // Get.to(const MerchantListView(), binding: MerchantBindings());
//                     },
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 45,
//                 //   child: ListTile(
//                 //     leading: Image.asset(
//                 //       AssetsPath.tierDetailIcon,
//                 //       scale: 2.5,
//                 //     ),
//                 //     title: CustomTextWidget(
//                 //       text: "Tier Detail",
//                 //       fontWeight: FontWeight.w500,
//                 //       textSize: AppThemes.drawerTextSize(),
//                 //       textColor: AppThemes.white,
//                 //     ),
//                 //     onTap: () {
//                 //       // Get.to(const TierDetailView(), binding: TierDetailBinding());
//                 //     },
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.leaderboardIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Leaderboard",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {Get.to( LeaderboardView(), binding: LeaderboardBinding());},
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.crown,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Rewards Journey",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {Get.to( RewardsJourneyView(), binding: RewardsJourneyBinding());},
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.charityHistoryIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Charity History",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       Get.back();

//                       Get.to(const CharityHistoryScreen(), binding: CharityHistoryBindings());
//                     },
//                   ),
//                 ),
//                 // SizedBox(
//                 //   height: 45,
//                 //   child: ListTile(
//                 //     leading: Image.asset(
//                 //       AssetsPath.purchaseHistoryIcon,
//                 //       scale: 2.5,
//                 //     ),
//                 //     title: CustomTextWidget(
//                 //       text: "Purchase History",
//                 //       fontWeight: FontWeight.w500,
//                 //       textSize: AppThemes.drawerTextSize(),
//                 //       textColor: AppThemes.white,
//                 //     ),
//                 //     onTap: () {},
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 45,
//                 //   child: ListTile(
//                 //     leading: Image.asset(
//                 //       AssetsPath.purchaseHistoryIcon,
//                 //       scale: 2.5,
//                 //     ),
//                 //     title: CustomTextWidget(
//                 //       text: "Accounts",
//                 //       fontWeight: FontWeight.w500,
//                 //       textSize: AppThemes.drawerTextSize(),
//                 //       textColor: AppThemes.white,
//                 //     ),
//                 //     onTap: () {
//                 //       Get.to(PaymentMethodView(), binding: PaymentMethodBinding());
//                 //     },
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.paymentHistoryIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Payment History",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       Get.back();

//                       Get.to(const PaymentHistoryScreen(), binding: PaymentHistoryBindings());
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.profileDIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Profile",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       Get.back();

//                       Get.to(const ProfileEditProfileView(), binding: EditProfileBindings());
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.notificationIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Notification",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.drawerTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       Get.back();

//                       Get.to(const NotificationView(), binding: NotificationBindings());
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 45,
//                   child: ListTile(
//                     leading: Image.asset(
//                       AssetsPath.settingsIcon,
//                       scale: 2.5,
//                     ),
//                     title: CustomTextWidget(
//                       text: "Settings",
//                       fontWeight: FontWeight.w500,
//                       textSize: AppThemes.appBarTextSize(),
//                       textColor: AppThemes.white,
//                     ),
//                     onTap: () {
//                       Get.back();

//                       Get.to(const SettingView(), binding: SettingBindings());
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             ListTile(
//               leading: Image.asset(
//                 AssetsPath.logoutIcon,
//                 scale: 2.5,
//               ),
//               title: CustomTextWidget(
//                 text: "Sign Out",
//                 fontWeight: FontWeight.w500,
//                 textSize: AppThemes.drawerTextSize(),
//                 textColor: AppThemes.white,
//               ),
//               onTap: () {
//                 LoginController.to.logout({"fcmToken": "abc"});
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
