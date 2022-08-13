import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startyo/data/category.enum.dart';
import 'package:startyo/data/phase.enu.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/data/role.enum.dart';
import 'package:startyo/providers/auth.providers.dart';
import 'package:startyo/src/screens/establishment.screen.dart';
import 'package:startyo/src/widgets/UI/bigButton.ui.dart';
import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';
import 'package:startyo/src/widgets/UI/inputfield.ui.dart';
import 'package:startyo/theme/colors.theme.dart';

class AboutIdeaScreen extends StatefulWidget {
  AboutIdeaScreen({Key? key}) : super(key: key);

  @override
  State<AboutIdeaScreen> createState() => _AboutIdeaScreenState();
}

class _AboutIdeaScreenState extends State<AboutIdeaScreen> {
  final GlobalKey<FormState> _ideaFormKey = GlobalKey();
  String? _idea;
  Phase? _phase;

  final TextEditingController _ideaController = TextEditingController();

  final List<DropdownMenuItem<Phase>> _phaseDropDownItems = List.generate(
    Phase.values.length,
    (index) => DropdownMenuItem(
      child: Text(
        Phase.values[index].name,
      ),
      value: Phase.values[index],
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _ideaController.dispose();
    super.dispose();
  }

  void moveNext() {
    final isValid = _ideaFormKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _ideaFormKey.currentState?.save();
    _idea = _ideaController.text;

    final provider = Provider.of<AuthProvider>(context, listen: false);

    final startUp = provider.startUp;
    provider.setLocalState(
      startUp.email,
      startUp.fullName,
      startUp.phone,
      startUp.role,
      _idea!,
      _phase!,
      0,
      "s",
      DomainCategory.edTech,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 328,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 39.h,
                width: 75.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/AboutIdea.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderText(text: "Tell us about your idea"),
                  SizedBox(
                    height: 6.h,
                  ),
                  Form(
                      key: _ideaFormKey,
                      child: Column(
                        children: [
                          InputField(
                            controller: _ideaController,
                            label: "Idea",
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Body1(text: "Phase"),
                              ),
                              const SizedBox(height: 5),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  filled: true,
                                  fillColor: Palette.primary.shade200,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.sp),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return "Please select a Phase";
                                  }
                                },
                                items: _phaseDropDownItems,
                                onChanged: (value) => {
                                  if (value != null)
                                    {
                                      _phase = Phase.values.firstWhere(
                                        (element) =>
                                            element.toString() ==
                                            value.toString(),
                                      ),
                                    }
                                },
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
              BigButton(
                buttonFunc: () {
                  moveNext();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Establishment(),
                    ),
                  );
                },
                text: "Next",
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
