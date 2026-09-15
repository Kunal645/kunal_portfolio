import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/utils/url_helper.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.10),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: 50,
          ),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1250,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionHeader(),
                      const SizedBox(height: 60),
                      Text(
                        'Where I have\nmade an impact.',
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 40 : 56,
                          height: 1.05,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -2.5,
                        ),
                      ),
                      const SizedBox(height: 70),
                      const _ExperienceTimeline(
                        isMobile: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '04',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.35),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.10),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          'EXPERIENCE',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
            color: Colors.white.withOpacity(0.55),
          ),
        ),
      ],
    );
  }
}

class _ExperienceTimeline extends StatelessWidget {
  final bool isMobile;

  const _ExperienceTimeline({
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ExperienceItem(
          company: 'Digiwagon',
          companyUrl: 'https://digiwagon.com/',
          role: 'Software Engineer',
          period: 'FEB 2024 — PRESENT',
          description:
          'Developing cross-platform applications using Flutter '
              'and React Native while working with backend services, '
              'APIs and production application workflows.',
          technologies: [
            'Flutter',
            'React Native',
            'Java',
            'Spring Boot',
          ],
          isFirst: true,
        ),
        _ExperienceItem(
          company: 'Anviya Technologies',
          companyUrl: 'https://anviya.in/',
          role: 'Software Developer',
          period: 'JUL 2023 — JAN 2024',
          description:
          'Worked on application development and contributed to '
              'mobile software projects with a focus on implementation, '
              'UI development and application functionality.',
          technologies: [
            'Flutter',
            'Dart',
            'Mobile Development',
          ],
          isFirst: false,
        ),
        _ExperienceItem(
          company: 'Prepseed Pvt. Ltd.',
          companyUrl: 'https://prepseed.com/',
          role: 'Software Developer',
          period: 'JUN 2022 — JUN 2023',
          description:
          'Developed and maintained software applications while '
              'working on user interfaces, application logic and '
              'integration of required services.',
          technologies: [
            'Flutter',
            'Dart',
            'REST API',
          ],
          isFirst: false,
        ),
        _ExperienceItem(
          company: 'Techcompose Solution',
          companyUrl: 'https://techcompose.com/',
          role: 'Software Development Intern',
          period: 'JAN 2022 — MAY 2022',
          description:
          'Started professional software development experience '
              'by working on application development, debugging and '
              'learning practical development workflows.',
          technologies: [
            'Flutter',
            'Dart',
            'Git',
          ],
          isFirst: false,
        ),
      ],
    );
  }
}

class _ExperienceItem extends StatefulWidget {
  final String company;
  final String companyUrl;
  final String role;
  final String period;
  final String description;
  final List<String> technologies;
  final bool isFirst;

  const _ExperienceItem({
    required this.company,
    required this.companyUrl,
    required this.role,
    required this.period,
    required this.description,
    required this.technologies,
    required this.isFirst,
  });

  @override
  State<_ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<_ExperienceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return MouseRegion(
          cursor: SystemMouseCursors.basic,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: isMobile ? 35 : 70,
                child: Column(
                  children: [
                    Container(
                      width: 11,
                      height: 11,
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isHovered
                            ? AppTheme.accentLight
                            : AppTheme.accent.withOpacity(0.45),
                        boxShadow: isHovered
                            ? [
                          BoxShadow(
                            color:
                            AppTheme.accent.withOpacity(0.35),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                        ]
                            : null,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: isMobile ? 270 : 225,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: AppTheme.border,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(
                    isMobile ? 22 : 32,
                  ),
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Colors.white.withOpacity(0.055)
                        : Colors.white.withOpacity(0.018),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isHovered
                          ? Colors.white.withOpacity(0.14)
                          : Colors.white.withOpacity(0.05),
                    ),
                  ),
                  child: isMobile
                      ? _MobileContent(
                    company: widget.company,
                    companyUrl: widget.companyUrl,
                    role: widget.role,
                    period: widget.period,
                    description: widget.description,
                    technologies: widget.technologies,
                  )
                      : _DesktopContent(
                    company: widget.company,
                    companyUrl: widget.companyUrl,
                    role: widget.role,
                    period: widget.period,
                    description: widget.description,
                    technologies: widget.technologies,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DesktopContent extends StatelessWidget {
  final String company;
  final String companyUrl;
  final String role;
  final String period;
  final String description;
  final List<String> technologies;

  const _DesktopContent({
    required this.company,
    required this.companyUrl,
    required this.role,
    required this.period,
    required this.description,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CompanyLink(
                    company: company,
                    url: companyUrl,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    role,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.45),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              period,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: Colors.white.withOpacity(0.30),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.white.withOpacity(0.06),
        ),
        const SizedBox(height: 25),
        Text(
          description,
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.8,
            color: Colors.white.withOpacity(0.45),
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map(
                (technology) => _TechnologyTag(
              title: technology,
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}

class _MobileContent extends StatelessWidget {
  final String company;
  final String companyUrl;
  final String role;
  final String period;
  final String description;
  final List<String> technologies;

  const _MobileContent({
    required this.company,
    required this.companyUrl,
    required this.role,
    required this.period,
    required this.description,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          period,
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: Colors.white.withOpacity(0.30),
          ),
        ),
        const SizedBox(height: 12),
        _CompanyLink(
          company: company,
          url: companyUrl,
        ),
        const SizedBox(height: 7),
        Text(
          role,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.white.withOpacity(0.45),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          description,
          style: GoogleFonts.inter(
            fontSize: 13,
            height: 1.75,
            color: Colors.white.withOpacity(0.45),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map(
                (technology) => _TechnologyTag(
              title: technology,
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}

class _CompanyLink extends StatefulWidget {
  final String company;
  final String url;

  const _CompanyLink({
    required this.company,
    required this.url,
  });

  @override
  State<_CompanyLink> createState() => _CompanyLinkState();
}

class _CompanyLinkState extends State<_CompanyLink> {
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
        onTap: () => UrlHelper.openUrl(widget.url),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.7,
            color: isHovered
                ? AppTheme.accentLight
                : AppTheme.primaryText,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.company),
              const SizedBox(width: 8),
              AnimatedSlide(
                duration: const Duration(milliseconds: 180),
                offset: isHovered
                    ? const Offset(0.15, -0.15)
                    : Offset.zero,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  opacity: isHovered ? 1 : 0.55,
                  child: Icon(
                    Icons.arrow_outward_rounded,
                    size: 17,
                    color: isHovered
                        ? AppTheme.accentLight
                        : AppTheme.secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechnologyTag extends StatelessWidget {
  final String title;

  const _TechnologyTag({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(0.035),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 10,
          color: Colors.white.withOpacity(0.42),
        ),
      ),
    );
  }
}