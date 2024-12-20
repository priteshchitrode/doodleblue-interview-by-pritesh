import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteBloc.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/bloc/noteBloc/noteEvent.dart';
import 'package:doodleblue_interview_by_pritesh/feature/home/model/todoModel.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appApplicationBar.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appButton.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appIcons.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appString.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextField.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/commonWidgets.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/constantGlobalVariables.dart';
import 'package:doodleblue_interview_by_pritesh/utils/customLog.dart';
import 'package:doodleblue_interview_by_pritesh/utils/intExtensions.dart';
import 'package:doodleblue_interview_by_pritesh/utils/widgetExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAndEditNoteScreen extends StatefulWidget {
  final NoteModel? note;
  const AddAndEditNoteScreen({super.key, this.note});

  @override
  State<AddAndEditNoteScreen> createState() => _AddAndEditNoteScreenState();
}

class _AddAndEditNoteScreenState extends State<AddAndEditNoteScreen> {

  final formKey = GlobalKey<FormState>();

  final titleTextController = TextEditingController();
  final msgTextController = TextEditingController();

  final titleFocusNode = FocusNode();
  final msgFocusNode = FocusNode();

  final List<String> filterStatusList = [INCOMPLETE, COMPLETE];
  String?  filterStatusValue = INCOMPLETE;

  bool isCompleted = false;

  @override
  void initState() {
    // TODO: implement initState
    initFunction();
    super.initState();
  }

  void initFunction() => WidgetsBinding.instance.addPostFrameCallback((callback){
    if(widget.note != null){
      CustomLog.debug(this, "${widget.note!.isCompleted}");
      titleTextController.text = widget.note!.title;
      msgTextController.text = widget.note!.description;
      filterStatusValue = widget.note!.isCompleted ? COMPLETE : INCOMPLETE;
      isCompleted = widget.note!.isCompleted;
      setState(() {});
    }
  });

goBack(BuildContext context, String slag) => WidgetsBinding.instance.addPostFrameCallback((callback) {
    Navigator.pop(context, slag);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppApplicationBar(
        title: AppString.label.add,
        actions: [
          if(widget.note != null)
          _buildEditButton(context),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildSaveButton(context, widget.note),
    );
  }

  Widget _buildBody(){
    return SafeArea(
      minimum: EdgeInsets.all(safeAreaPadding),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AppTextField(
              controller: titleTextController,
              currentFocus: titleFocusNode,
              nextFocus: msgFocusNode,
              labelText: AppString.label.title,
            ),
            20.height,

            AppTextField(
              controller: msgTextController,
              currentFocus: msgFocusNode,
              maxLines: 5,
              labelText: AppString.label.message,
            ),
            20.height,

            commonDropdown(
              title: AppString.label.taskStatus,
              decoration: commonInputDecoration(
                fillColor: Colors.white
              ),
              dropDownList: filterStatusList.map((label) => DropdownMenuItem(
                value: label,
                child: Text(label, style: AppTextStyle.body),
              )).toList(),
              dropdownValue: filterStatusValue,
              onChanged: (value){
                debugPrint("value : $value");
                 filterStatusValue = value!;

                 if(filterStatusValue == COMPLETE){
                   isCompleted = true;
                 }

              },

            ),

          ],
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context){
    return  IconButton(
      onPressed: () async {
        context.read<NoteBloc>().add(DeleteNote(widget.note!.id!));
        goBack(context, DELETE);
      },
      icon: SvgPicture.asset(AppIcons.svg.delete, colorFilter: AppColors.svg(Colors.red)),
    ).paddingRight(10);
  }

  Widget _buildSaveButton(BuildContext context, NoteModel? note){
    return AppButton(
        title: AppString.label.save,
        onPressed: () async {
          if(formKey.currentState!.validate()){
            if(note != null){
              context.read<NoteBloc>().add(UpdateNote(
                  NoteModel(
                      id: note.id,
                      title: titleTextController.text,
                      description: msgTextController.text,
                      isCompleted: isCompleted,
                  ),
              ));
              goBack(context, UPDATE);
            } else {
              context.read<NoteBloc>().add(AddNote(
                NoteModel(
                  title: titleTextController.text,
                  description:  msgTextController.text,
                  isCompleted: isCompleted,
                ),
              ));
              goBack(context, ADD);
            }

          }
        },
    ).bottomNavigationPadding();
  }

}
