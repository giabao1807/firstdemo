import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDart extends StatelessWidget {
  const RxDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxDart Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            StreamBuilder(
                stream: validation.email,
                builder: ((context, snapShot) => TextField(
                      onChanged: (val) => validation.sinkEmail.add(val),
                      decoration: InputDecoration(
                          hintText: 'Email',
                          errorText: snapShot.hasError
                              ? snapShot.error.toString()
                              : null),
                    ))),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: validation.message,
                builder: ((context, snapShot) => TextField(
                      onChanged: (val) => validation.sinkMessage.add(val),
                      decoration: InputDecoration(
                          hintText: 'Message',
                          errorText: snapShot.hasError
                              ? snapShot.error.toString()
                              : null),
                    ))),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: validation.submitValid,
                builder: ((context, snapShot) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: snapShot.data != true
                              ? Colors.grey[200]
                              : Colors.blue),
                      onPressed: snapShot.data != true ? () {} : () {},
                      child: const Text('Login'),
                    ))),
          ],
        ),
      ),
    );
  }
}

class Validator {
  final _email = BehaviorSubject<String>.seeded('@');
  final _message = BehaviorSubject<String>.seeded('');

  Stream<String> get email => _email.stream.transform(validateEmail);
  Sink<String> get sinkEmail => _email.sink;

  Stream<String> get message => _message.stream.transform(validateMessage);
  Sink<String> get sinkMessage => _message.sink;

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, message, (e, m) => true);

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 1) {
      isEmail(value)
          ? sink.add(value)
          : sink.addError('Please enter valid email');
    }
  });
  final validateMessage =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      value.length >= 8
          ? sink.add(value)
          : sink.addError('Message should be 8 characters long');
    }
  });
  static bool isEmail(String email) {
    String value =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(email);
  }
}

final validation = Validator();
