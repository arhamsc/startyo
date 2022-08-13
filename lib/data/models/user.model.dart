import 'package:startyo/data/category.enum.dart';
import 'package:startyo/data/phase.enu.dart';
import 'package:startyo/data/role.enum.dart';

class User {
  final String userId;
  final String fullName;
  final int phone;
  final String email;
  final Role role;
  User({
    required this.userId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.role,
  });
}

class StartUp extends User {
  final String companyName;
  final String idea;
  final Phase phase;
  final double valuation;
  final int? marketResearchLevel;
  final Map<String, Mentor>? mentors;
  final List<String>? marketReportsUrls;
  final int? grade;
  final DomainCategory category;
  StartUp({
    required this.companyName,
    required userId,
    required fullName,
    required phone,
    required email,
    required role,
    required this.idea,
    required this.phase,
    required this.valuation,
    this.marketResearchLevel,
    this.mentors,
    this.marketReportsUrls,
    this.grade,
    required this.category,
  }) : super(
          userId: userId,
          fullName: fullName,
          phone: phone,
          email: email,
          role: role,
        );
}

class Mentor extends User {
  final double experience;
  final Map<String, StartUp> mentoredStartups;
  final String resumeUrl;
  final DomainCategory category;
  final List<String> previousProjects;
  final double fee;
  Mentor({
    required userId,
    required fullName,
    required phone,
    required email,
    required role,
    required this.experience,
    required this.mentoredStartups,
    required this.resumeUrl,
    required this.category,
    required this.previousProjects,
    required this.fee,
  }) : super(
          userId: userId,
          fullName: fullName,
          phone: phone,
          email: email,
          role: role,
        );
}
