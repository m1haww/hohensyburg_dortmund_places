// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SignUp extends StatefulWidget {
//   final GridEventsList event;

//   const SignUp({super.key, required this.event});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   Route? route;
//   bool _isSaveEnabled = false;

//   final TextEditingController _headingcontroler = TextEditingController();
//   final TextEditingController _descriptioncontroler = TextEditingController();
//   final TextEditingController _datecontroler = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _headingcontroler.addListener(_updateSaveButtonState);
//     _descriptioncontroler.addListener(_updateSaveButtonState);
//     _datecontroler.addListener(_updateSaveButtonState);
//   }

//   @override
//   void dispose() {
//     _headingcontroler.dispose();
//     _descriptioncontroler.dispose();
//     _datecontroler.dispose();
//     super.dispose();
//   }

//   void _updateSaveButtonState() {
//     setState(() {
//       _isSaveEnabled =
//           _headingcontroler.text.isNotEmpty &&
//           _descriptioncontroler.text.isNotEmpty &&
//           _datecontroler.text.isNotEmpty ;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               width: width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.grey.shade200,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.event.title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Sf",
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     widget.event.description,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: "Sf",
//                       color: Color(0xff999999),
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//             buildheight(context, 0.02),
//             buildContainerDate(
//               context,
//               _selectedDate,
//               () => _showCupertinoDatePicker(context),
//             ),
//             buildheight(context, 0.02),
//             buildInput(
//               context,
//               "Phone Number",
//               Colors.black,
//               Colors.white,
//               Color(0xff999999),
//               controller: _numbercontroler,
//             ),
//             buildheight(context, 0.02),
//             buildInput(
//               context,
//               "Name",
//               Colors.black,
//               Colors.white,
//               Color(0xff999999),
//               controller: _namecontroler,
//             ),
//             buildheight(context, 0.02),
//             buildInputBig(
//               context,
//               "Comment",
//               Colors.black,
//               Colors.white,
//               Color(0xff999999),
//               controller: _commentcontroler,
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap:
//                   _isSaveEnabled
//                       ? () {
//                         final provider = Provider.of<AppProvider>(
//                           context,
//                           listen: false,
//                         );

//                         final newSignup = Signup(
//                           date:
//                               _selectedDate != null
//                                   ? DateFormat(
//                                     'yyyy-MM-dd',
//                                   ).format(_selectedDate!)
//                                   : 'Not selected',
//                           name: _namecontroler.text,
//                           number: _numbercontroler.text,
//                           comment: _commentcontroler.text,
//                         );

//                         provider.addSignup(newSignup);

//                         print(
//                           "Signup added: ${newSignup.name}, ${newSignup.number}, ${newSignup.comment}, ${newSignup.date}",
//                         );

//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder:
//                                 (context) => SignSuccesfully(
//                                   selectedDate: _selectedDate!,
//                                   event: widget.event,
//                                 ),
//                           ),
//                         );
//                       }
//                       : () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text(
//                               "Please complete all required fields.",
//                               style: TextStyle(fontFamily: "Sf"),
//                             ),
//                             backgroundColor: Color(0xffE5182B),
//                           ),
//                         );
//                         print(
//                           "Form is incomplete. Name: ${_namecontroler.text}, Number: ${_numbercontroler.text}, Comment: ${_commentcontroler.text}",
//                         );
//                       },
//               child: buildSaveButton(context, "Save"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
