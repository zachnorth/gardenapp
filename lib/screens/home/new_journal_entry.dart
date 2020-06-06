import 'package:flutter/material.dart';
import 'package:gardenapp/shared/constants.dart';

class NewJournalEntry extends StatefulWidget {
  @override
  _NewJournalEntryState createState() => _NewJournalEntryState();
}

class _NewJournalEntryState extends State<NewJournalEntry> {

  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _entry = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Title...'),
            validator: (val) => val.isEmpty ? 'Please enter a title...' : null,
            onChanged: (val) => setState(() => _title = val),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Notes...'),
            validator: (val) => val.isEmpty ? 'Please enter your notes...' : null,
            onChanged: (val) => setState(() => _entry = val),
          ),
        ],
      ),
    );
  }
}
