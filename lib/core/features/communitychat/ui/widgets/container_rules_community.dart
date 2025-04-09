import 'package:flutter/material.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';

class ContainerRulesCommunity extends StatelessWidget {
  const ContainerRulesCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('شروط المجتمع', style: TextStyles.font14BoldBlack),
          ),
          const SizedBox(height: 12),
          Text('المادة الأولى:', style: TextStyles.font14BoldBlack),
          const SizedBox(height: 8),
          const Text(
            'نص افتراضي نص افتراضي نص افتراضي نص افتراضي نص افتراضي ...',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 12),
          Text('تنويه:', style: TextStyles.font14BoldBlack),
          const SizedBox(height: 8),
          const Text(
            'نص افتراضي نص افتراضي نص افتراضي نص افتراضي نص افتراضي ...',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
