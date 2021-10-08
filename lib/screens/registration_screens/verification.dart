import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'dart:async';

class Verificatoin extends StatefulWidget {
  const Verificatoin({Key? key}) : super(key: key);

  @override
  _VerificatoinState createState() => _VerificatoinState();
}

class _VerificatoinState extends State<Verificatoin> {
  bool _onEditing = true;
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  @override
  void initState() {
    super.initState();
  }

  late Timer _timer;
  int _start = 60;

  void startTimer() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_start == 0) {
            _start = 60;
            _isResendAgain = false;
            timer.cancel();
          } else {
            _start--;
          }
        });
      },
    );
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _isLoading = false;
          _isVerified = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade200),
                child: Transform.rotate(
                  angle: 38,
                  child: Image(
                    image: AssetImage('assets/email.png'),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Text(
                "Doğrulama",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Lütfen telefonunuza gelen 6 haneli kodu girin.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, height: 1.5, color: Colors.grey.shade500),
              ),
              SizedBox(
                height: 30,
              ),
              VerificationCode(
                textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                underlineColor: Colors.blueAccent,
                keyboardType: TextInputType.number,
                length: 6,
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SMS almadınız mı?",
                    style: TextStyle(
                        fontSize: 14, height: 1.5, color: Colors.grey.shade500),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_isResendAgain) return;
                        startTimer();
                      },
                      child: Text(
                        _isResendAgain
                            ? _start.toString() + ' içinde'
                            : "Tekrar Gönder",
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.blueAccent),
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                disabledColor: Colors.grey.shade300,
                height: 50,
                onPressed: _code.length < 6
                    ? null
                    : () {
                        verify();
                      },
                minWidth: double.infinity,
                color: Color(0xffFF007F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: _isLoading
                    ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 3,
                          color: Color(0xffFF007F),
                        ),
                      )
                    : _isVerified
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 30,
                          )
                        : Text(
                            "Doğrula",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
