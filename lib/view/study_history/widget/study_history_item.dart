import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rebook/model/study_history/study_history_state.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:shimmer/shimmer.dart';

class StudyHistoryItem extends StatelessWidget {
  const StudyHistoryItem({
    super.key,
    required this.index,
    required this.state,
    this.onTap,
    this.onTapBookmark,
  });

  final int index;
  final StudyHistoryState state;
  final Function()? onTap;
  final Function()? onTapBookmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index.isOdd
          ? const EdgeInsets.only(right: 16)
          : const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorSystem.grey[200]!,
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              GestureDetector(
                onTap: onTap,
                child: CachedNetworkImage(
                  imageUrl: state.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => _skeletonLoader(
                    width: double.infinity,
                    height: double.infinity,
                    borderRadius: 24,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onTapBookmark,
                  child: SvgPicture.asset(
                    state.isMarking
                        ? 'assets/icons/bookmark_fill.svg'
                        : 'assets/icons/bookmark_empty.svg',
                    width: 32,
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF5356FF), BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _skeletonLoader({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: ColorSystem.grey[200]!,
      highlightColor: ColorSystem.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.grey),
      ),
    );
  }
}
