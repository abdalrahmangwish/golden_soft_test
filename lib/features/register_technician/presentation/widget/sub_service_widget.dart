import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/extention/context_extension.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';

class MyPopup extends StatefulWidget {
  const MyPopup({super.key, required this.onItemSelected, required this.subCategory});
  final Function(List<SubCategoryEntity>) onItemSelected;
  final List<SubCategoryEntity> subCategory ;
  @override
  MyPopupState createState() => MyPopupState();
}

class MyPopupState extends State<MyPopup> {
  List<SubCategoryEntity> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Container(
        width: context.width(0.5),
        constraints: BoxConstraints(
          maxHeight: context.height(0.2),
        ),
        child: ListView.builder(
          itemCount: widget.subCategory.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              activeColor: ColorManager.primaryColor,
              title: Text(widget.subCategory[index].name?.ar ?? ""),
              value: selectedItems.contains(widget.subCategory[index]),
              onChanged: (bool? value) {
                setState(() {
                  if (value != null) {
                    if (value) {
                      selectedItems.add(widget.subCategory[index]);
                    } else {
                      selectedItems.remove(widget.subCategory[index]);
                    }
                  }
                });
              },
            );
          },
        ),
      ),
      actions:  [
        Center(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primaryColor),

            ),
            onPressed: () {
              widget.onItemSelected(selectedItems);
              print('$selectedItems');
              Navigator.of(context).pop();
            },
            child: const Text('إضافة',style: TextStyle(color: ColorManager.white),),
          ),
        ),
      ],
    );
  }
}
