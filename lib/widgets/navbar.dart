import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_theme.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.onLogoTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 60,
            vertical: 20,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                height: 66,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.surface.withOpacity(0.78),
                      AppTheme.surfaceLight.withOpacity(0.62),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.085)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.22),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                    BoxShadow(
                      color: AppTheme.accent.withOpacity(0.025),
                      blurRadius: 35,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _Logo(onTap: onLogoTap),

                    const Spacer(),

                    if (!isMobile)
                      _buildDesktopNavigation()
                    else
                      _MobileMenuButton(
                        onAboutTap: onAboutTap,
                        onSkillsTap: onSkillsTap,
                        onProjectsTap: onProjectsTap,
                        onExperienceTap: onExperienceTap,
                        onContactTap: onContactTap,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopNavigation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavItem(title: 'About', onTap: onAboutTap),
        _NavItem(title: 'Skills', onTap: onSkillsTap),
        _NavItem(title: 'Projects', onTap: onProjectsTap),
        _NavItem(title: 'Experience', onTap: onExperienceTap),
        _NavItem(title: 'Contact', onTap: onContactTap, isAccent: true),
      ],
    );
  }
}

// ============================================================
// LOGO
// ============================================================

class _Logo extends StatefulWidget {
  final VoidCallback onTap;

  const _Logo({required this.onTap});

  @override
  State<_Logo> createState() => _LogoState();
}

class _LogoState extends State<_Logo> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          decoration: BoxDecoration(
            color:
                isHovered
                    ? AppTheme.accent.withOpacity(0.08)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: isHovered ? 5 : 3,
                height: isHovered ? 25 : 21,
                decoration: BoxDecoration(
                  color: AppTheme.accent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'KUNAL VAGHELA',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color:
                      isHovered
                          ? AppTheme.primaryText
                          : AppTheme.primaryText.withOpacity(0.92),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// NAV ITEM
// ============================================================

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isAccent;

  const _NavItem({
    required this.title,
    required this.onTap,
    this.isAccent = false,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          margin: const EdgeInsets.only(left: 7),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            color:
                isHovered
                    ? (widget.isAccent
                        ? AppTheme.accent.withOpacity(0.11)
                        : Colors.white.withOpacity(0.035))
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  isHovered
                      ? (widget.isAccent
                          ? AppTheme.accent.withOpacity(0.16)
                          : Colors.white.withOpacity(0.045))
                      : Colors.transparent,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  color:
                      isHovered
                          ? (widget.isAccent
                              ? AppTheme.accentLight
                              : AppTheme.primaryText)
                          : AppTheme.secondaryText.withOpacity(0.72),
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: isHovered ? 16 : 0,
                height: 1,
                decoration: BoxDecoration(
                  color:
                      widget.isAccent ? AppTheme.accent : AppTheme.accentLight,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MOBILE MENU BUTTON
// ============================================================

class _MobileMenuButton extends StatefulWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const _MobileMenuButton({
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  State<_MobileMenuButton> createState() => _MobileMenuButtonState();
}

class _MobileMenuButtonState extends State<_MobileMenuButton> {
  bool isHovered = false;

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      barrierColor: Colors.black.withOpacity(0.72),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.accent.withOpacity(0.55),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 30),

                _MobileMenuItem(
                  number: '01',
                  title: 'About',
                  onTap: () {
                    Navigator.pop(context);
                    widget.onAboutTap();
                  },
                ),

                _MobileMenuItem(
                  number: '02',
                  title: 'Skills',
                  onTap: () {
                    Navigator.pop(context);
                    widget.onSkillsTap();
                  },
                ),

                _MobileMenuItem(
                  number: '03',
                  title: 'Projects',
                  onTap: () {
                    Navigator.pop(context);
                    widget.onProjectsTap();
                  },
                ),

                _MobileMenuItem(
                  number: '04',
                  title: 'Experience',
                  onTap: () {
                    Navigator.pop(context);
                    widget.onExperienceTap();
                  },
                ),

                _MobileMenuItem(
                  number: '05',
                  title: 'Contact',
                  isAccent: true,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onContactTap();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () => _showMenu(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color:
                isHovered
                    ? AppTheme.accent.withOpacity(0.10)
                    : Colors.white.withOpacity(0.045),
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color:
                  isHovered
                      ? AppTheme.accent.withOpacity(0.18)
                      : Colors.white.withOpacity(0.055),
            ),
          ),
          child: AnimatedRotation(
            turns: isHovered ? 0.04 : 0,
            duration: const Duration(milliseconds: 220),
            child: Icon(
              Icons.menu_rounded,
              size: 21,
              color:
                  isHovered
                      ? AppTheme.accentLight
                      : AppTheme.primaryText.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MOBILE MENU ITEM
// ============================================================

class _MobileMenuItem extends StatefulWidget {
  final String number;
  final String title;
  final VoidCallback onTap;
  final bool isAccent;

  const _MobileMenuItem({
    required this.number,
    required this.title,
    required this.onTap,
    this.isAccent = false,
  });

  @override
  State<_MobileMenuItem> createState() => _MobileMenuItemState();
}

class _MobileMenuItemState extends State<_MobileMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
          decoration: BoxDecoration(
            color:
                isHovered
                    ? (widget.isAccent
                        ? AppTheme.accent.withOpacity(0.07)
                        : Colors.white.withOpacity(0.025))
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(
                widget.number,
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: widget.isAccent ? AppTheme.accent : AppTheme.mutedText,
                ),
              ),

              const SizedBox(width: 18),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                      isHovered
                          ? (widget.isAccent
                              ? AppTheme.accentLight
                              : AppTheme.primaryText)
                          : AppTheme.secondaryText,
                ),
                child: Text(widget.title),
              ),

              const Spacer(),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(isHovered ? 3 : 0, 0, 0),
                child: Icon(
                  Icons.arrow_outward_rounded,
                  size: 16,
                  color: isHovered ? AppTheme.accent : AppTheme.mutedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
