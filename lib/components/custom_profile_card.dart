import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  // ลบ const ออกจาก constructor ตามหลักการทั่วไปของ StatelessWidget ที่รับค่ามา
  const CustomProfileCard(
      {super.key,
      required this.name,
      required this.position,
      required this.email,
      required this.phoneNumber,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.50,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage(imageUrl)), 
                const SizedBox(height: 12),
                Text(name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(position,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email, size: 16, color: Colors.blue),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(email,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight
                                  .normal) 
                          ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.green),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(phoneNumber,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight
                                  .normal) 
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
