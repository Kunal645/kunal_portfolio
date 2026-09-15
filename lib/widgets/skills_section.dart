import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_theme.dart';
import '../core/utils/url_helper.dart';
import 'scroll_reveal.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 90 : 130,
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
                    child: const _SectionHeader(),
                  ),
                  const SizedBox(height: 55),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      'Tools I use to\nbuild products.',
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 40 : 60,
                        height: 1.05,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -2.5,
                        color: AppTheme.primaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ScrollReveal(
                    delay: const Duration(milliseconds: 160),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 650,
                      ),
                      child: Text(
                        'A practical technology stack focused on building '
                            'reliable, scalable and polished digital products '
                            'across mobile and backend platforms.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.8,
                          color: AppTheme.secondaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 65),
                  _SkillsGrid(
                    isMobile: isMobile,
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
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '02',
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
          'SKILLS',
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

class _SkillsGrid extends StatelessWidget {
  final bool isMobile;

  const _SkillsGrid({
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    const skills = [
      _SkillData(
        number: '01',
        title: 'Flutter',
        subtitle: 'CROSS-PLATFORM DEVELOPMENT',
        description:
        'Building responsive and production-ready mobile '
            'applications with clean architecture and smooth UI.',
        icon: Icons.phone_android_rounded,
        tools: ['Dart', 'GetX', 'SQLite'],
        url: 'https://docs.flutter.dev/',
      ),
      _SkillData(
        number: '02',
        title: 'React Native',
        subtitle: 'MOBILE DEVELOPMENT',
        description:
        'Developing Android and iOS applications with reusable '
            'components and native integrations.',
        icon: Icons.devices_rounded,
        tools: ['JavaScript', 'React', 'Android', 'iOS'],
        url: 'https://reactnative.dev/docs/getting-started',
      ),
      _SkillData(
        number: '03',
        title: 'Java',
        subtitle: 'BACKEND DEVELOPMENT',
        description:
        'Writing reliable backend services and business logic '
            'for application workflows and integrations.',
        icon: Icons.code_rounded,
        tools: ['Java 8', 'OOP', 'REST'],
        url: 'https://docs.oracle.com/en/java/',
      ),
      _SkillData(
        number: '04',
        title: 'Spring Boot',
        subtitle: 'API DEVELOPMENT',
        description:
        'Creating structured REST APIs with validation, '
            'database integration and service-based architecture.',
        icon: Icons.dns_outlined,
        tools: ['Spring Boot', 'REST API', 'JPA'],
        url: 'https://docs.spring.io/spring-boot/documentation.html',
      ),
      _SkillData(
        number: '05',
        title: 'REST APIs',
        subtitle: 'SYSTEM INTEGRATION',
        description:
        'Connecting applications with secure APIs and handling '
            'authentication, validation and third-party services.',
        icon: Icons.api_rounded,
        tools: ['HTTP', 'JSON', 'Authentication'],
        url: 'https://developer.mozilla.org/en-US/docs/Glossary/REST',
      ),
      _SkillData(
        number: '06',
        title: 'Database',
        subtitle: 'DATA MANAGEMENT',
        description:
        'Working with local and server-side data storage for '
            'reliable application persistence and workflows.',
        icon: Icons.storage_rounded,
        tools: ['SQLite', 'MySQL', 'JPA'],
        url: 'https://www.sqlite.org/docs.html',
      ),
    ];

    if (isMobile) {
      return Column(
        children: skills
            .asMap()
            .entries
            .map(
              (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ScrollReveal(
              delay: Duration(
                milliseconds: 180 + (entry.key * 70),
              ),
              offset: const Offset(0, 0.06),
              child: _SkillCard(
                skill: entry.value,
              ),
            ),
          ),
        )
            .toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 1.75,
      ),
      itemBuilder: (context, index) {
        return ScrollReveal(
          delay: Duration(
            milliseconds: 180 + (index * 80),
          ),
          offset: const Offset(0, 0.06),
          child: _SkillCard(
            skill: skills[index],
          ),
        );
      },
    );
  }
}

class _SkillData {
  final String number;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<String> tools;
  final String url;

  const _SkillData({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.tools,
    required this.url,
  });
}

class _SkillCard extends StatefulWidget {
  final _SkillData skill;

  const _SkillCard({
    required this.skill,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovered = false;

  Future<void> _openSkillUrl() async {
    await UrlHelper.openUrl(widget.skill.url);
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
        onTap: _openSkillUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          transform: Matrix4.translationValues(
            0,
            isHovered ? -5 : 0,
            0,
          ),
          padding: const EdgeInsets.all(28),
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
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered
                  ? AppTheme.accent.withOpacity(0.25)
                  : AppTheme.border,
            ),
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: AppTheme.accent.withOpacity(0.04),
                blurRadius: 35,
                spreadRadius: 1,
                offset: const Offset(0, 14),
              ),
            ]
                : null,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 500;

              if (compact) {
                return _CompactSkillContent(
                  skill: widget.skill,
                  isHovered: isHovered,
                );
              }

              return _DesktopSkillContent(
                skill: widget.skill,
                isHovered: isHovered,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DesktopSkillContent extends StatelessWidget {
  final _SkillData skill;
  final bool isHovered;

  const _DesktopSkillContent({
    required this.skill,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: isHovered
                ? AppTheme.accent.withOpacity(0.10)
                : AppTheme.accent.withOpacity(0.045),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isHovered
                  ? AppTheme.accent.withOpacity(0.25)
                  : AppTheme.border,
            ),
          ),
          child: Icon(
            skill.icon,
            size: 22,
            color: isHovered
                ? AppTheme.accentLight
                : AppTheme.secondaryText,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    skill.number,
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: AppTheme.accent,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    skill.subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.4,
                      color: AppTheme.mutedText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Text(
                skill.title,
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                  color: AppTheme.primaryText,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                skill.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  height: 1.6,
                  color: AppTheme.secondaryText,
                ),
              ),
              const SizedBox(height: 15),
              _ToolTags(
                tools: skill.tools,
                isHovered: isHovered,
              ),
            ],
          ),
        ),
        AnimatedRotation(
          duration: const Duration(milliseconds: 250),
          turns: isHovered ? 0.08 : 0,
          child: Icon(
            Icons.arrow_outward_rounded,
            size: 16,
            color: isHovered
                ? AppTheme.accent
                : AppTheme.mutedText,
          ),
        ),
      ],
    );
  }
}

class _CompactSkillContent extends StatelessWidget {
  final _SkillData skill;
  final bool isHovered;

  const _CompactSkillContent({
    required this.skill,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.accent.withOpacity(
                  isHovered ? 0.10 : 0.045,
                ),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: isHovered
                      ? AppTheme.accent.withOpacity(0.25)
                      : AppTheme.border,
                ),
              ),
              child: Icon(
                skill.icon,
                size: 21,
                color: isHovered
                    ? AppTheme.accentLight
                    : AppTheme.secondaryText,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.number,
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accent,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    skill.title,
                    style: GoogleFonts.inter(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_outward_rounded,
              size: 15,
              color: isHovered
                  ? AppTheme.accent
                  : AppTheme.mutedText,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          skill.description,
          style: GoogleFonts.inter(
            fontSize: 12,
            height: 1.7,
            color: AppTheme.secondaryText,
          ),
        ),
        const SizedBox(height: 15),
        _ToolTags(
          tools: skill.tools,
          isHovered: isHovered,
        ),
      ],
    );
  }
}

class _ToolTags extends StatelessWidget {
  final List<String> tools;
  final bool isHovered;

  const _ToolTags({
    required this.tools,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tools
          .map(
            (tool) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: isHovered
                ? AppTheme.accent.withOpacity(0.055)
                : Colors.white.withOpacity(0.018),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isHovered
                  ? AppTheme.accent.withOpacity(0.14)
                  : AppTheme.border,
            ),
          ),
          child: Text(
            tool,
            style: GoogleFonts.inter(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: AppTheme.mutedText,
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}