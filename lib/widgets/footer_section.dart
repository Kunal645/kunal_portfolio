import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/url_helper.dart';

import '../core/theme/app_theme.dart';
import 'scroll_reveal.dart';

class FooterSection extends StatefulWidget {
  final VoidCallback onBackToTop;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onContactTap;

  const FooterSection({
    super.key,
    required this.onBackToTop,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onContactTap,
  });

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppTheme.backgroundSecondary,
            border: Border(
              top: BorderSide(
                color: AppTheme.border,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 70 : 0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1250,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    ScrollReveal(
                      offset: const Offset(0, 0.05),
                      child: _buildTopSection(isMobile),
                    ),
                    const SizedBox(height: 75),
                    ScrollReveal(
                      delay: const Duration(milliseconds: 120),
                      offset: const Offset(0, 0.05),
                      child: _buildGiantName(isMobile),
                    ),
                    const SizedBox(height: 60),
                    _buildDivider(),
                    const SizedBox(height: 25),
                    _buildBottomBar(isMobile),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopSection(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrand(),
          const SizedBox(height: 50),
          _buildNavigation(),
          const SizedBox(height: 45),
          _buildTechnologies(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _buildBrand(),
        ),
        Expanded(
          flex: 2,
          child: _buildNavigation(),
        ),
        Expanded(
          flex: 2,
          child: _buildTechnologies(),
        ),
      ],
    );
  }

  Widget _buildBrand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KUNAL',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: 5,
            color: AppTheme.primaryText,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'SOFTWARE ENGINEER',
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.2,
            color: AppTheme.accent,
          ),
        ),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 390,
          ),
          child: Text(
            'Building thoughtful digital experiences across '
                'mobile, web and backend systems.',
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.8,
              color: AppTheme.secondaryText,
            ),
          ),
        ),
        const SizedBox(height: 25),
        _AvailabilityBadge(),
      ],
    );
  }

  Widget _buildNavigation() {
    return _FooterColumn(
      title: 'NAVIGATION',
      children: [
        _FooterLink(
          title: 'Home',
          onTap: widget.onBackToTop,
        ),
        _FooterLink(
          title: 'About',
          onTap: widget.onAboutTap,
        ),
        _FooterLink(
          title: 'Skills',
          onTap: widget.onSkillsTap,
        ),
        _FooterLink(
          title: 'Projects',
          onTap: widget.onProjectsTap,
        ),
        _FooterLink(
          title: 'Experience',
          onTap: widget.onExperienceTap,
        ),
        _FooterLink(
          title: 'Contact',
          onTap: widget.onContactTap,
        ),
      ],
    );
  }

  Widget _buildTechnologies() {
    return _FooterColumn(
      title: 'TECHNOLOGIES',
      children: [
        _FooterText(title: 'Flutter / Dart'),
        _FooterText(title: 'React Native'),
        _FooterText(title: 'Java'),
        _FooterText(title: 'Spring Boot'),
        _FooterText(title: 'REST APIs'),
        _FooterText(title: 'SQLite / Firebase'),
      ],
    );
  }

  Widget _buildGiantName(bool isMobile) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          'KUNAL VAGHELA',
          maxLines: 1,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 100 : 190,
            height: 0.85,
            fontWeight: FontWeight.w700,
            letterSpacing: isMobile ? -5 : -12,
            color: Colors.white.withOpacity(0.025),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppTheme.border,
    );
  }

  Widget _buildBottomBar(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCopyright(),
          const SizedBox(height: 20),
          _buildSocialLinks(),
          const SizedBox(height: 20),
          _buildBackToTop(),
          const SizedBox(height: 25),
          _buildBuiltWith(),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _buildCopyright(),
        ),
        _buildSocialLinks(),
        const SizedBox(width: 30),
        _buildBackToTop(),
        const SizedBox(width: 30),
        _buildBuiltWith(),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      '© ${DateTime.now().year} Kunal. All rights reserved.',
      style: GoogleFonts.inter(
        fontSize: 10,
        color: AppTheme.mutedText,
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialLink(
          title: 'GitHub',
          url: "https://github.com/Kunal645",
        ),
        const SizedBox(width: 18),
        _SocialLink(
          title: 'LinkedIn',
          url: "https://in.linkedin.com/in/kunal-vagh",
        ),
      ],
    );
  }

  Widget _buildBackToTop() {
    return _BackToTopButton(
      onTap: widget.onBackToTop,
    );
  }

  Widget _buildBuiltWith() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'BUILT WITH',
          style: GoogleFonts.inter(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            color: AppTheme.mutedText,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'FLUTTER',
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: AppTheme.accent,
          ),
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: AppTheme.accent,
          ),
        ),
        const SizedBox(height: 22),
        ...children,
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _FooterLink({
    required this.title,
    required this.onTap,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: isHovered ? 16 : 0,
                height: 1,
                margin: EdgeInsets.only(
                  right: isHovered ? 8 : 0,
                ),
                color: AppTheme.accent,
              ),
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isHovered
                      ? AppTheme.primaryText
                      : AppTheme.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  final String title;

  const _FooterText({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppTheme.secondaryText,
        ),
      ),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final String title;
  final String url;

  const _SocialLink({
    required this.title,
    required this.url
  });

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
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
        onTap: () {
          UrlHelper.openUrl(widget.url);
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: isHovered
                ? AppTheme.accent
                : AppTheme.secondaryText,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title),
              const SizedBox(width: 5),
              Icon(
                Icons.arrow_outward_rounded,
                size: 11,
                color: isHovered
                    ? AppTheme.accent
                    : AppTheme.mutedText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackToTopButton extends StatefulWidget {
  final VoidCallback onTap;

  const _BackToTopButton({
    required this.onTap,
  });

  @override
  State<_BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<_BackToTopButton> {
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
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: isHovered
                ? AppTheme.accent.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: isHovered
                  ? AppTheme.accent.withOpacity(0.25)
                  : AppTheme.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'BACK TO TOP',
                style: GoogleFonts.inter(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: isHovered
                      ? AppTheme.primaryText
                      : AppTheme.mutedText,
                ),
              ),
              const SizedBox(width: 7),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                transform: Matrix4.translationValues(
                  0,
                  isHovered ? -2 : 0,
                  0,
                ),
                child: Icon(
                  Icons.arrow_upward_rounded,
                  size: 12,
                  color: isHovered
                      ? AppTheme.accent
                      : AppTheme.mutedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppTheme.success.withOpacity(0.055),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: AppTheme.success.withOpacity(0.16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.success,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.success.withOpacity(0.35),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          const SizedBox(width: 9),
          Text(
            'AVAILABLE FOR OPPORTUNITIES',
            style: GoogleFonts.inter(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.3,
              color: AppTheme.success.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}