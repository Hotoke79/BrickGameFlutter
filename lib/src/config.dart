import 'package:flutter/cupertino.dart';

const brickColors = [
  Color(0xfff94144),
  Color(0xfff3722c),
  Color(0xfff8961e),
  Color(0xfff9c74f),
  Color(0xff90be6d),
  Color(0xff43aa8b),
  Color(0xff4d908e),
  Color(0xff277da1),
  Color(0xff577590),
];

const gameWidth = 340.0;
const gameHeight = 740.0;
const ballRadius = gameWidth * 0.02;
const batWidth = gameWidth*0.2;
const batHeight = ballRadius*2;
const batStep = gameWidth*0.05;
const brickGutter = gameWidth*0.015;
//const brickWidth =(gameWidth - (brickGutter * (brickColors.length + 1)))/brickColors.length;
const brickWidth = (gameWidth-(brickGutter*(10)))/9;
const brickHeight = gameHeight*0.03;
const difficultyModifier = 1.03;
