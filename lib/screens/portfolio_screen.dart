import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/theme/app_theme.dart';
import '../widgets/about_section.dart';
import '../widgets/animated_background.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer_section.dart';
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

  String _activeSection = 'home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrollOffset = _scrollController.offset;

    String newSection = 'home';

    final aboutOffset = _getSectionOffset(_aboutKey);
    final skillsOffset = _getSectionOffset(_skillsKey);
    final projectsOffset = _getSectionOffset(_projectsKey);
    final experienceOffset = _getSectionOffset(_experienceKey);
    final contactOffset = _getSectionOffset(_contactKey);

    const navbarHeight = 110.0;

    if (contactOffset != null && scrollOffset >= contactOffset - navbarHeight) {
      newSection = 'contact';
    } else if (experienceOffset != null &&
        scrollOffset >= experienceOffset - navbarHeight) {
      newSection = 'experience';
    } else if (projectsOffset != null &&
        scrollOffset >= projectsOffset - navbarHeight) {
      newSection = 'projects';
    } else if (skillsOffset != null &&
        scrollOffset >= skillsOffset - navbarHeight) {
      newSection = 'skills';
    } else if (aboutOffset != null &&
        scrollOffset >= aboutOffset - navbarHeight) {
      newSection = 'about';
    }

    if (_activeSection != newSection && mounted) {
      setState(() {
        _activeSection = newSection;
      });
    }
  }

  double? _getSectionOffset(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) {
      return null;
    }

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox) {
      return null;
    }

    final viewport = RenderAbstractViewport.of(renderObject);

    if (viewport == null) {
      return null;
    }

    final revealed = viewport.getOffsetToReveal(
      renderObject,
      0.0,
    );

    return revealed.offset;
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOutCubic,
    );
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          ScrollConfiguration(
            behavior: const _PortfolioScrollBehavior(),
            child: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                // ============================================================
                // STICKY NAVBAR
                // ============================================================
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyNavbarDelegate(
                    child: Navbar(
                      activeSection: _activeSection,
                      onLogoTap: scrollToTop,
                      onAboutTap: () => scrollToSection(_aboutKey),
                      onSkillsTap: () => scrollToSection(_skillsKey),
                      onProjectsTap: () => scrollToSection(_projectsKey),
                      onExperienceTap: () => scrollToSection(_experienceKey),
                      onContactTap: () => scrollToSection(_contactKey),
                    ),
                  ),
                ),

                // ============================================================
                // HERO
                // ============================================================
                SliverToBoxAdapter(
                  child: Container(
                    key: _homeKey,
                    child: HeroSection(
                      onProjectsTap: () => scrollToSection(_projectsKey),
                      onContactTap: () => scrollToSection(_contactKey),
                    ),
                  ),
                ),

                // ============================================================
                // ABOUT
                // ============================================================
                SliverToBoxAdapter(
                  child: Container(key: _aboutKey, child: const AboutSection()),
                ),

                // ============================================================
                // SKILLS
                // ============================================================
                SliverToBoxAdapter(
                  child: Container(
                    key: _skillsKey,
                    child: const SkillsSection(),
                  ),
                ),

                // ============================================================
                // PROJECTS
                // ============================================================
                SliverToBoxAdapter(
                  child: Container(
                    key: _projectsKey,
                    child: const ProjectsSection(),
                  ),
                ),

                // ============================================================
                // EXPERIENCE
                // ============================================================
                SliverToBoxAdapter(
                  child: Container(
                    key: _experienceKey,
                    child: const ExperienceSection(),
                  ),
                ),

                // ============================================================
                // CONTACT
                // ============================================================
                SliverToBoxAdapter(
                  child: Container(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                ),

                // ============================================================
                // FOOTER
                // ============================================================
                SliverToBoxAdapter(
                  child: FooterSection(
                    onBackToTop: scrollToTop,
                    onAboutTap: () => scrollToSection(_aboutKey),
                    onSkillsTap: () => scrollToSection(_skillsKey),
                    onProjectsTap: () => scrollToSection(_projectsKey),
                    onExperienceTap: () => scrollToSection(_experienceKey),
                    onContactTap: () => scrollToSection(_contactKey),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STICKY NAVBAR DELEGATE
// ============================================================

// ============================================================
// STICKY NAVBAR DELEGATE
// ============================================================

class _StickyNavbarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyNavbarDelegate({required this.child});

  @override
  double get minExtent => 106;

  @override
  double get maxExtent => 106;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _StickyNavbarDelegate oldDelegate) {
    return true;
  }
}

// ============================================================
// SCROLL BEHAVIOR
// ============================================================

class _PortfolioScrollBehavior extends MaterialScrollBehavior {
  const _PortfolioScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
