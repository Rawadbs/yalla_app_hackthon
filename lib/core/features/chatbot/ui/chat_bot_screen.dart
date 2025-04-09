import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yalla_app_hackthon/core/networking/networking.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/resources/styles.dart';
import 'package:yalla_app_hackthon/core/widgets/app_text_form.dart';
import 'package:intl/intl.dart' as intl;

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({
    super.key,
  });

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [];

  void sendMessage(String text) async {
    setState(() {
      messages.add({"text": text, "isUser": true});
      _controller.clear();
    });

    final reply = await AIChatService.askGemini(text);

    setState(() {
      messages.add({"text": reply, "isUser": false});
    });
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        intl.DateFormat('EEEE، d MMMM', 'ar').format(DateTime.now());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorsManger.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 112.h,
                width: double.infinity,
                color: ColorsManger.primaryColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorsManger.bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(formattedDate, style: TextStyles.font14BoldBlack),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msg = messages[index];
                            final isUser = msg['isUser'] as bool;

                            return Row(
                              mainAxisAlignment: isUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                if (!isUser)
                                  CircleAvatar(
                                      backgroundColor:
                                          ColorsManger.primaryColor,
                                      child: SvgPicture.asset(
                                        'assets/icons/chat.svg',
                                      )),
                                if (!isUser) const SizedBox(width: 8),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    decoration: BoxDecoration(
                                      color: isUser
                                          ? const Color(0xFF3F47C6)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          msg['text'],
                                          style: TextStyle(
                                            color: isUser
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isUser) const SizedBox(width: 8),
                                if (isUser)
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://i.pravatar.cc/101'),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                controller: _controller,
                                hintText: 'اكتب رسالتك',
                                validator: (value) {},
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (_controller.text.isNotEmpty) {
                                      sendMessage(_controller.text);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 17),
                                    child: SvgPicture.asset(
                                        'assets/icons/sent.svg'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
