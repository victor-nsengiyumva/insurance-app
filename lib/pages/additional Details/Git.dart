import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/pages/app_pages/payment.dart';
import 'package:insurease/styles/colors.dart';
import 'package:intl/intl.dart';

import '../../tools/button.dart';
import '../../tools/major_font.dart';

class GIT extends StatefulWidget {
  const GIT({super.key});

  @override
  State<GIT> createState() => _GITState();
}

class _GITState extends State<GIT> {
  final TextEditingController _productCode = TextEditingController();
  final TextEditingController _customerRef = TextEditingController();
  final TextEditingController _paymentType = TextEditingController();
  final TextEditingController _policyStartDate = TextEditingController();
  final TextEditingController _assetValue = TextEditingController();
  final TextEditingController _tripFrequency = TextEditingController();
  final TextEditingController _tripsPerDay = TextEditingController();
  final TextEditingController _pickUpLocation = TextEditingController();
  final TextEditingController _dropOffLocation = TextEditingController();

  bool codeIsEmpty = false;
  bool refIsEmpty = false;
  bool payIsEmpty = false;
  bool dateIsEmpty = false;
  bool assetIsEmpty = false;
  bool loanIsEmpty = false;
  bool installIsEmpty = false;
  bool natureIsEmpty = false;
  bool businessIsEmpty = false;

  shownotification() {
    Fluttertoast.showToast(
        msg: 'Fill all the fields',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.h,
        backgroundColor: AppColors.whiteColor,
        title: MajorFont(
          text: 'Additional details',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(top: 30.h, left: 30.w, right: 20.w, bottom: 30.h),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2.r,
                  blurRadius: 2.r,
                  // changes position of shadow
                ),
              ],
              color: AppColors.containerColor,
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          height: 1070.h,
          width: 300.w,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _productCode,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Product Code',
                    weight: false,
                    size: 15,
                  )
                      //hintText: 'username',

                      ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _customerRef,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Customer ref',
                    weight: false,
                    size: 15,
                  )
                      //hintText: 'Email',

                      ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  obscureText: true,
                  controller: _paymentType,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Payment type',
                    weight: false,
                    size: 15,
                  )),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _policyStartDate,
                  decoration: InputDecoration(
                    // errorText: codeIsEmpty ? 'This field is required' : null,
                    label: MajorFont(
                      text: 'Policy Start Date',
                      weight: false,
                      size: 15,
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2020), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        _policyStartDate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _assetValue,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Amount insured',
                    weight: false,
                    size: 15,
                  )
                      //hintText: 'username',

                      ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _tripFrequency,
                  decoration: InputDecoration(
                    // errorText: codeIsEmpty ? 'This field is required' : null,
                    label: MajorFont(
                      text: 'Trip frequency',
                      weight: false,
                      size: 15,
                    ),

                    hintText: 'Single or Recurring',
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _tripsPerDay,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Trips per day',
                    weight: false,
                    size: 15,
                  )
                      //hintText: 'username',

                      ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _pickUpLocation,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Pickup location',
                    weight: false,
                    size: 15,
                  )
                      //hintText: 'username',

                      ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.h),
                child: TextField(
                  style: TextStyle(color: AppColors.blackColor),
                  controller: _dropOffLocation,
                  decoration: InputDecoration(
                      // errorText: codeIsEmpty ? 'This field is required' : null,
                      label: MajorFont(
                    text: 'Drop off location',
                    weight: false,
                    size: 15,
                  )
                      //hintText: 'username',

                      ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(top: 20.h),
                  child: InkWell(
                      child: Button(text: 'Submit'),
                      onTap: () {
                        setState(() {
                          _productCode.text.isEmpty
                              ? codeIsEmpty = true
                              : codeIsEmpty = false;
                          _customerRef.text.isEmpty
                              ? refIsEmpty = true
                              : refIsEmpty = false;
                          _paymentType.text.isEmpty
                              ? payIsEmpty = true
                              : payIsEmpty = false;
                          _policyStartDate.text.isEmpty
                              ? dateIsEmpty = true
                              : dateIsEmpty = false;
                          _assetValue.text.isEmpty
                              ? assetIsEmpty = true
                              : assetIsEmpty = false;
                          _tripFrequency.text.isEmpty
                              ? loanIsEmpty = true
                              : loanIsEmpty = false;
                          _tripFrequency.text.isEmpty
                              ? installIsEmpty = true
                              : installIsEmpty = false;
                          _pickUpLocation.text.isEmpty
                              ? natureIsEmpty = true
                              : natureIsEmpty = false;
                          _dropOffLocation.text.isEmpty
                              ? businessIsEmpty = true
                              : businessIsEmpty = false;
                        });
                        bool somefalse = codeIsEmpty ||
                            refIsEmpty ||
                            payIsEmpty ||
                            dateIsEmpty ||
                            assetIsEmpty ||
                            loanIsEmpty ||
                            installIsEmpty ||
                            natureIsEmpty ||
                            businessIsEmpty;

                        somefalse
                            ? {
                                setState(
                                  () {
                                    shownotification();
                                  },
                                ),
                              }
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment()));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






//  how to validate password.
// final confirmPassword = TextFormField(
//   controller: widget.confirmPasswordController,
//   obscureText: true,
//   decoration: InputDecoration(
//     prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
//     hintText: 'Confirm Password',
//     errorText: validatePassword(widget.confirmPasswordController.text),
//     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//   ),
// );

// String validatePassword(String value) {
//   if (!(value.length > 5) && value.isNotEmpty) {
//     return "Password should contain more than 5 characters";
//   }
//   return null;
// }