import 'dart:io';

void main() {
  int allDaysInTraining = 270;

   print('Bitte gib deinen Namen ein:');
  String? name = stdin.readLineSync();

  greet(name);
  num? daysInTraining = inputDays();

  if (daysInTraining != null && daysInTraining < allDaysInTraining) {
    print('Du hast $daysInTraining von $allDaysInTraining absolviert.');

    num precent = daysInPercent(daysInTraining, allDaysInTraining);
    print('Das entspricht einem Fortschritt von ${precent.toStringAsFixed(2)}%.');

    num remaining = remainingDays(daysInTraining, allDaysInTraining);
    print('Es bleiben noch $remaining Tage übrig');

    milestones(precent);
  } else if (daysInTraining == allDaysInTraining) {
    print('Herzlichen Glückwunsch Sie haben den Kurs vollständig absolviert!');
  } else {
    print('Ungültige Eingabe!');
  }
  
}

//---------------------------------------------------------------------------------//
//    functions
void greet(String? name) {
  print('Willkommen $name zu deinem Kursfortschrittsrechner');
}

num? inputDays() {
  print('Bitte gib die Tage ein, die du schon im Kurs absolviert hast:');
  //das gleich wie // return int.tryParse(stdin.readLineSync() ?? '0');
  String? input = stdin.readLineSync();
  if (input!.isEmpty){
    print('Das ist ein Fehler, keine Eingabe');
    return inputDays();
  } else if (int.tryParse(input) == null){
      print('Ungültige Eingabe');
      return inputDays();
  } else {
    return int.parse(input);
  }
  
  /* kurze version
  return int.tryParse(stdin.readLineSync() ?? '0');
  */
  }

num daysInPercent(num daysInTraining, num allDaysInTraining) {
  return (daysInTraining / allDaysInTraining) * 100;
  
}

num remainingDays(num daysInTraining, num allDaysInTraining) {
  return allDaysInTraining - daysInTraining;
   
}

void milestones(percent){
  if (percent == 100){
    print('Du hast einen Meilenstein von 100% erreicht');
  } else if (percent >= 75 && percent < 100){
      print('Du hast einen Meilenstein von 75% erreicht');
  } else if (percent >= 50 && percent < 75){
      print('Du hast einen Meilenstein von 50% erreicht');
  } else if (percent >= 25 && percent < 50){
      print('Du hast einen Meilenstein von 25% erreicht');
  } else {
      print('Du hast noch keinen Meilenstein erreicht');
  }
}