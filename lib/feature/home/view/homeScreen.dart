import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/addAndEditNoteScreen.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/mobileDevicesListScreen.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/noteListScreen.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appIcons.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appRoute.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:doodleblue_interview_by_pritesh/utils/tabbarDelegate.dart';
import 'package:doodleblue_interview_by_pritesh/utils/toastMessages.dart';
import 'package:doodleblue_interview_by_pritesh/utils/widgetExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              headerWidget(context),
              buildTabBar(context),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              MobileDeviceScreen(), // Placeholder
              NotesListScreen(), // Placeholder
            ],
          ),
        ),
      ),
    );
  }

  buildTabBar(BuildContext context){
    return SliverPersistentHeader(
      pinned: true,
      delegate: TabBarDelegate(
        TabBar(
          automaticIndicatorColorAdjustment: true,
          controller: _tabController,
          padding: EdgeInsets.zero,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primaryColor,
          dividerColor: Colors.transparent,
          labelStyle: AppTextStyle.h5,
          tabs: [
            Tab(text: AppString.label.mobiles),
            Tab(text: AppString.label.notes),
          ],
          onTap: (i){
            if(i == 0){
              context.read<MobileDevicesBloc>().add(LoadMobileDevices());
            }
            if(i == 1){
              context.read<NoteBloc>().add(LoadNotes());
            }
          },
        ),
      ),
    );
  }

  headerWidget(BuildContext context){
    return SliverAppBar(
      elevation: 0.0,
      pinned: false,
      centerTitle: true,
      stretch: false,
      expandedHeight: 80,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Text("Hi, there!!", style: AppTextStyle.h2).paddingAll(safeAreaPadding)

          ],
        ),
      ),
    );
  }




}
