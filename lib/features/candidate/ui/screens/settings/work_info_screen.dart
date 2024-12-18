import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_search/presentation/presentation.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../../shared_features/ui/widgets/dropdown_component.dart';
import '../../../data/datasources/fake_user.dart';
import '../../../data/datasources/fake_works.dart';
import '../../../data/models/user.dart';
import '../../../data/models/work.dart';

class EditWorkInfoScreen extends StatefulWidget {
  EditWorkInfoScreen({Key? key}) : super(key: key);
  List<DropdownMenuItem<String>> workOptions = const [
    DropdownMenuItem(
      child: Text('Full Time'),
      value: "Full Time",
    ),
    DropdownMenuItem(
      child: Text('Part Time'),
      value: "Part Time",
    ),
  ];

  @override
  State<EditWorkInfoScreen> createState() => _EditWorkInfoScreenState();
}

class _EditWorkInfoScreenState extends State<EditWorkInfoScreen> {
  TextEditingController preferedTitleController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKeys = GlobalKey<FormState>();
  String? jobType;
  File? img;
  bool isLoading = false;
  bool isUpdating = false;
  bool isImageLoading = false;
  late List<Work> works;
  Image? profilePic;
  late User user;

  @override
  void initState() {
    super.initState();
    getAndSetData();
  }

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

  void getAndSetData() async {
    user = User.fromJson(currentUser);
    works = user.workSet ?? fakeWorks;
    // setState(() {
    //   isLoading = true;
    // });
    // prefs = await SharedPreferences.getInstance();
    // _userRepository = UserRepository();
    // List<Work> workSaved = await _userRepository.getWorkDetails();
    // String prof = await _userRepository.getProfileFromPreferences();
    // profilePic = _userRepository.imageFromBase64String(prof);
    // setState(() {
    //   isLoading = false;
    //   works = workSaved;
    //   isLoading = false;
    // });
  }

  void updateWorksInfo() async {
    setState(() {
      isUpdating = true;
    });
    // await _userRepository.updateInfo({"works": works});
    setState(() {
      isUpdating = false;
    });
    // Get.back();
    MotionToast.success(
      description: const Text("Education Records Updated"),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Professional Details"),
        centerTitle: true,
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
                "Edit Experience Records",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 25,
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
              isLoading
                  ? const CircularProgressIndicator()
                  : Form(
                      child: _workSetContainer(),
                      key: formKeys,
                    ),
              MyButton(
                  label: "Update Info",
                  isUpdating: isUpdating,
                  onTap: () {
                    if (formKeys.currentState!.validate()) {
                      updateWorksInfo();
                      // Get.back();
                    }
                  }),
              const SizedBox(height: 25),
            ],
          )),
    );
  }

  Widget _workSetContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Work Experience(s)",
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addWorkControl();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: works.length,
          itemBuilder: (context, index) {
            return Column(children: [
              workUi(index),
            ]);
          },
          separatorBuilder: (context, index) => const Divider(),
        )
      ],
    );
  }

  Widget workUi(int index) {
    return Row(children: [
      Flexible(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Work ${index + 1}",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: index > 0,
                          child: ElevatedButton(
                            onPressed: () {
                              removeWorkControl(index);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                Text(
                                  'Remove',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(children: [
                      Flexible(
                        child: getTextField(
                          "Job Title",
                          works[index].job_title!,
                          (value) {
                            setState(
                              () {
                                works[index].job_title = value;
                              },
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: getTextField(
                          "Company Name",
                          works[index].company!,
                          (value) {
                            setState(
                              () {
                                works[index].company = value;
                              },
                            );
                          },
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    getTextField(
                      "Work Location",
                      works[index].company_location ?? "",
                      (value) {
                        setState(
                          () {
                            works[index].company_location = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownComponent(
                      items: widget.workOptions,
                      valueHolder: works[index].work_type,
                      onChanged: (value) {
                        setState(
                          () {
                            works[index].work_type = value;
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getDateField(
                          "Start Date",
                          works[index].startDate!.split("T")[0],
                          (value) {
                            setState(
                              () {
                                works[index].startDate = value;
                              },
                            );
                          },
                        ),
                        getDateField("End Date", works[index].endDate!.split("T")[0], (value) {
                          setState(
                            () {
                              works[index].endDate = value;
                            },
                          );
                        }, finalDate: works[index].startDate!),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    ]);
  }

  Widget getTextField(String label, String initialValue, Function onChanged) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: (value) {
          onChanged(value.toString());
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }

  getDateField(String label, String initialValue, Function onChanged, {String finalDate = ""}) {
    List<String> finalDateArr = [];
    bool isFinalDate = false;
    if (finalDate != "") {
      finalDateArr = finalDate.split("-");
      isFinalDate = true;
    }
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: isFinalDate
                  ? DateTime(int.parse(finalDateArr[0]), int.parse(finalDateArr[1]), int.parse(finalDateArr[2]))
                  : DateTime(1900),
              lastDate: DateTime(2050),
            ).then((value) {
              if (value != null) {
                onChanged(value.toString().split(" ")[0]);
              }
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label), // <-- Text
              const SizedBox(
                width: 2,
              ),
              const Icon(
                // <-- Icon
                Icons.calendar_month,
                size: 15.0,
              ),
            ],
          ),
        ),
        Text(initialValue),
      ],
    );
  }

  void addWorkControl() {
    setState(() {
      works.add(
          Work(job_title: "", company: "", company_location: "", work_type: "Part Time", startDate: "", endDate: ""));
    });
  }

  void removeWorkControl(int index) {
    setState(() {
      if (works.length > 1) {
        works.removeAt(index);
      }
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 4),
          height: MediaQuery.of(context).size.height * 0.32,
          child: Column(
            children: [
              Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
              ),
              const Spacer(),
              _bottomSheetButton(
                label: "Open Camera",
                context: context,
                onTap: () {
                  _loadImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                clr: AppColors.primaryOrange,
              ),
              _bottomSheetButton(
                label: "Open Gallery",
                context: context,
                onTap: () {
                  _loadImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                clr: Colors.red[300]!,
              ),
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
                clr: Colors.transparent,
              ),
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
