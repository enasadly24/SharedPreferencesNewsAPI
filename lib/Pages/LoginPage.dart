import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Model/Form_Model.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/Widget/full_button.dart';
import 'package:mvvm_buildrealproject/Widget/my_form_text_field.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyForm extends StatefulWidget {

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  final phone_controller = TextEditingController();
  SharedPreferences logindata;
  bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      /*Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => ListNews()));*/
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
  final _phone =RegExp(
      r'(^(?:[+0]9)?[0-9]{10,12}$)');
  final _Password =RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]{2})(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}$');
  final _FullName= RegExp('[a-zA-Z]');
/*  r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
      .{8,}             // Must be at least 8 characters in length
  $*/
  final _formKey= GlobalKey<FormState>();
  final model = FormModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.login),
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
          image: DecorationImage(
              image:AssetImage("Images/NewsPaper.jpg"),fit:BoxFit.fill),
        ),
        padding: EdgeInsets.all(40.0),
        /* width: double.infinity,
       height: 400,*/
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          MyFormTextField(
                            controller: username_controller,
                            isObscure: false,
                            decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "enter your name",
                              icon: Icon(Icons.person,color: Colors.pink),
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'please enter your Name';
                              }else if(!_FullName.hasMatch(value)){
                                return 'Invalide Name please enter char only';
                              }
                              return null;
                            },
                            onSaved: (value){
                              model.FullName=value;
                            },
                          ),
                          MyFormTextField(
                            controller: phone_controller,
                            isObscure: false,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              hintText: "enter your Phone Number",
                              icon: Icon(Icons.phone, color: Colors.pink,),
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'please enter your phone';
                              }else if(!_phone.hasMatch(value)){
                                return 'Invalide Phone number please enter numbers only';
                              }
                              return null;
                            },
                            onSaved: (value){
                              model.PhoneNumber=value;
                            },
                          ),
                          MyFormTextField(
                            controller: password_controller,
                            isObscure: true,
                            decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "enter your password",
                                icon: Icon(Icons.password,color: Colors.pink,)
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'please enter your password';
                              }else if(!_Password.hasMatch(value)){
                                return 'Invalid Password Number 1 upper case,1lowercase\n'
                                    '1 digit, 1 char, min 6 ,max 15';
                              }
                              return null;
                            },
                            onSaved: (value){
                              model.password=value;
                            },
                          ),
                          FormSubmitButton(
                            onPressed: (){
                              String username = username_controller.text;
                              String password = password_controller.text;
                              String phone=phone_controller.text;
                              // validate returns true if the form is valid , otherwise false
                              if(_formKey.currentState.validate()){
                                _formKey.currentState.save();
                                print(model);
                                Scaffold.of(_formKey.currentContext).showSnackBar(
                                    SnackBar(content: Text("Processing Data"),)
                                );
                              }
                              if(username!='' && password!=''&& phone!='')
                              {
                                print("Successful");
                                logindata.setBool('login', false);
                                logindata.setString('username', username);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>NewsList()));
                              }
                            },
                          )
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
