import 'package:flutter/material.dart';
import 'package:sproteste/app/characters/model/character.dart';
import 'package:sproteste/utils/decoration_utils.dart';
import 'package:sproteste/widgets/appbar/flexible_app_bar.dart';
import 'package:sproteste/widgets/input/custom_text_form_field.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleCharacterPage extends StatefulWidget {
  final Character character;
  const SingleCharacterPage({Key? key, required this.character})
      : super(key: key);

  @override
  _SingleCharacterPageState createState() => _SingleCharacterPageState();
}

class _SingleCharacterPageState extends State<SingleCharacterPage> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final TextEditingController _statusController = TextEditingController();
  final FocusNode _statusFocus = FocusNode();
  final TextEditingController _speciesController = TextEditingController();
  final FocusNode _speciesFocus = FocusNode();
  final TextEditingController _typeController = TextEditingController();
  final FocusNode _typeFocus = FocusNode();
  final TextEditingController _genderController = TextEditingController();
  final FocusNode _genderFocus = FocusNode();
  final TextEditingController _originController = TextEditingController();
  final FocusNode _originFocus = FocusNode();
  final TextEditingController _locationController = TextEditingController();
  final FocusNode _locationFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.character.name;
    _statusController.text = widget.character.status;
    _speciesController.text = widget.character.species;
    _typeController.text = widget.character.type;
    _genderController.text = widget.character.gender;
    _originController.text = widget.character.origin.name;
    _locationController.text = widget.character.location.name;
  }

  _buildCharacterData() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      labelText: "Name",
                      inputAction: TextInputAction.next,
                      onSubmitted: (text) {
                        _statusFocus.requestFocus();
                      }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                      controller: _statusController,
                      focusNode: _statusFocus,
                      labelText: "Status",
                      inputAction: TextInputAction.next,
                      onSubmitted: (text) {
                        _speciesFocus.requestFocus();
                      }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      controller: _speciesController,
                      focusNode: _speciesFocus,
                      labelText: "Species",
                      inputAction: TextInputAction.next,
                      onSubmitted: (text) {
                        _typeFocus.requestFocus();
                      }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                      controller: _typeController,
                      focusNode: _typeFocus,
                      labelText: "Type",
                      inputAction: TextInputAction.next,
                      onSubmitted: (text) {
                        _genderFocus.requestFocus();
                      }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                      controller: _genderController,
                      focusNode: _genderFocus,
                      labelText: "Gender",
                      inputAction: TextInputAction.next,
                      onSubmitted: (text) {
                        _originFocus.requestFocus();
                      }),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(
                controller: _originController,
                focusNode: _originFocus,
                labelText: "Origin",
                inputAction: TextInputAction.next,
                onSubmitted: (text) {
                  _locationFocus.requestFocus();
                }),
            const SizedBox(height: 20),
            CustomTextField(
                controller: _locationController,
                focusNode: _locationFocus,
                labelText: "Location",
                inputAction: TextInputAction.done,
                onSubmitted: (text) {
                  FocusNode().requestFocus();
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: CustomScrollView(
          slivers: [
            FlexibleAppBar(character: widget.character),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            _buildCharacterData()
          ],
        ),
      ),
    );
  }
}
