import 'package:flutter/material.dart';


class Footer extends StatefulWidget{
 const Footer();

 @override
 _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
 int _selectedIndex = 0;
 final _bottomNavigationBarItems =  <BottomNavigationBarItem>[];

  // アイコン情報
 static const _footerIcons = [
   Icons.home,
   Icons.camera_enhance,
   Icons.work,
 ];

  // アイコン文字列
 static const _footerItemNames = [
   'ホーム',
   'カメラ',
   'テスト',
 ];

 @override
 void initState() {
   super.initState();
   _bottomNavigationBarItems.add(_updateactivestate(0));
   for ( var i = 1; i < _footerItemNames.length; i++) {
     _bottomNavigationBarItems.add(_updatedeactivestate(i));
   }
 }

 /// インデックスのアイテムをアクティベートする
 BottomNavigationBarItem _updateactivestate(int index) {
   return BottomNavigationBarItem(
     icon: Icon(
       _footerIcons[index],
       color: Colors.red,
     ),
     title: Text(
       _footerItemNames[index],
       style: TextStyle(
         color: Colors.red,
       ),
     )
   );
 }

 /// インデックスのアイテムをディアクティベートする
 BottomNavigationBarItem _updatedeactivestate(int index) {
   return BottomNavigationBarItem(
       icon: Icon(
         _footerIcons[index],
         color: Colors.red,
       ),
       title: Text(
         _footerItemNames[index],
         style: TextStyle(
           color: Colors.red,
         ),
       )
   );
 }

 void _onItemTapped(int index) {
   setState(() {
     _bottomNavigationBarItems[_selectedIndex] = _updatedeactivestate(_selectedIndex);
     _bottomNavigationBarItems[index] = _updateactivestate(index);
     _selectedIndex = index;
   });
	  }

 @override
 Widget build(BuildContext context) {
   return BottomNavigationBar(
     type: BottomNavigationBarType.fixed, // これを書かないと3つまでしか表示されない
     items: _bottomNavigationBarItems,
     currentIndex: _selectedIndex,
     onTap: _onItemTapped,
   );
 }
}