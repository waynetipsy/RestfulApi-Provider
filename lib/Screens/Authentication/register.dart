import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapi_provider/Provider/AuthProvider/auth_provider.dart';
import '../../Utils/snack_message.dart';
import './login.dart';
import 'package:restapi_provider/Widgets/text_field.dart';
import 'package:restapi_provider/Widgets/button.dart';
import 'package:restapi_provider/Utils/routers.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();


  @override
  void dispose() {
    _email.clear();
    _password.clear();
    _firstName.clear();
    _lastName.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
            child: Column(
              children: [

               customTextField(
                 title: 'FistName',
                 controller: _firstName,
                hint: 'Enter your valid email address'
               ),

               customTextField(
                 title: 'LastName',
                 controller: _lastName,
                hint: 'Enter your valid email address'
               ),

               customTextField(
                 title: 'Email',
                 controller: _email,
                hint: 'Enter your valid email address'
               ),

               customTextField(
                 title: 'Password',
                 controller: _password,
                 hint: 'Enter your password',
                ),

                  Consumer<AuthenticationProvider>(
                 builder: (context, auth, child) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    if (auth.resMessage != '') {
                       showMessage(
                      message: auth.resMessage, context: context
                       );
                       auth.clear();
                    }
                  });
                   return customButton(
                     text: 'Register',
                     tap: () {
                       if (_email.text.isEmpty || 
                        _password.text.isEmpty ||
                        _firstName.text.isEmpty ||
                        _lastName.text.isEmpty) {
                     showMessage(message: "All fields are required",
                        context: context);

                       } else {
                         auth.registerUser(
                           firstName: _firstName.text.trim(),
                           lastName: _lastName.text.trim(),
                           email: _email.text.trim(), 
                           password: _password.text.trim(),
                           context: context,
                          );
                       }
                     },
               
               context: context,  
                status: auth.isLoading,
                   );
                 }
                ),
               const SizedBox(height: 10,
                ),
                GestureDetector(
                  onTap: () {
              PageNavigator(ctx: context).nextPage(
                page: const LoginPage());
          
                  },
                  child: Text('Login Instead')
                )
               ]
              ),
            ),
          )
        ],
      ),
    );
  }
}