import 'package:drgoblin/widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          const Center(
            child: Text(
              "로그인",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          const InputText(
            hintText: '아이디를 입력해주세요.',
          ),
          const SizedBox(height: 50),
          const InputText(
            hintText: '비밀번호를 입력해주세요',
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 400),
            child: SizedBox(
              width: 600,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15), // 버튼 높이
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String hintText;
  const InputText({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 400),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
