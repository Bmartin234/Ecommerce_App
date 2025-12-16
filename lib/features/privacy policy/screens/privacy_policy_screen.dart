import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/app_textstyles.dart';
import '../widgets/info_section.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Privacy Policy',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection(
                title: 'Information We Collect',
                content:
                'We collect information that you provide directly to us,including name, email address and shipping information',
              ),
              InfoSection(
                title: 'How We Use Your Information',
                content:
                'We use the information we collect to provide, maintain, and improve our sevieces, process your transaction and sent update',
              ),
              InfoSection(
                title: 'Information Sharing',
                content:
                'We collect information that you provide directly to us,including name, email address and shipping information',
              ),
              InfoSection(
                title: 'Data Security',
                content:
                'We collect information that you provide directly to us,including name, email address and shipping information',
              ),
              InfoSection(
                title: 'Your Rights',
                content:
                'We collect information that you provide directly to us,including name, email address and shipping information',
              ),
              InfoSection(
                title: 'Cookie prolicy',
                content:
                'We collect information that you provide directly to us,including name, email address and shipping information',
              ),
              const SizedBox(height: 24),
              Text(
                'Last update: March 2025',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodySmall,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
