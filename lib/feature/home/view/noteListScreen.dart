import 'package:doodleblue_interview_by_pritesh/data/response/result.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteState.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/view/addAndEditNoteScreen.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appIcons.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appRoute.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonWidgets.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:doodleblue_interview_by_pritesh/utils/intExtensions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/toastMessages.dart';
import 'package:doodleblue_interview_by_pritesh/utils/widgetExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {

  final List<String> filterStatusList = [ALL, COMPLETE, INCOMPLETE];
  String? filterStatusValue;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              if (state is NoteLoading) {
                return appLoader();
              } else if (state is NoteSuccess){
                if(state.todos.isNotEmpty){
                  return _buildBody(context, state.todos);
                } else {
                  return genericErrorWidget(error: NotFoundError());
                }
              } else if (state is NoteError) {
                return genericErrorWidget(error: state.errorType);
              } else {
                return genericErrorWidget(error: GenericError());
              }
            }
        ).center(),

        _buildAddNoteButton(context)
      ],
    );
  }

  Widget _buildBody(BuildContext context, List<NoteModel> data){
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.all(safeAreaPadding),
      child: Column(
        children: [
          BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              final currentFilter = state is NoteSuccess ? state.filter : ALL;
              return commonDropdown(
                title: AppString.label.filter,
                hintText: AppString.label.selectFilter,
                decoration: commonInputDecoration(fillColor: Colors.white),
                dropDownList: filterStatusList.map((label) => DropdownMenuItem(
                  value: label,
                  child: Text(label, style: AppTextStyle.body),
                )).toList(),
                dropdownValue: currentFilter,
                onChanged: (value) {
                  context.read<NoteBloc>().add(UpdateFilter(value!));
                },
              );
            },
          ),
          20.height,

          BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              if (state is NoteLoading) {
                return appLoader();
              } else if (state is NoteSuccess) {
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  mainAxisSpacing: safeAreaPadding,
                  crossAxisSpacing: safeAreaPadding,
                  itemCount: state.filteredTodos.length,
                  itemBuilder: (context, index) {
                    return _buildNoteBody(state.filteredTodos[index]);
                  },
                );
              } else if (state is NoteError) {
                return genericErrorWidget(error: state.errorType);
              } else {
                return genericErrorWidget(error: GenericError());
              }
            },
          ).expand(),
        ],
      ),
    );
  }



  Widget _buildNoteBody(NoteModel note){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(commonRoute(AddAndEditNoteScreen(note: note))).then((onValue){
          if(onValue != null){
            if(onValue == DELETE){
              ToastMessages.success(message: AppString.label.noteDeleteSuccessfully);
            }
            if(onValue == UPDATE){
              ToastMessages.success(message: AppString.label.noteUpdateSuccessfully);
            }
          }
        });
      },
      child: Material(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(commonRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, maxLines: 2,style: AppTextStyle.body1),
            5.height,
            Text(note.description, maxLines: 4, overflow: TextOverflow.ellipsis, style: AppTextStyle.body3GreyColor),
            10.height,
            Text(note.isCompleted ? COMPLETE : INCOMPLETE , maxLines: 2, style: note.isCompleted ?  AppTextStyle.h5.copyWith(color: Colors.green) : AppTextStyle.h5.copyWith(color: Colors.red)),
          ],
        ).paddingAll(commonPadding),
      ),
    );
  }

  Widget _buildAddNoteButton(BuildContext context){
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(createRoute(AddAndEditNoteScreen())).then((onValue){
            if(onValue != null){
              ToastMessages.success(message: AppString.label.noteAddedSuccessfully);
            }
          });
        },
        backgroundColor: Colors.white,
        child : SvgPicture.asset(AppIcons.svg.add),
      ).paddingOnly(bottom: 50, right: safeAreaPadding),
    );
  }


}
