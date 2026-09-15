import 'package:flutter/material.dart';
import 'package:portfolio/widgets/footer_section.dart';
import '../widgets/about_section.dart';
import '../widgets/animated_background.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOutCubic,
    );
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Navbar(
                  onLogoTap: scrollToTop,
                  onAboutTap: () => scrollToSection(_aboutKey),
                  onSkillsTap: () => scrollToSection(_skillsKey),
                  onProjectsTap: () => scrollToSection(_projectsKey),
                  onExperienceTap: () => scrollToSection(_experienceKey),
                  onContactTap: () => scrollToSection(_contactKey),
                ),
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onProjectsTap: () => scrollToSection(_projectsKey),
                    onContactTap: () => scrollToSection(_contactKey),
                  ),
                ),
                Container(key: _aboutKey, child: const AboutSection()),
                Container(key: _skillsKey, child: const SkillsSection()),
                Container(key: _projectsKey, child: const ProjectsSection()),
                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),
                Container(key: _contactKey, child: const ContactSection()),
                FooterSection(
                  onBackToTop: scrollToTop,
                  onAboutTap: () => scrollToSection(_aboutKey),
                  onSkillsTap: () => scrollToSection(_skillsKey),
                  onProjectsTap: () => scrollToSection(_projectsKey),
                  onExperienceTap: () => scrollToSection(_experienceKey),
                  onContactTap: () => scrollToSection(_contactKey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
