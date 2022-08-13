import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startyo/data/category.enum.dart';
import 'package:startyo/data/phase.enu.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/data/role.enum.dart';
import 'package:startyo/providers/auth.providers.dart';
import 'package:startyo/src/screens/dashboard.screen.dart';
import 'package:startyo/src/widgets/UI/bigButton.ui.dart';
import 'package:startyo/src/widgets/UI/body1.ui.dart';
import 'package:startyo/src/widgets/UI/header1.ui.dart';
import 'package:startyo/src/widgets/UI/inputfield.ui.dart';
import 'package:startyo/theme/colors.theme.dart';

class Establishment extends StatefulWidget {
  Establishment({Key? key}) : super(key: key);

  @override
  State<Establishment> createState() => _EstablishmentState();
}

class _EstablishmentState extends State<Establishment> {
  final GlobalKey<FormState> _establishmentFormKey = GlobalKey();
  String? _companyName;
  double? _valuation;
  DomainCategory? _category;

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _valuationController = TextEditingController();
  final List<DropdownMenuItem<DomainCategory>> _categoryDropDownItems =
      List.generate(
    DomainCategory.values.length,
    (index) => DropdownMenuItem(
      child: Text(
        DomainCategory.values[index].name,
      ),
      value: DomainCategory.values[index],
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _companyNameController.dispose();
    _valuationController.dispose();
    super.dispose();
  }

  Future<void> moveNext() async {
    final isValid = _establishmentFormKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _establishmentFormKey.currentState?.save();
    _companyName = _companyNameController.text;
    _valuation = double.parse(_valuationController.text);

    final provider = Provider.of<AuthProvider>(context, listen: false);

    final startUp = provider.startUp;
    provider.setLocalState(
      startUp.email,
      startUp.fullName,
      startUp.phone,
      startUp.role,
      startUp.idea,
      startUp.phase,
      _valuation!,
      _companyName!,
      _category!,
    );
    print(startUp.email +
        provider.currPass! +
        startUp.fullName +
        startUp.phone.toString() +
        startUp.role.toString() +
        startUp.idea +
        startUp.phase.toString() +
        _valuation!.toString() +
        _companyName! +
        _category!.toString());

    await provider.signUpAsStartUp(
      startUp.email,
      provider.currPass!,
      startUp.fullName,
      startUp.phone,
      startUp.role,
      startUp.idea,
      startUp.phase,
      startUp.valuation,
      startUp.companyName,
      startUp.category,
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
              Container(
                height: 39.h,
                width: 75.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/EstablishedInfo.png"),
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
                    key: _establishmentFormKey,
                    child: Column(
                      children: [
                        InputField(
                          controller: _companyNameController,
                          label: "Company Name",
                        ),
                        InputField(
                          controller: _valuationController,
                          label: "Valuation",
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Body1(text: "Choose a Category"),
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
                        items: _categoryDropDownItems,
                        onChanged: (value) => {
                          if (value != null)
                            {
                              _category = DomainCategory.values.firstWhere(
                                (element) =>
                                    element.toString() == value.toString(),
                              ),
                            }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              BigButton(
                buttonFunc: () async {
                  await moveNext();
                },
                text: "Finish",
              )
            ],
          ),
        ),
      ),
    );
  }
}
