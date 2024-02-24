import 'package:ecommerce_getx/core/view_model/profile_view_model.dart';
import 'package:ecommerce_getx/view/auth/login_screen.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SafeArea(
                child: Container(
                    child: Column(
                  children: [
                                              SizedBox(height: 30,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  image: DecorationImage(
                                      image: controller.userModel == null
                                          ? AssetImage(
                                                  'images/man-icon-png-5.png')
                                              as ImageProvider<Object>
                                          : controller.userModel!.pic ==
                                                      'default' ||
                                                  controller.userModel!.pic ==
                                                      null ||
                                                  controller
                                                      .userModel!.pic!.isEmpty
                                              ? AssetImage(
                                                      'images/man-icon-png-5.png')
                                                  as ImageProvider<Object>
                                              : NetworkImage(controller
                                                      .userModel!.pic!)
                                                  as ImageProvider<Object>,
                                      fit: BoxFit.fill))),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel!.name!,
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              CustomText(
                                text: controller.userModel!.email!,
                                color: Colors.black,
                                fontSize: 15,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Edit Profile',
                            fontSize: 20,
                          ),
                          leading: Icon(Icons.edit),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Shipping Address',
                            fontSize: 20,
                          ),
                          leading: Icon(Icons.location_on_sharp),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Order History',
                            fontSize: 20,
                          ),
                          leading: Icon(Icons.history),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Cards',
                            fontSize: 20,
                          ),
                          leading: Icon(Icons.payment),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Notifications',
                            fontSize: 20,
                          ),
                          leading: Icon(Icons.notifications),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {
                          controller.signOut();
                          Get.offAll(LoginScreen());
                        },
                        child: ListTile(
                          title: CustomText(
                            text: 'Log Out',
                            fontSize: 20,
                          ),
                          leading: Icon(Icons.exit_to_app),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    )
                  ],
                )),
              ),
            ),
    );
  }
}
