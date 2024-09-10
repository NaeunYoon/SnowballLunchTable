import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class RandomImage extends StatefulWidget {
  const RandomImage({super.key});

  @override
  State<RandomImage> createState() => _RandomImageState();
}

class _RandomImageState extends State<RandomImage> {
  final List<String> _imageUrls = [
    'http://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2019/09/27/20190927000594_0.jpg',
    'https://img.daily.co.kr/@files/www.daily.co.kr/content/food/2020/20200730/40d0fb3794229958bdd1e36520a4440f.jpg',
    'https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg',
    'https://src.hidoc.co.kr/image/lib/2020/11/9/1604911318873_0.jpg',
    'https://www.shutterstock.com/ko/blog/wp-content/uploads/sites/17/2018/11/shutterstock_1181891455.jpg',
  ];

  int _currentIndex = 0;
  String? _currentImageUrl;
  Timer? _timer;
  bool _isRunning = true;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _currentImageUrl = _imageUrls[_currentIndex];
    Future.delayed(const Duration(milliseconds: 500), () {
      _startImageRotation();
    });
  }

  void _startImageRotation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _currentImageUrl = _imageUrls[_currentIndex];
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
    });
  }

  void _stopImageRotation() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _currentImageUrl = _imageUrls[_random.nextInt(_imageUrls.length)];
      _isRunning = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // 위젯이 파괴될 때 타이머 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(231, 206, 179, 1),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        title: const Text(
          '랜덤 돌리기',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(219, 187, 159, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!_isRunning)
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  '★ 당첨 ★',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            if (_currentImageUrl != null)
              Image.network(
                _currentImageUrl!,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            else
              const Text('No image '),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRunning ? _stopImageRotation : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Stop',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
