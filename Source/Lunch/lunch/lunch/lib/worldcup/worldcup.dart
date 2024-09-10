import 'package:flutter/material.dart';

class Worldcup extends StatefulWidget {
  const Worldcup({super.key});

  @override
  State<Worldcup> createState() => _WorldcupState();
}

class _WorldcupState extends State<Worldcup> {
  // 예시 데이터: 이미지 경로와 이름 리스트 (초기 라운드)
  List<Map<String, String>> contestants = [
    {'image': 'assets/images/food1.jpg', 'name': '삼겹살'},
    {'image': 'assets/images/food2.jpg', 'name': '떡볶이'},
    {'image': 'assets/images/food3.jpg', 'name': '피자'},
    {'image': 'assets/images/food4.jpg', 'name': '짜장면'},
    {'image': 'assets/images/food5.jpg', 'name': '라면'},
    {'image': 'assets/images/food6.jpg', 'name': '김치찌개'},
    {'image': 'assets/images/food7.jpg', 'name': '치킨'},
    {'image': 'assets/images/food8.jpg', 'name': '돈까스'},
  ];

  // 현재 라운드에서 선택된 항목을 추적
  List<Map<String, String>> selectedContestants = [];
  // 현재 표시 중인 라운드의 이미지들 (한 라운드씩 진행)
  List<Map<String, String>> currentRoundContestants = [];
  // 트래킹할 라운드
  int round = 8; // 시작은 8강

  @override
  void initState() {
    super.initState();
    // 초기 라운드 참가자를 설정
    _prepareNextRound();
  }

  // 라운드마다 필요한 선택 횟수를 반환
  int _getRequiredSelections() {
    switch (round) {
      case 8:
        return 4;
      case 4:
        return 2;
      case 2:
        return 1;
      default:
        return 0;
    }
  }

  // 라운드마다 2개의 이미지만을 보여주기 위해서 설정
  void _prepareNextRound() {
    if (contestants.length >= 2) {
      setState(() {
        currentRoundContestants = contestants.sublist(0, 2);
        contestants.removeRange(0, 2);
      });
    } else if (selectedContestants.length == 1) {
      // 최종 우승자가 결정되면 다이얼로그 표시
      _showWinnerDialog(selectedContestants[0]);
    }
  }

  // 이미지 선택 핸들러
  void _onImageSelected(Map<String, String> selected) {
    setState(() {
      selectedContestants.add(selected);

      // 선택한 이미지 수가 라운드 필요 선택 수에 도달하면 다음 라운드로
      if (selectedContestants.length == _getRequiredSelections()) {
        // 다음 라운드를 설정
        if (round > 2) {
          setState(() {
            contestants = [...selectedContestants];
            selectedContestants = [];
            round = round ~/ 2; // 다음 라운드로 감
            _prepareNextRound();
          });
        } else if (round == 2) {
          // 결승은 1번 클릭 후 우승자를 보여줌
          _showWinnerDialog(selectedContestants[0]);
        }
      } else {
        // 다음 두 명을 준비
        _prepareNextRound();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(231, 206, 179, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(219, 187, 159, 1),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        title: Center(
          child: Text(
            round == 2 ? '결승 이상형 월드컵' : '$round강 이상형 월드컵',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 한 줄에 두 개씩 보여줌
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: currentRoundContestants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _onImageSelected(currentRoundContestants[index]);
                    },
                    child: Stack(
                      children: [
                        // 이미지 표시
                        Positioned.fill(
                          child: Image.asset(
                            currentRoundContestants[index]['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // 이미지 위에 이름 표시
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Center(
                            child: Stack(
                              children: [
                                // 흰색 테두리 글자
                                Text(
                                  currentRoundContestants[index]['name']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                // 검은색 본문 글자
                                Text(
                                  currentRoundContestants[index]['name']!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // 선택된 항목일 경우 체크 아이콘 추가
                        if (selectedContestants
                            .contains(currentRoundContestants[index]))
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 우승자를 보여주는 다이얼로그
  void _showWinnerDialog(Map<String, String> winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('최종 우승자'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(winner['image']!),
            Text(
              winner['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
