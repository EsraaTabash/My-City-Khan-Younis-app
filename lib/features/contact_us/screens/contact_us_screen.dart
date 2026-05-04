import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_application_1/features/contact_us/widgets/supervisors_map_view.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../data/contact_mock_data.dart';
import '../widgets/contact_tab_bar.dart';
import '../widgets/message_card.dart';
import '../widgets/supervisor_card.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  int selectedIndex = 0;
  late final PageController _pageController;

  final tabs = const ['رسائلي', 'المشرفون'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SafeArea(
          bottom: false,
          child: Column(
            textDirection: TextDirection.rtl,
            children: [
              AppHeader(
                title: 'تواصل معنا',
                onBackTap: () => Navigator.pop(context),
              ),

              ContactTabBar(
                tabs: tabs,
                selectedIndex: selectedIndex,
                onChanged: _changeTab,
              ),

              Expanded(
                child: PageView(
                  controller: _pageController,
                  reverse: false,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: const [_MessagesView(), _SupervisorsView()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessagesView extends StatelessWidget {
  const _MessagesView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(top: 10.h),
              itemCount: contactMessagesMockData.length,
              separatorBuilder: (_, __) => SizedBox(height: 15.h),
              itemBuilder: (_, index) {
                return MessageCard(item: contactMessagesMockData[index]);
              },
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 14.h),
            child: SizedBox(
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.newMessage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF079BEE),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  '+     رسالة جديدة',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Bahij',
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SupervisorsView extends StatefulWidget {
  const _SupervisorsView();

  @override
  State<_SupervisorsView> createState() => _SupervisorsViewState();
}

class _SupervisorsViewState extends State<_SupervisorsView> {
  int selectedSupervisorIndex = 0;

  void _selectSupervisor(int index) {
    setState(() {
      selectedSupervisorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedSupervisor = supervisorsMockData[selectedSupervisorIndex];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Column(
            children: [
              SupervisorsMapView(
                supervisors: supervisorsMockData,
                selectedIndex: selectedSupervisorIndex,
                onSupervisorSelected: _selectSupervisor,
              ),

              Expanded(child: Container(color: Colors.white)),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 300.h,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    width: 38.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      selectedSupervisor.location,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Bahij',
                        color: const Color(0xFF4F5BD5),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 14.h),

                  Expanded(
                    child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.all(10.w),
                      itemCount: supervisorsMockData.length,
                      separatorBuilder: (_, __) {
                        return Divider(
                          height: 20.h,
                          thickness: 1,
                          color: const Color(0xFFEDEDED),
                        );
                      },
                      itemBuilder: (context, index) {
                        final item = supervisorsMockData[index];

                        return InkWell(
                          onTap: () {
                            _selectSupervisor(index);
                          },
                          child: SupervisorCard(item: item),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Center(
                    child: SizedBox(
                      width: 260.w,
                      height: 50.h,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/images/icon26.svg",
                          color: Colors.white,
                          width: 22.sp,
                        ),
                        label: Text(
                          'الاتصال برقم الطوارئ (115)',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'Bahij',
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD9188D),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
