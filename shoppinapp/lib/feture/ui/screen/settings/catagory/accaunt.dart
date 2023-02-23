import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Accaunt extends StatefulWidget {
  const Accaunt({super.key});

  @override
  State<Accaunt> createState() => _AccauntState();
}

class _AccauntState extends State<Accaunt> {
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;

  void takePhoto(ImageSource source) async {
    final picedFile = await _picker.pickImage(source: source);
    setState(() {
      imageFile = picedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: imageProfile(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 50,
                width: 200,
                color: Colors.black45,
                child: const Text("pasayev.nemet@gmail.com"),
              )
            ],
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          const Text(
            "bottomSheetText",
            style: TextStyle(fontSize: 20),
          ).tr(),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                child: const Icon(Icons.camera),
              ),
              FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                child: const Icon(Icons.image),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: imageFile == null
                ? const AssetImage(
                    "assets/Image_not_available.png",
                  )
                : FileImage(
                    File(
                      imageFile?.path ?? " ",
                    ),
                  ) as ImageProvider,
            radius: 80.r,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
              child: Icon(
                Icons.camera,
                color: Colors.white,
                size: 32.r,
              ),
            ),
          )
        ],
      ),
    );
  }
}
