import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rebook/utility/system/color_system.dart';
import 'package:rebook/utility/system/font_system.dart';
import 'package:rebook/view/base/base_screen.dart';
import 'package:rebook/view/study_history/widget/category_item.dart';
import 'package:rebook/view/study_history/widget/study_history_item.dart';
import 'package:rebook/view_model/study_history/study_history_view_model.dart';
import 'package:rebook/widget/appbar/default_back_appbar.dart';
import 'package:rebook/widget/button/custom_icon_button.dart';

class StudyHistoryScreen extends BaseScreen<StudyHistoryViewModel> {
  const StudyHistoryScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.white;

  @override
  bool get wrapWithInnerSafeArea => true;

  @override
  bool get setTopInnerSafeArea => true;

  @override
  bool get setBottomInnerSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Obx(
        () => DefaultBackAppBar(
          title: "공부 기록 목록",
          onBackPress: () {
            Get.back();
          },
          actions: [
            CustomIconButton(
              assetPath: viewModel.isEnableBookmarkMode
                  ? 'assets/icons/bookmark_fill.svg'
                  : 'assets/icons/bookmark_empty.svg',
              onPressed: () {
                viewModel.changeBookmarkMode();
              },
              colorFilter:
                  const ColorFilter.mode(Color(0xFF5356FF), BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/recycle.svg',
                width: 28,
              ),
              const SizedBox(width: 12),
              const Text(
                '재활용 둘러보기',
                style: FontSystem.KR24B,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.categoryStates.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  index: index,
                  listLength: viewModel.categoryStates.length,
                  state: viewModel.categoryStates[index],
                  onTap: () {
                    viewModel.changeCategoryStateInScreen(index);
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Obx(
            () {
              if (viewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (viewModel.studyHistoryStates.isEmpty) {
                return Center(
                  child: Text(
                    "공부 기록이 없습니다.",
                    style: FontSystem.KR24B.copyWith(color: ColorSystem.grey),
                  ),
                );
              }

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: viewModel.studyHistoryStates.length,
                itemBuilder: (context, index) {
                  return StudyHistoryItem(
                    index: index,
                    state: viewModel.studyHistoryStates[index],
                    onTap: () {
                      viewModel.fetchStudyHistoryDetail(index);
                      Get.bottomSheet(
                        Container(
                          width: Get.width - 32,
                          height: Get.height * 0.9,
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16, bottom: 32),
                          decoration: BoxDecoration(
                            color: ColorSystem.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Obx(() {
                            if (viewModel.isLoadingDetail) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomIconButton(
                                      assetPath:
                                          'assets/icons/arrow_back_blue.svg',
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                    const Spacer(),
                                    Text(
                                      viewModel
                                          .studyHistoryDetailState.createdAt,
                                      style: FontSystem.KR24B.copyWith(
                                        color: ColorSystem.grey,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: CachedNetworkImage(
                                    imageUrl: viewModel
                                        .studyHistoryDetailState.imageUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: Get.width - 64,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: ColorSystem.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      viewModel.studyHistoryDetailState.content,
                                      style: FontSystem.KR20M,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        isScrollControlled: true,
                      );
                    },
                    onTapBookmark: () {
                      viewModel.changeStudyHistoryStateInScreen(index);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
