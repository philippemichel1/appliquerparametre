//
//  Parametres.swift
//  appliquerParametres
//
//  Created by Philippe MICHEL on 21/01/2023.
//

import Foundation
import SwiftUI

class Parametres: ObservableObject {
    static var couleurs = [Color.red ,Color.blue, Color.green, Color.purple, Color.orange]
    static var motsMerci = ["merci", "thank you","danke","gracias","grazie","obrigado","дякую." ]
    static var tCaractere = [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]
    @Published var choixCouleurFond = 0
    @Published var choixCouleurTexte = 1
    @Published var choixLangue = 0
    @Published var montrerParametre = false
    @Published var coinsArrondis = false
    @Published var tailleCaratere = 9
    
    
}
