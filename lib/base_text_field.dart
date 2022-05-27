import 'package:flutter/material.dart';


class BaseTextField extends StatelessWidget {
  double width;
  double space;
  String hintText;
  String? imgPath;
  String rightText;
  bool isShow;
  TextStyle? textStyle;
  bool obscureText;
  TextInputType keyboardType;
  TextEditingController controller;
  Function? confirm;

  BaseTextField(
      {Key? key,
        required this.width,
        this.space = 20,
        this.hintText = '',
        this.obscureText = false,
        this.keyboardType=TextInputType.text,
        required this.controller,
        this.textStyle,
        this.imgPath,
        this.isShow = false,
        this.rightText = '',
        this.confirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 55,
        child: Row(
          children: [
            Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  style: textStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: space),
                    hintText: hintText,
                    hintStyle: textStyle,
                    border: InputBorder.none,
                  ),
                )),
            Offstage(
                offstage: !isShow,
                child: TextImageButton(
                  imgPath: imgPath!,
                  text: rightText,
                  confirm: (){
                    confirm?.call();
                  },
                ))
          ],
        ));
  }
}

class TextImageButton extends StatelessWidget {
  String? imgPath;
  String? imgDisabledPath;
  String text;
  double imageWidth;
  double imageHeight;
  Function? confirm;
  bool isEnabled;
  Color? color;

  TextImageButton(
      {Key? key,
        this.imgPath,
        this.text = '',
        this.imageWidth = 100,
        this.imageHeight = 25,
        this.confirm,
        this.isEnabled = true,
        this.imgDisabledPath,
        this.color=Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // 设置背景颜色 默认矩形
      GestureDetector(
          onTap: () {
            if (isEnabled!) {
              confirm?.call();
            } else {}
          },
          child: Container(
            width: imageWidth,
            height: imageHeight,
            padding: const EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isEnabled ? imgPath!: imgDisabledPath!),
                  fit: BoxFit.fill),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: color, fontSize: 14),
            ),
            // color: Colors.transparent,
          ));
  }
}
