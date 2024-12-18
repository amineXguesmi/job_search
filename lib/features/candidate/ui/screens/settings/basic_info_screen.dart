import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_search/features/candidate/data/datasources/fake_user.dart';
import 'package:job_search/presentation/presentation.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../../shared_features/ui/widgets/dropdown_component.dart';
import '../../../../shared_features/ui/widgets/text_component.dart';
import '../../../data/models/user.dart';

class EditBasicInfoScreen extends StatefulWidget {
  const EditBasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditBasicInfoScreen> createState() => _EditBasicInfoScreenState();
}

class _EditBasicInfoScreenState extends State<EditBasicInfoScreen> {
  bool isLoading = false;
  bool isUpdating = false;
  bool isImageLoading = false;
  late String _imageUrl;
  late User user;
  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController phoneController;
  String? genderType;
  Image? profilePic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndSetDate();
  }

  void updateBasicInfo(User user) async {
    setState(() {
      isUpdating = true;
    });
    // await _userRepository.updateInfo({
    //   "firstName": user.firstName,
    //   "lastName": user.lastName,
    //   "phone": user.phone,
    //   "gender": user.gender
    // });
    // setState(() {
    //   isUpdating = false;
    // });
    Navigator.pop(context);
    MotionToast.success(
      description: const Text("Basic Info Updated"),
    ).show(context);
  }

  void getAndSetDate() async {
    setState(() {
      isLoading = true;
    });

    user = User.fromJson(currentUser);

    setState(() {
      isLoading = false;
      firstnameController = TextEditingController(text: user.firstName);
      lastnameController = TextEditingController(text: user.lastName);
      phoneController = TextEditingController(text: user.phone);
      genderType = user.gender;
      isLoading = false;
    });
  }

  final formKeys = GlobalKey<FormState>();

  File? img;

  List<DropdownMenuItem<String>> genderOptions = const [
    DropdownMenuItem(
      child: Text('Male'),
      value: "Male",
    ),
    DropdownMenuItem(
      child: Text('Female'),
      value: "Female",
    ),
    DropdownMenuItem(
      child: Text('Others'),
      value: "Others",
    ),
  ];

  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        File uploadImage = File(image.path);
        bool? success = true;

        if (success == true) {
          img = File(image.path);
          // final bytes = img!.readAsBytesSync();
          // user = await _userRepository.getBasicUserDetails();
          // await _userRepository
          //     .saveProfileToPreferences(_userRepository.base64String(bytes));
          setState(
            () {
              img = File(image.path);
              profilePic = Image.file(img!);
            },
          );
          Navigator.pop(context);
          MotionToast.success(
            description: const Text("Profile Picture Updated"),
          ).show(context);
        } else {
          MotionToast.error(
            description: const Text("Profile Picture Update Failed"),
          ).show(context);
        }
      } else {
        print("No image selected");
        return;
      }
    } catch (e) {
      print(e);
      debugPrint("Failed to pick image $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10)),
                        ],
                        image: DecorationImage(
                            image:
                                profilePic != null ? profilePic!.image : Image.asset("assets/images/profile.jpg").image,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryOrange,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _showBottomSheet(context);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                key: formKeys,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    const SizedBox(height: 15),
                    Row(children: [
                      Flexible(
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : TextFieldGenerator(
                                label: "First Name",
                                controller: firstnameController,
                                keyboardType: TextInputType.text,
                                validatorText: "First Name is required",
                              ),
                      ),
                      Flexible(
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : TextFieldGenerator(
                                label: "Last Name",
                                controller: lastnameController,
                                keyboardType: TextInputType.text,
                                validatorText: "Last Name is required",
                              ),
                      )
                    ]),
                    const SizedBox(height: 15),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : DropdownComponent(
                            items: genderOptions,
                            valueHolder: user.gender,
                            value: genderType,
                            onChanged: (value) {
                              setState(
                                () {
                                  user.gender = value;
                                  genderType = value;
                                },
                              );
                            },
                          ),
                    const SizedBox(height: 15),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : TextFieldGenerator(
                            label: "Phone Number",
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            validatorText: "Phone Number is required",
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                  label: "Update Info",
                  isUpdating: isUpdating,
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      user.firstName = firstnameController.text;
                      user.lastName = lastnameController.text;
                      user.phone = phoneController.text;
                      user.gender = genderType;
                      // _userRepository.storeBasicUserDetails(user);
                      updateBasicInfo(user);
                    }
                  })
            ],
          )),
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 4),
          height: MediaQuery.of(context).size.height * 0.32,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
              ),
              const Spacer(),
              _bottomSheetButton(
                  label: "Open Camera",
                  context: context,
                  onTap: () {
                    _loadImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  clr: AppColors.primaryOrange),
              _bottomSheetButton(
                  label: "Open Gallery",
                  context: context,
                  onTap: () {
                    _loadImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  clr: Colors.red[300]!),
              const SizedBox(
                height: 20,
              ),
              _bottomSheetButton(
                  label: "Close",
                  context: context,
                  isClose: true,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  clr: Colors.transparent),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      required BuildContext context,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: isClose == true ? Colors.transparent : clr,
          border: Border.all(
            width: 2,
            color: isClose == true ? Colors.grey[200]! : clr,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isClose ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
