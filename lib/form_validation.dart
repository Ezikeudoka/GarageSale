import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormValidation extends StatefulWidget {
  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  String _title;
  String _price;
  String _description;

  Widget _buildTitle() {
    return TextFormField(
      maxLength: 15,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Title"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Title is required";
        }
      },
      onSaved: (String value) {
        _title = value;
      },
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      maxLength: 15,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Price"),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (String value) {
        if (value.trim().isEmpty || int.parse(value.trim()) == 0) {
          return "Price is required";
        }
      },
      onSaved: (String value) {
        _price = value.trim();
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      maxLength: 15,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Description"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Decription is required";
        }
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HyperGarage Sale")),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTitle(),
                _buildPrice(),
                _buildDescription(),
                RaisedButton(
                  child: Text(
                    "send",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(_title);
                    print(_price);
                    print(_description);
                  },
                )
              ],
            ),
          ),
        )));
  }
}
