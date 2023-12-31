// SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <community@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause
import 'package:flutter/material.dart';
import 'package:flutter_example_packages/widgets/base/export.dart';
import 'package:flutter_example_packages/widgets/texts/export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SqfliteFormUpdate extends AppStatefulWidget {
  const SqfliteFormUpdate(
    this.submit, {
    super.key,
  });

  final Future<bool> Function(
    int id,
    String name,
    int value,
    double num,
  ) submit;

  @override
  State<SqfliteFormUpdate> createState() => _SqfliteFormUpdateState();
}

class _SqfliteFormUpdateState extends AppState<SqfliteFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  bool _isError = false;

  @override
  Widget buildWide(
    BuildContext context,
    MediaQueryData media,
    AppLocalizations l10n,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _idController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: l10n.sqfliteTitleFieldID,
              errorText: _isError ? l10n.sqfliteTitleError : null,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.sqfliteTitleValidateRequired;
              }
              if (int.tryParse(value) == null) {
                return l10n.sqfliteTitleValidateType('int');
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: l10n.sqfliteTitleFieldName,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.sqfliteTitleValidateRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: l10n.sqfliteTitleFieldValue,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.sqfliteTitleValidateRequired;
              }
              if (int.tryParse(value) == null) {
                return l10n.sqfliteTitleValidateType('int');
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _numController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: l10n.sqfliteTitleFieldNum,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.sqfliteTitleValidateRequired;
              }
              if (double.tryParse(value.replaceAll(',', '.')) == null) {
                return l10n.sqfliteTitleValidateType('double');
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() == true) {
                  // Send submit
                  if (await widget.submit(
                    int.parse(_idController.text),
                    _nameController.text,
                    int.parse(_valueController.text),
                    double.parse(_numController.text.replaceAll(',', '.')),
                  )) {
                    // Clear focus
                    FocusScope.of(context).unfocus();
                    // Clear form
                    _idController.clear();
                    _nameController.clear();
                    _valueController.clear();
                    _numController.clear();
                    // Clear error
                    setState(() {
                      _isError = false;
                    });
                  } else {
                    // Show error
                    setState(() {
                      _isError = true;
                    });
                  }
                }
              },
              child: TextBodyLarge(
                l10n.sqfliteTitleBtnSubmit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
