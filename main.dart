import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class SinhVien {
  String name;
  int age;
  double gpa;

  SinhVien(this.name, this.age, this.gpa);

  String hienThiThongTin() {
    return 'Tên: $name\nTuổi: $age\nĐiểm trung bình: ${gpa.toStringAsFixed(2)}';
  }
}

void hello() {
  debugPrint('Hello Dart');
}

int tinhTong(int a, int b) {
  return a + b;
}

int tinhTongArrow(int a, int b) => a + b;

int tinhTongList(List<int> list) {
  int tong = 0;
  for (int so in list) {
    tong += so;
  }
  return tong;
}

List<int> parseList(String text) {
  final parts = text
      .split(RegExp(r'[,\s]+'))
      .where((e) => e.trim().isNotEmpty)
      .toList();

  return parts.map((e) => int.parse(e)).toList();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập Dart',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFF6F6FB),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.indigo),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Bài 1
  final name1 = TextEditingController();
  final age1 = TextEditingController();
  final gpa1 = TextEditingController();
  bool graduated1 = false;
  String result1 = '';

  // Bài 2
  final soNguyen2 = TextEditingController();
  final soThuc2 = TextEditingController();
  String result2 = '';

  // Bài 3
  final hoTen3 = TextEditingController();
  final diem3 = TextEditingController();
  String result3 = '';

  // Bài 4
  final ds4 = TextEditingController();
  String result4 = '';

  // Bài 5
  final name5 = TextEditingController();
  final age5 = TextEditingController();
  final gpa5 = TextEditingController();
  String result5 = '';

  // Bài 6
  String result6 = '';

  // Bài 7
  final a7 = TextEditingController();
  final b7 = TextEditingController();
  String result7 = '';

  // Bài 8
  final a8 = TextEditingController();
  final b8 = TextEditingController();
  String result8 = '';

  // Bài 9
  final ds9 = TextEditingController();
  String result9 = '';

  // Bài 10
  final name101 = TextEditingController();
  final age101 = TextEditingController();
  final gpa101 = TextEditingController();
  final name102 = TextEditingController();
  final age102 = TextEditingController();
  final gpa102 = TextEditingController();
  String result10 = '';

  @override
  void dispose() {
    name1.dispose();
    age1.dispose();
    gpa1.dispose();

    soNguyen2.dispose();
    soThuc2.dispose();

    hoTen3.dispose();
    diem3.dispose();

    ds4.dispose();

    name5.dispose();
    age5.dispose();
    gpa5.dispose();

    a7.dispose();
    b7.dispose();

    a8.dispose();
    b8.dispose();

    ds9.dispose();

    name101.dispose();
    age101.dispose();
    gpa101.dispose();
    name102.dispose();
    age102.dispose();
    gpa102.dispose();

    super.dispose();
  }

  void runBai1() {
    final age = int.tryParse(age1.text.trim());
    final gpa = double.tryParse(gpa1.text.trim());

    if (name1.text.trim().isEmpty || age == null || gpa == null) {
      setState(() {
        result1 = 'Vui lòng nhập đúng tên, tuổi và điểm trung bình.';
      });
      return;
    }

    String tenSinhVien = name1.text.trim();
    var tuoi = age;
    final double diemTrungBinh = gpa;
    final bool trangThaiTotNghiep = graduated1;

    setState(() {
      result1 = '''
Tên sinh viên: $tenSinhVien
Tuổi: $tuoi
Điểm trung bình: ${diemTrungBinh.toStringAsFixed(2)}
Trạng thái tốt nghiệp: $trangThaiTotNghiep
''';
    });
  }

  void runBai2() {
    final a = int.tryParse(soNguyen2.text.trim());
    final b = double.tryParse(soThuc2.text.trim());

    if (a == null || b == null) {
      setState(() {
        result2 = 'Vui lòng nhập đúng 1 số nguyên và 1 số thực.';
      });
      return;
    }

    setState(() {
      result2 = '''
Số nguyên: $a
Số thực: $b

Cộng: ${a + b}
Trừ: ${a - b}
Nhân: ${a * b}
Chia: ${a / b}
''';
    });
  }

  void runBai3() {
    final diem = double.tryParse(diem3.text.trim());

    if (hoTen3.text.trim().isEmpty || diem == null) {
      setState(() {
        result3 = 'Vui lòng nhập đúng họ tên và điểm.';
      });
      return;
    }

    bool dau = diem >= 5;

    setState(() {
      result3 = '''
Họ tên: ${hoTen3.text.trim()}
Điểm: $diem
Biến bool: $dau
Kết quả: ${dau ? "Sinh viên đậu" : "Sinh viên rớt"}
''';
    });
  }

  void runBai4() {
    try {
      List<int> list = parseList(ds4.text);
      if (list.length != 5) {
        setState(() {
          result4 = 'Vui lòng nhập đúng 5 số nguyên. Ví dụ: 1, 2, 3, 4, 5';
        });
        return;
      }

      int tong = 0;
      for (int so in list) {
        tong += so;
      }

      setState(() {
        result4 = '''
Danh sách: $list
Phần tử đầu tiên: ${list.first}
Phần tử cuối cùng: ${list.last}
Tổng các phần tử: $tong
''';
      });
    } catch (_) {
      setState(() {
        result4 = 'Dữ liệu không hợp lệ.';
      });
    }
  }

  void runBai5() {
    final age = int.tryParse(age5.text.trim());
    final gpa = double.tryParse(gpa5.text.trim());

    if (name5.text.trim().isEmpty || age == null || gpa == null) {
      setState(() {
        result5 = 'Vui lòng nhập đúng tên, tuổi và GPA.';
      });
      return;
    }

    Map<String, dynamic> sinhVien = {
      'name': name5.text.trim(),
      'age': age,
      'gpa': gpa,
    };

    setState(() {
      result5 = '''
Toàn bộ Map: $sinhVien

Tên sinh viên: ${sinhVien['name']}
Tuổi: ${sinhVien['age']}
Điểm trung bình: ${sinhVien['gpa']}
''';
    });
  }

  void runBai6() {
    hello();
    setState(() {
      result6 = 'Hello Dart';
    });
  }

  void runBai7() {
    final a = int.tryParse(a7.text.trim());
    final b = int.tryParse(b7.text.trim());

    if (a == null || b == null) {
      setState(() {
        result7 = 'Vui lòng nhập đúng 2 số nguyên.';
      });
      return;
    }

    setState(() {
      result7 = 'tinhTong($a, $b) = ${tinhTong(a, b)}';
    });
  }

  void runBai8() {
    final a = int.tryParse(a8.text.trim());
    final b = int.tryParse(b8.text.trim());

    if (a == null || b == null) {
      setState(() {
        result8 = 'Vui lòng nhập đúng 2 số nguyên.';
      });
      return;
    }

    setState(() {
      result8 = '''
tinhTongArrow($a, $b) = ${tinhTongArrow(a, b)}

Nhận xét:
- Hàm thường dùng khi có nhiều bước xử lý.
- Arrow function dùng khi hàm ngắn gọn, chỉ có 1 biểu thức.
''';
    });
  }

  void runBai9() {
    try {
      List<int> list = parseList(ds9.text);
      int tong = tinhTongList(list);

      setState(() {
        result9 = '''
Danh sách: $list
Tổng các phần tử: $tong
''';
      });
    } catch (_) {
      setState(() {
        result9 = 'Dữ liệu không hợp lệ.';
      });
    }
  }

  void runBai10() {
    final ageSv1 = int.tryParse(age101.text.trim());
    final gpaSv1 = double.tryParse(gpa101.text.trim());
    final ageSv2 = int.tryParse(age102.text.trim());
    final gpaSv2 = double.tryParse(gpa102.text.trim());

    if (name101.text.trim().isEmpty ||
        ageSv1 == null ||
        gpaSv1 == null ||
        name102.text.trim().isEmpty ||
        ageSv2 == null ||
        gpaSv2 == null) {
      setState(() {
        result10 = 'Vui lòng nhập đầy đủ thông tin của 2 sinh viên.';
      });
      return;
    }

    SinhVien sv1 = SinhVien(name101.text.trim(), ageSv1, gpaSv1);
    SinhVien sv2 = SinhVien(name102.text.trim(), ageSv2, gpaSv2);

    setState(() {
      result10 = '''
Sinh viên 1:
${sv1.hienThiThongTin()}

Sinh viên 2:
${sv2.hienThiThongTin()}
''';
    });
  }

  Widget appField(
      String label,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
        String? hint,
        IconData? icon,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }

  Widget resultBox(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text.isEmpty ? 'Chưa có kết quả' : text,
        style: const TextStyle(fontSize: 15, height: 1.5),
      ),
    );
  }

  Widget actionButtons({
    required VoidCallback onRun,
    required VoidCallback onClear,
    String runText = 'Thực hiện',
  }) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ElevatedButton.icon(
          onPressed: onRun,
          icon: const Icon(Icons.play_arrow),
          label: Text(runText),
        ),
        OutlinedButton.icon(
          onPressed: onClear,
          icon: const Icon(Icons.refresh),
          label: const Text('Xóa kết quả'),
        ),
      ],
    );
  }

  Widget cardBai({
    required String title,
    required String description,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo.shade50,
                child: Icon(icon, color: Colors.indigo),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập Dart có giao diện'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            cardBai(
              title: 'Bài 1: Khai báo và sử dụng biến',
              description:
              'Nhập tên, tuổi, điểm trung bình và trạng thái tốt nghiệp rồi in thông tin ra màn hình.',
              icon: Icons.badge_outlined,
              children: [
                appField(
                  'Tên sinh viên',
                  name1,
                  icon: Icons.person_outline,
                ),
                appField(
                  'Tuổi',
                  age1,
                  keyboardType: TextInputType.number,
                  icon: Icons.cake_outlined,
                ),
                appField(
                  'Điểm trung bình',
                  gpa1,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  icon: Icons.school_outlined,
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Trạng thái tốt nghiệp'),
                  subtitle: Text(
                    graduated1 ? 'Đã tốt nghiệp' : 'Chưa tốt nghiệp',
                  ),
                  value: graduated1,
                  onChanged: (value) {
                    setState(() {
                      graduated1 = value;
                    });
                  },
                ),
                actionButtons(
                  onRun: runBai1,
                  onClear: () {
                    setState(() {
                      result1 = '';
                    });
                  },
                  runText: 'Hiển thị',
                ),
                resultBox(result1),
              ],
            ),
            cardBai(
              title: 'Bài 2: Thực hiện phép toán với số',
              description:
              'Nhập 1 số nguyên và 1 số thực. Hệ thống sẽ tính cộng, trừ, nhân, chia.',
              icon: Icons.calculate_outlined,
              children: [
                appField(
                  'Số nguyên',
                  soNguyen2,
                  keyboardType: TextInputType.number,
                  icon: Icons.looks_one_outlined,
                ),
                appField(
                  'Số thực',
                  soThuc2,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  icon: Icons.pin_outlined,
                ),
                actionButtons(
                  onRun: runBai2,
                  onClear: () {
                    setState(() {
                      result2 = '';
                    });
                  },
                  runText: 'Tính toán',
                ),
                resultBox(result2),
              ],
            ),
            cardBai(
              title: 'Bài 3: Kiểm tra đậu/rớt',
              description:
              'Nhập họ tên và điểm. Hệ thống tự xác định sinh viên đậu hay rớt.',
              icon: Icons.rule_outlined,
              children: [
                appField(
                  'Họ tên',
                  hoTen3,
                  icon: Icons.person_outline,
                ),
                appField(
                  'Điểm',
                  diem3,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  icon: Icons.star_border_outlined,
                ),
                actionButtons(
                  onRun: runBai3,
                  onClear: () {
                    setState(() {
                      result3 = '';
                    });
                  },
                  runText: 'Kiểm tra',
                ),
                resultBox(result3),
              ],
            ),
            cardBai(
              title: 'Bài 4: Làm việc với List',
              description:
              'Nhập đúng 5 số nguyên, cách nhau bằng dấu phẩy. Ví dụ: 1, 2, 3, 4, 5',
              icon: Icons.format_list_numbered_outlined,
              children: [
                appField(
                  'Danh sách 5 số',
                  ds4,
                  hint: 'Ví dụ: 1, 2, 3, 4, 5',
                  icon: Icons.list_alt_outlined,
                ),
                actionButtons(
                  onRun: runBai4,
                  onClear: () {
                    setState(() {
                      result4 = '';
                    });
                  },
                  runText: 'Xử lý List',
                ),
                resultBox(result4),
              ],
            ),
            cardBai(
              title: 'Bài 5: Làm việc với Map',
              description:
              'Nhập thông tin sinh viên để tạo Map và in từng giá trị riêng.',
              icon: Icons.account_tree_outlined,
              children: [
                appField(
                  'Tên sinh viên',
                  name5,
                  icon: Icons.person_outline,
                ),
                appField(
                  'Tuổi',
                  age5,
                  keyboardType: TextInputType.number,
                  icon: Icons.cake_outlined,
                ),
                appField(
                  'GPA',
                  gpa5,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  icon: Icons.school_outlined,
                ),
                actionButtons(
                  onRun: runBai5,
                  onClear: () {
                    setState(() {
                      result5 = '';
                    });
                  },
                  runText: 'Tạo Map',
                ),
                resultBox(result5),
              ],
            ),
            cardBai(
              title: 'Bài 6: Hàm không có tham số',
              description: 'Nhấn nút để gọi hàm hello() và in kết quả.',
              icon: Icons.waving_hand_outlined,
              children: [
                actionButtons(
                  onRun: runBai6,
                  onClear: () {
                    setState(() {
                      result6 = '';
                    });
                  },
                  runText: 'Gọi hello()',
                ),
                resultBox(result6),
              ],
            ),
            cardBai(
              title: 'Bài 7: Hàm có tham số và trả về',
              description: 'Nhập 2 số nguyên để tính tổng bằng hàm tinhTong().',
              icon: Icons.functions_outlined,
              children: [
                appField(
                  'Số a',
                  a7,
                  keyboardType: TextInputType.number,
                  icon: Icons.filter_1_outlined,
                ),
                appField(
                  'Số b',
                  b7,
                  keyboardType: TextInputType.number,
                  icon: Icons.filter_2_outlined,
                ),
                actionButtons(
                  onRun: runBai7,
                  onClear: () {
                    setState(() {
                      result7 = '';
                    });
                  },
                  runText: 'Tính tổng',
                ),
                resultBox(result7),
              ],
            ),
            cardBai(
              title: 'Bài 8: Arrow function',
              description:
              'Nhập 2 số nguyên để tính tổng bằng arrow function.',
              icon: Icons.bolt_outlined,
              children: [
                appField(
                  'Số a',
                  a8,
                  keyboardType: TextInputType.number,
                  icon: Icons.filter_1_outlined,
                ),
                appField(
                  'Số b',
                  b8,
                  keyboardType: TextInputType.number,
                  icon: Icons.filter_2_outlined,
                ),
                actionButtons(
                  onRun: runBai8,
                  onClear: () {
                    setState(() {
                      result8 = '';
                    });
                  },
                  runText: 'Tính bằng arrow',
                ),
                resultBox(result8),
              ],
            ),
            cardBai(
              title: 'Bài 9: Hàm xử lý danh sách',
              description:
              'Nhập một danh sách số nguyên để tính tổng các phần tử.',
              icon: Icons.summarize_outlined,
              children: [
                appField(
                  'Danh sách số',
                  ds9,
                  hint: 'Ví dụ: 4, 5, 6, 7',
                  icon: Icons.playlist_add_check_circle_outlined,
                ),
                actionButtons(
                  onRun: runBai9,
                  onClear: () {
                    setState(() {
                      result9 = '';
                    });
                  },
                  runText: 'Tính tổng List',
                ),
                resultBox(result9),
              ],
            ),
            cardBai(
              title: 'Bài 10: Xây dựng lớp SinhVien',
              description:
              'Nhập thông tin của 2 sinh viên rồi tạo đối tượng từ class.',
              icon: Icons.groups_outlined,
              children: [
                const Text(
                  'Thông tin sinh viên 1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                appField(
                  'Tên sinh viên 1',
                  name101,
                  icon: Icons.person_outline,
                ),
                appField(
                  'Tuổi sinh viên 1',
                  age101,
                  keyboardType: TextInputType.number,
                  icon: Icons.cake_outlined,
                ),
                appField(
                  'GPA sinh viên 1',
                  gpa101,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  icon: Icons.school_outlined,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Thông tin sinh viên 2',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                appField(
                  'Tên sinh viên 2',
                  name102,
                  icon: Icons.person_outline,
                ),
                appField(
                  'Tuổi sinh viên 2',
                  age102,
                  keyboardType: TextInputType.number,
                  icon: Icons.cake_outlined,
                ),
                appField(
                  'GPA sinh viên 2',
                  gpa102,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  icon: Icons.school_outlined,
                ),
                actionButtons(
                  onRun: runBai10,
                  onClear: () {
                    setState(() {
                      result10 = '';
                    });
                  },
                  runText: 'Tạo sinh viên',
                ),
                resultBox(result10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}