import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scroll_reveal.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 70,
            vertical: isMobile ? 30 : 60,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1250),
            child: Column(
              children: [
                _SectionHeader(),
                isMobile
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    ScrollReveal(
                      delay: const Duration(milliseconds: 100),
                      offset: const Offset(0, 0.08),
                      child: _buildTitle(true),
                    ),
                    const SizedBox(height: 28),
                    _buildMobileContent(),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          ScrollReveal(
                            delay: const Duration(milliseconds: 100),
                            offset: const Offset(0, 0.08),
                            child: _buildTitle(false),
                          ),
                          const SizedBox(height: 35),
                          _buildDesktopContent(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 100),
                    Expanded(
                      flex: 4,
                      child: ScrollReveal(
                        delay: const Duration(milliseconds: 350),
                        offset: const Offset(0, 0.08),
                        child: _buildStats(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 1,
          color: Colors.white.withOpacity(0.45),
        ),
        const SizedBox(width: 10),
        Text(
          '01 ABOUT',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(bool isMobile) {
    return Text(
      'I turn ideas into\nmeaningful products.',
      style: GoogleFonts.inter(
        fontSize: isMobile ? 34 : 58,
        height: 1.08,
        fontWeight: FontWeight.w600,
        letterSpacing: -2,
        color: Colors.white,
      ),
    );
  }

  Widget _buildDesktopContent() {
    return ScrollReveal(
      delay: const Duration(milliseconds: 200),
      offset: const Offset(0, 0.08),
      child: _buildDescription(false),
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScrollReveal(
          delay: const Duration(milliseconds: 200),
          offset: const Offset(0, 0.08),
          child: _buildDescription(true),
        ),
        const SizedBox(height: 42),
        ScrollReveal(
          delay: const Duration(milliseconds: 350),
          offset: const Offset(0, 0.08),
          child: _buildStats(),
        ),
      ],
    );
  }

  Widget _buildDescription(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I’m a Software Engineer focused on building '
              'high-quality cross-platform applications.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 16 : 18,
            height: isMobile ? 1.65 : 1.7,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.82),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'With experience across Flutter, React Native, Java '
              'and Spring Boot, I enjoy turning complex requirements '
              'into clean, reliable and intuitive digital experiences.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 13.5 : 14,
            height: isMobile ? 1.75 : 1.8,
            color: Colors.white.withOpacity(0.42),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'From mobile interfaces to backend APIs, I care about '
              'the details that make software feel simple, fast and '
              'purposeful.',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 13.5 : 14,
            height: isMobile ? 1.75 : 1.8,
            color: Colors.white.withOpacity(0.42),
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Column(
      children: [
        _StatItem(
          number: '04+',
          label: 'YEARS OF EXPERIENCE',
        ),
        _StatItem(
          number: '15+',
          label: 'PROJECTS BUILT',
        ),
        _StatItem(
          number: '04',
          label: 'CORE TECHNOLOGIES',
        ),
      ],
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
          '01',
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
          'ABOUT',
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

class _StatItem extends StatefulWidget {
  final String number;
  final String label;

  const _StatItem({
    required this.number,
    required this.label,
  });

  @override
  State<_StatItem> createState() => _StatItemState();
}

class _StatItemState extends State<_StatItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 19,
          horizontal: 17,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isHovered
              ? Colors.white.withOpacity(0.045)
              : Colors.white.withOpacity(0.018),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isHovered
                ? Colors.white.withOpacity(0.12)
                : Colors.white.withOpacity(0.05),
          ),
        ),
        child: Row(
          children: [
            Text(
              widget.number,
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
                color: isHovered
                    ? Colors.white
                    : Colors.white.withOpacity(0.8),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 8.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.6,
                  color: Colors.white.withOpacity(0.35),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isHovered ? 1 : 0.25,
              child: const Icon(
                Icons.arrow_outward_rounded,
                size: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}