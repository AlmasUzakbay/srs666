import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nd_registerform/bloc/bloc1_bloc.dart';
import 'package:flutter_nd_registerform/generated/locale_keys.g.dart';
import 'package:flutter_nd_registerform/pages/user_info_page.dart';

class RegistrationUser extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationUser> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  User newUser = User();
  final List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final userData = {
        'personName': newUser.personName,
        'phoneNumber': newUser.phoneNumber,
        'country': newUser.country,
        'email': newUser.email,
        'life': newUser.life,
        'password': newUser.password,
      };

      BlocProvider.of<Bloc1Bloc>(context).add(RegisterUserEvent(userData));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<Bloc1Bloc, Bloc1State>(
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrPage(user: newUser),
            ),
          );
        } else if (state is RegistrationErrorState) {
          final snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Registration Form'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: LocaleKeys.registername.tr(),
                    icon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newUser.personName = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This block is empty. Please, write information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: LocaleKeys.registernumber.tr(),
                    icon: Icon(Icons.phone),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newUser.phoneNumber = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This block is empty. Please, write information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: LocaleKeys.registermap.tr(),
                    icon: Icon(Icons.map),
                  ),
                  value: newUser.country,
                  items: _countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      newUser.country = value.toString();
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This block is empty. Please, write information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newUser.email = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This block is empty. Please, write information';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: LocaleKeys.registerstory.tr(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newUser.life = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: LocaleKeys.registerpassword.tr(),
                    icon: Icon(Icons.security),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newUser.password = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This block is empty. Please, write information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: LocaleKeys.regispassword.tr(),
                    icon: Icon(Icons.security),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newUser.confirmPassword = value;
                    });
                  },
                  validator: (value) {
                    if (value != newUser.password) {
                      return 'Error. Please, write your correct password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(LocaleKeys.Register.tr()),
                ),
                const SizedBox(
                  height: 10.0,
                  width: 2,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('en'));
                  },
                  child: const Text('English'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('kk'));
                  },
                  child: const Text('Казахский'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('ru'));
                  },
                  child: const Text('Русский'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}