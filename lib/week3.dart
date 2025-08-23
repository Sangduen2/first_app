import 'package:flutter/material.dart';

class week3 extends StatelessWidget {
  const week3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Stack(
          children: [
            Container(
              //color: Colors.red,
              height: 400, 
              width: 320,
              decoration: 
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)

                 )
            ),
              
            Positioned(
              top:40,
              left: 110,
              child: Container(
                height: 100, 
                width: 100,
                decoration: 
                  BoxDecoration(shape: BoxShape.circle, color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0,5),
                    ),
                  ],
                  ),
                
                child: ClipOval(
                  child: Image.network(
                    'https://scontent.fbkk7-2.fna.fbcdn.net/v/t39.30808-6/471374885_2617408588456588_2604379789553647314_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=LogEQxXyV1EQ7kNvwF0waml&_nc_oc=Admx9RlxEsZoks8R_SEFsHZl8k_iF96i7Q3oWD_Q4RJpbCzMkfu9tIf9Gy2umYcmfqg&_nc_zt=23&_nc_ht=scontent.fbkk7-2.fna&_nc_gid=iLt5WD8fX8B8k1CMccBCoA&oh=00_AfX0Y5YwwxER6S2Z4BGHlVPJJp5iewi3fzrKj5p-fIvscQ&oe=68AF42C0',
                      fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top:160,
              left: 20,
              right: 20,
              child:Center(
                  child: Text('Sasima Phangyang \n650710722 \nIT' ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
              ),
                
             ),
            ),
            Positioned(
              top:300,
              left: 20,
              right: 20,
              child:Center(
                  child: Text('สวัสดี ฉันมีชื่อเล่นว่า แสงเดือน ตอนนี้ฉันกำลังเรียนอยู่ปี 4 ละนะ ' ,
                  style: TextStyle(
                    fontSize: 18),
                    textAlign: TextAlign.center,
              ),
                
             ),
            ),
            
            
            
          ],
        ),
      ),
        
    );
          
  }
}
//trailing: Image.asset(
             // 'cat.jpg',
             // height: 80,
             // width: 80,
            //)