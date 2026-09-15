import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/url_helper.dart';

import '../core/theme/app_theme.dart';
import 'scroll_reveal.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 90 : 40,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1250,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScrollReveal(
                    child: _SectionHeader(),
                  ),
                  const SizedBox(height: 55),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'Let’s build something\nmeaningful together.',
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 38 : 60,
                        height: 1.05,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -2.5,
                        color: AppTheme.primaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 180),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 650,
                      ),
                      child: Text(
                        'Have an idea, a project, or an opportunity? '
                            'I’m always open to discussing meaningful '
                            'products and interesting challenges.',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          height: 1.8,
                          color: AppTheme.secondaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 55),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 280),
                    offset: const Offset(0, 0.06),
                    child: MouseRegion(
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
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.all(
                          isMobile ? 24 : 38,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              isHovered
                                  ? AppTheme.surfaceElevated
                                  : AppTheme.surface,
                              isHovered
                                  ? AppTheme.surfaceLight
                                  : AppTheme.backgroundSecondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isHovered
                                ? AppTheme.accent.withOpacity(0.28)
                                : AppTheme.border,
                          ),
                          boxShadow: isHovered
                              ? [
                            BoxShadow(
                              color: AppTheme.accent.withOpacity(0.045),
                              blurRadius: 40,
                              spreadRadius: 2,
                            ),
                          ]
                              : null,
                        ),
                        child: isMobile
                            ? _MobileContactContent()
                            : _DesktopContactContent(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '05',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.mutedText,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: AppTheme.border,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          'CONTACT',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
            color: AppTheme.secondaryText,
          ),
        ),
      ],
    );
  }
}

class _DesktopContactContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AvailabilityBadge(),
              const SizedBox(height: 24),
              Text(
                'Let’s talk.',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                  color: AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Available for freelance projects, collaborations '
                    'and full-time opportunities.',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  height: 1.7,
                  color: AppTheme.secondaryText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _ContactButton(
                icon: Icons.arrow_outward_rounded,
                title: 'Get in touch',
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _SocialButton(
                    title: 'GitHub',
                    url: "https://github.com/Kunal645",
                  ),
                  const SizedBox(width: 10),
                  _SocialButton(
                    title: 'LinkedIn',
                    url: "https://in.linkedin.com/in/kunal-vagh",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileContactContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AvailabilityBadge(),
        const SizedBox(height: 24),
        Text(
          'Let’s talk.',
          style: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            letterSpacing: -1,
            color: AppTheme.primaryText,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Available for freelance projects, collaborations '
              'and full-time opportunities.',
          style: GoogleFonts.inter(
            fontSize: 13,
            height: 1.7,
            color: AppTheme.secondaryText,
          ),
        ),
        const SizedBox(height: 28),
        _ContactButton(
          icon: Icons.arrow_outward_rounded,
          title: 'Get in touch',
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            _SocialButton(
              title: 'GitHub',
              url: "https://github.com/Kunal645",
            ),
            const SizedBox(width: 10),
            _SocialButton(
              title: 'LinkedIn',
              url: "https://in.linkedin.com/in/kunal-vagh",
            ),
          ],
        ),
      ],
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
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
              color: AppTheme.success.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String title;

  const _ContactButton({
    required this.icon,
    required this.title,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
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
        onTap: (){
          UrlHelper.openUrl('https://mail.google.com/mail/?view=cm&fs=1&to=kunalvagh45@gmail.com');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: isHovered
                ? AppTheme.accentLight
                : AppTheme.accent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: AppTheme.accent.withOpacity(0.20),
                blurRadius: 25,
                spreadRadius: 1,
              ),
            ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF11100D),
                ),
              ),
              const SizedBox(width: 12),
              AnimatedRotation(
                duration: const Duration(milliseconds: 250),
                turns: isHovered ? 0.08 : 0,
                child: Icon(
                  widget.icon,
                  size: 16,
                  color: const Color(0xFF11100D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final String title;
  final String url;

  const _SocialButton({
    required this.title,
    required this.url
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
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
        onTap: (){
          UrlHelper.openUrl(widget.url);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isHovered
                ? AppTheme.accent.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isHovered
                  ? AppTheme.accent.withOpacity(0.22)
                  : AppTheme.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: isHovered
                      ? AppTheme.primaryText
                      : AppTheme.secondaryText,
                ),
              ),
              const SizedBox(width: 7),
              Icon(
                Icons.arrow_outward_rounded,
                size: 12,
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