import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/mobileDevicesBloc/mobileDevicesState.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/mobileDevicesModel.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonWidgets.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:doodleblue_interview_by_pritesh/utils/intExtensions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/widgetExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MobileDeviceScreen extends StatefulWidget {
  const MobileDeviceScreen({super.key});

  @override
  State<MobileDeviceScreen> createState() => _MobileDeviceScreenState();
}

class _MobileDeviceScreenState extends State<MobileDeviceScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileDevicesBloc, MobileDevicesState>(
        builder: (context, state) {
          if (state is MobileDevicesLoading) {
            return appLoader();
          } else if (state is MobileDevicesLoaded){
            if(state.devices.isNotEmpty){
              return _buildBody(context, state.devices);
            } else {
              return genericErrorWidget(error: NotFoundError());
            }
          } else if (state is MobileDevicesError) {
            return genericErrorWidget(error: state.errorType);
          } else {
            return genericErrorWidget(error: GenericError());
          }
        }
    ).center();
  }

  Widget _buildBody(BuildContext context, List<MobileDevicesModel> data){
    return SafeArea(
      bottom: false,
      child: RefreshIndicator(
        onRefresh: () async {
          data.clear();
          context.read<MobileDevicesBloc>().add(LoadMobileDevices());
        },
        child: MasonryGridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(safeAreaPadding),
          mainAxisSpacing: safeAreaPadding,
          crossAxisSpacing: safeAreaPadding,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildMobilesDevicesBody(data[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMobilesDevicesBody(MobileDevicesModel device){
    return Material(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(commonRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(device.name, maxLines: 2,style: AppTextStyle.body1),
          5.height,
          if(device.data != null)...[
            Text(device.data!.price, maxLines: 4, overflow: TextOverflow.ellipsis, style: AppTextStyle.body3GreyColor),
          ]

        ],
      ).paddingAll(commonPadding),
    );
  }


}
