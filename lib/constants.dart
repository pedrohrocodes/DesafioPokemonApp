import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const kNormalColor = Color(0xFFA8A77A);
const kGrassColor = Color(0xFF7AC74C);
const kFireColor = Color(0xFFEE8130);
const kWaterColor = Color(0xFF6390F0);
const kElectricColor = Color(0xFFF7D02C);
const kIceColor = Color(0xFF96D9D6);
const kFightingColor = Color(0xFFC22E28);
const kPoisonColor = Color(0xFFA33EA1);
const kGroundColor = Color(0xFFE2BF65);
const kFlyingColor = Color(0xFFA98FF3);
const kPsychicColor = Color(0xFFF95587);
const kBugColor = Color(0xFFA6B91A);
const kRockColor = Color(0xFFB6A136);
const kGhostColor = Color(0xFF735797);
const kDragonColor = Color(0xFF6F35FC);
const kDarkColor = Color(0xFF705746);
const kSteelColor = Color(0xFFB7B7CE);
const kFairyColor = Color(0xFFD685AD);

const kNormalBackgroundColor = Color(0xFFC5C4A2); //
const kGrassBackgroundColor = Color(0xFF90CAA5); //
const kFireBackgroundColor = Color(0xFFF2CBA0); //
const kWaterBackgroundColor = Color(0xFF8FACC9); //
const kElectricBackgroundColor = Color(0xFFebd781); //
const kIceBackgroundColor = Color(0xFFa5cdcb); //
const kFightingBackgroundColor = Color(0xFFca9492); //
const kPoisonBackgroundColor = Color(0xFFCC92CB); //
const kGroundBackgroundColor = Color(0xFFb0985b); //
const kFlyingBackgroundColor = Color(0xFFa293ca); //
const kPsychicBackgroundColor = Color(0xFFca96a6); //
const kBugBackgroundColor = Color(0xFFBAC376); //
const kRockBackgroundColor = Color(0xFFcac193); //
const kGhostBackgroundColor = Color(0xFFa990c9); //
const kDragonBackgroundColor = Color(0xFFa293c9); //
const kDarkBackgroundColor = Color(0xFFcba992); //
const kSteelBackgroundColor = Color(0xFFcfcfdd); //
const kFairyBackgroundColor = Color(0xFFc4a3b3); //

Color colorByType(String type) {
  type = type.toLowerCase();

  switch (type) {
    case 'normal':
      return kNormalColor;
      break;
    case 'fire':
      return kFireColor;
      break;
    case 'water':
      return kWaterColor;
      break;
    case 'electric':
      return kElectricColor;
      break;
    case 'grass':
      return kGrassColor;
      break;
    case 'ice':
      return kIceColor;
      break;
    case 'fighting':
      return kFightingColor;
      break;
    case 'poison':
      return kPoisonColor;
      break;
    case 'ground':
      return kGroundColor;
      break;
    case 'flying':
      return kFlyingColor;
      break;
    case 'psychic':
      return kPsychicColor;
      break;
    case 'bug':
      return kBugColor;
      break;
    case 'rock':
      return kRockColor;
      break;
    case 'ghost':
      return kGhostColor;
      break;
    case 'dragon':
      return kDragonColor;
      break;
    case 'dark':
      return kDarkColor;
      break;
    case 'steel':
      return kSteelColor;
      break;
    case 'fairy':
      return kFairyColor;
      break;
    default:
      return Colors.grey;
      break;
  }
}

Color backgroundColorByType(String type) {
  type = type.toLowerCase();

  switch (type) {
    case 'normal':
      return kNormalBackgroundColor;
      break;
    case 'fire':
      return kFireBackgroundColor;
      break;
    case 'water':
      return kWaterBackgroundColor;
      break;
    case 'electric':
      return kElectricBackgroundColor;
      break;
    case 'grass':
      return kGrassBackgroundColor;
      break;
    case 'ice':
      return kIceBackgroundColor;
      break;
    case 'fighting':
      return kFightingBackgroundColor;
      break;
    case 'poison':
      return kPoisonBackgroundColor;
      break;
    case 'ground':
      return kGroundBackgroundColor;
      break;
    case 'flying':
      return kFlyingBackgroundColor;
      break;
    case 'psychic':
      return kPsychicBackgroundColor;
      break;
    case 'bug':
      return kBugBackgroundColor;
      break;
    case 'rock':
      return kRockBackgroundColor;
      break;
    case 'ghost':
      return kGhostBackgroundColor;
      break;
    case 'dragon':
      return kDragonBackgroundColor;
      break;
    case 'dark':
      return kDarkBackgroundColor;
      break;
    case 'steel':
      return kSteelBackgroundColor;
      break;
    case 'fairy':
      return kFairyBackgroundColor;
      break;
    default:
      return Colors.grey;
      break;
  }
}

SvgPicture iconByType(String type, Color color, double size) {
  type = type.toLowerCase();
  return SvgPicture.asset(
    'assets/icons/$type.svg',
    color: color,
    height: size,
  );
}
