import 'dart:io';
int allDaysInTraining = 175;
int uxUi = 25;
int coding = 23;
int flutterI = 46;
int flutterII = 25;
int flutterIII = 22;
int amv = 20;
void main() {
  

  String? name = userInputName();

  greet(name);
  int? daysInTraining = inputDays();

  if (daysInTraining < allDaysInTraining) {
    print('Du hast $daysInTraining von $allDaysInTraining absolviert.');

    double precent = daysInPercent(daysInTraining, allDaysInTraining);
    print('Fortschritt: ${precent.toStringAsFixed(2)}%.');
    print(progressBar(precent));

    int remaining = remainingDays(daysInTraining, allDaysInTraining);
    print('Es bleiben noch $remaining Tage übrig');

    
    category(daysInTraining);
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

String? userInputName() {
  print('Bitte gib deinen Namen ein:');
  String? name = stdin.readLineSync();
  if (name!.isEmpty) {
    print('Das ist ein Fehler, keine Eingabe');
    return userInputName();
  } else {
    return name;
  }
}

int inputDays() {
  print('Bitte gib die Tage ein, die du schon im Kurs absolviert hast:');
  //fast das gleich wie // return int.tryParse(stdin.readLineSync() ?? '0');
  // hier wird die funktion erneut aufgerufen, bei ungültiger Eingabe
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
  
  // kurze version
  
  // return int.tryParse(stdin.readLineSync() ?? '0');
}

double daysInPercent(int daysInTraining, int allDaysInTraining) {
  return (daysInTraining / allDaysInTraining) * 100;
}

int remainingDays(int daysInTraining, int allDaysInTraining) {
  return allDaysInTraining - daysInTraining;
}

void milestones(double percent) {
  if (percent == 100) {
    print('Du hast einen Meilenstein von 100% erreicht');
  } else if (percent > 75) {
    print('Du hast einen Meilenstein von 75% erreicht');
  } else if (percent > 50) {
    print('Du hast einen Meilenstein von 50% erreicht');
  } else if (percent > 25) {
    print('Du hast einen Meilenstein von 25% erreicht');
  } else {
    print('Du hast noch keinen Meilenstein erreicht');
  }
}


void category(int currentDays) {
  if ( currentDays == allDaysInTraining) {
    print('Herzlichen Glückwunsch! \nDu hast alle Module abgeschlossen');
  } else if (currentDays > allDaysInTraining - amv) {
    print('Du hast das Modul FlutterIII abgeschlossen.\nDu befindest dich aktuell im Modul AMV.');
  } else if (currentDays > allDaysInTraining - amv - flutterIII) {
    print('Du hast das Modul FlutterII abgeschlossen.\nDu befindest dich aktuell im Modul FlutterIII.');
  } else if (currentDays > allDaysInTraining - amv - flutterIII - flutterII) {
    print('Du hast das Modul FlutterI abgeschlossen.\nDu befindest dich aktuell im Modul FlutterII.');
  } else if (currentDays > allDaysInTraining - amv - flutterIII -flutterII - flutterI) {
    print('Du hast das Modul Coding abgeschlossen.\nDu befindest dich aktuell im Modul FlutterI.');
  } else if (currentDays > allDaysInTraining - amv - flutterIII -flutterII - flutterI - coding) {
    print('Du hast das Modul UX/UI abgeschlossen.\nDu befindest dich aktuell im Modul Coding.');
  } else if (currentDays > allDaysInTraining - amv - flutterIII -flutterII - flutterI - coding - uxUi) {
    print('Du hast das Modul ECO abgeschlossen.\nDu befindest dich aktuell im Modul UX/UI.');
  } else {
    print('Du hast noch kein Modul abgeschlossen.\nDu befindest dich aktuell im Modul ECO.');
  }
}


String progressBarLong(double percent) {
  int progress = percent.round();
  
  if (progress == 100) {
    return('[==================================================]');
  } else if (percent >= 98 && percent < 100) {
    return('[=================================================-]');
  } else if (percent >= 96 && percent < 98) {
    return('[================================================--]');
  } else if (percent >= 94 && percent < 96) {
    return('[===============================================---]');
  } else if (percent >= 92 && percent < 94) {
    return('[==============================================----]');
  } else if (percent >= 90 && percent < 92) {
    return('[=============================================-----]');
  } else if (percent >= 88 && percent < 90) {
    return('[============================================------]');
  } else if (percent >= 86 && percent < 88) {
    return('[===========================================-------]');
  } else if (percent >= 84 && percent < 86) {
    return('[==========================================--------]');
  } else if (percent >= 82 && percent < 84) {
    return('[=========================================---------]');
  } else if (percent >= 80 && percent < 82) {
    return('[========================================----------]');
  } else if (percent >= 78 && percent < 80) {
    return('[=======================================-----------]');
  } else if (percent >= 76 && percent < 78) {
    return('[======================================------------]');
  } else if (percent >= 74 && percent < 76) {
    return('[=====================================-------------]');
  } else if (percent >= 72 && percent < 74) {
    return('[====================================--------------]');
  } else if (percent >= 70 && percent < 72) {
    return('[===================================---------------]');
  } else if (percent >= 68 && percent < 70) {
    return('[==================================----------------]');
  } else if (percent >= 66 && percent < 68) {
    return('[=================================-----------------]');
  } else if (percent >= 64 && percent < 66) {
    return('[================================------------------]');
  } else if (percent >= 62 && percent < 64) {
    return('[===============================-------------------]');
  } else if (percent >= 60 && percent < 62) {
    return('[==============================--------------------]');
  } else if (percent >= 58 && percent < 60) {
    return('[=============================---------------------]');
  } else if (percent >= 56 && percent < 58) {
    return('[============================----------------------]');
  } else if (percent >= 54 && percent < 56) {
    return('[===========================-----------------------]');
  } else if (percent >= 52 && percent < 54) {
    return('[==========================------------------------]');
  } else if (percent >= 50 && percent < 52) {
    return('[=========================-------------------------]');
  } else if (percent >= 48 && percent < 50) {
    return('[========================--------------------------]');
  } else if (percent >= 46 && percent < 48) {
    return('[=======================---------------------------]');
  } else if (percent >= 44 && percent < 46) {
    return('[======================----------------------------]');
  } else if (percent >= 42 && percent < 44) {
    return('[=====================-----------------------------]');
  } else if (percent >= 40 && percent < 42) {
    return('[====================------------------------------]');
  } else if (percent >= 38 && percent < 40) {
    return('[===================-------------------------------]');
  } else if (percent >= 36 && percent < 38) {
    return('[==================--------------------------------]');
  } else if (percent >= 34 && percent < 36) {
    return('[=================---------------------------------]');
  } else if (percent >= 32 && percent < 34) {
    return('[================----------------------------------]');
  } else if (percent >= 30 && percent < 32) {
    return('[===============-----------------------------------]');
  } else if (percent >= 28 && percent < 30) {
    return('[==============------------------------------------]');
  } else if (percent >= 26 && percent < 28) {
    return('[=============-------------------------------------]');
  } else if (percent >= 24 && percent < 26) {
    return('[============--------------------------------------]');
  } else if (percent >= 22 && percent < 24) {
    return('[===========---------------------------------------]');
  } else if (percent >= 20 && percent < 22) {
    return('[==========----------------------------------------]');
  } else if (percent >= 18 && percent < 20) {
    return('[=========-----------------------------------------]');
  } else if (percent >= 16 && percent < 18) {
    return('[========------------------------------------------]');
  } else if (percent >= 14 && percent < 16) {
    return('[=======-------------------------------------------]');
  } else if (percent >= 12 && percent < 14) {
    return('[======--------------------------------------------]');
  } else if (percent >= 10 && percent < 12) {
    return('[=====---------------------------------------------]');
  } else if (percent >= 8 && percent < 10) {
    return('[====----------------------------------------------]');
  } else if (percent >= 6 && percent < 8) {
    return('[===-----------------------------------------------]');
  } else if (percent >= 4 && percent < 6) {
    return('[==------------------------------------------------]');
  } else if (percent >= 2 && percent < 4) {
    return('[=-------------------------------------------------]');
    } else {
    return('[--------------------------------------------------]');
  }
}

String progressBar(double percent) {
  String progressSign = '=';
  String fillSign = '-';
  int totalSign = 50;
  int usedSign = ((percent / 100) * totalSign).round();
  String progressBar = '[${progressSign * usedSign}${fillSign * (totalSign - usedSign)}]';
  return progressBar;
}



void milestone(percent){  
  if (percent == 100) {
    print('=============================================');
  } else if (percent >= 98 && percent < 100) {
    print('============================================-');
  } else if (percent >= 96 && percent < 98) {
    print('===========================================--');
  } else if (percent >= 25 && percent < 50) {
    print('Du hast einen Meilenstein von 25% erreicht');
  } else {
    print('Du hast noch keinen Meilenstein erreicht');
  }
}


