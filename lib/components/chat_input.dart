import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_application/components/network_image_picker_sheet.dart';

class ChatInputWidget extends StatefulWidget {
  final void Function(String) onSubmit;
  const ChatInputWidget({super.key, required this.onSubmit});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final textFieldController = TextEditingController();

  String _selectedImageUrl = "";
  void onImageSelected(String imageUrl) {
    setState(() {
      _selectedImageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return NetworkImagePickerBottomSheet(
                    onImageSelected: (value) {
                      // make sure the bottomSheet opened
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                        onImageSelected(value);
                      }
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  if (_selectedImageUrl.isNotEmpty)
                    Expanded(
                      child: Container(
                        margin: EdgeInsetsGeometry.only(top: 10),
                        child: Image.network(_selectedImageUrl),
                      ),
                    ),
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    // u have to add a maxLines property else it will not do that
                    // animation where the input gets bigger
                    maxLines: 5,
                    controller: textFieldController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'type a message...',
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // send the value to the parent
              widget.onSubmit(textFieldController.text);
              log("sending ${textFieldController.text} to the backend!");
              setState(() {
                textFieldController.text = "";
                _selectedImageUrl = "";
              });
            },
            icon: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
