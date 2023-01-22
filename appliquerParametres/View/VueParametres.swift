//
//  VueParametres.swift
//  appliquerParametres
//
//  Created by Philippe MICHEL on 21/01/2023.
//

import SwiftUI


struct VueParametres: View {
    @Environment(\.dismiss) var dismiss
    @State var choixCouleurFond = 0
    @State var choixCouleurTexte = 1
    @State var choixLangue = 0
    @State var coinsArrondis = false
    @State var tailleCaractere = 9
    
    
    @ObservedObject var parametres: Parametres
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Texte")) {
                    // choix de la langue
                    Picker(selection: $choixLangue, label: Text("Texte / Langue"), content: {
                        ForEach(0..<Parametres.motsMerci.count, id: \.self) { indexLangue in
                            Text("\(Parametres.motsMerci[indexLangue].description)")
                                .tag(indexLangue)
                        }
                    })
                    .font(.system(size: 15))
                    
                    //taille des caracteres
                    Picker(selection: $tailleCaractere, label: Text("Taille police"), content: {
                        ForEach(0..<Parametres.tCaractere.count, id: \.self) { indexTailleCar in
                            Text("\(Parametres.tCaractere[indexTailleCar].description)")
                                .tag(indexTailleCar)
                        }
                    })
                    .font(.system(size: 15))
                    
                    
                    //couleur de texte
                    Picker(selection: $choixCouleurTexte, label: Text("Couleur"), content: {
                        ForEach(0..<Parametres.couleurs.count, id: \.self) { indexCouleurTexte in
                            Text("\(Parametres.couleurs[indexCouleurTexte].description)")
                                .tag(indexCouleurTexte)
                        }
                    })
                    .font(.system(size: 15))
                    
                }
                
                // trame de fond
                Section(header: Text("Trame")) {
                    Picker(selection: $choixCouleurFond, label: Text("Couleur  "), content: {
                        ForEach(0..<Parametres.couleurs.count, id: \.self) { indexCouleur in
                            Text("\(Parametres.couleurs[indexCouleur].description)")
                                .tag(indexCouleur)
                        }
                    })
                    .font(.system(size: 15))
                    
                    //coins arrondis
                    Toggle(isOn: $coinsArrondis, label: {
                        Text("Coins arrondis")
                    })
                    .font(.system(size: 15))
                    
                }
            }
            .navigationTitle("Paramètrage")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        parametres.choixCouleurFond = self.choixCouleurFond
                        parametres.choixCouleurTexte = self.choixCouleurTexte
                        parametres.choixLangue = self.choixLangue
                        parametres.coinsArrondis = self.coinsArrondis
                        parametres.tailleCaratere = self.tailleCaractere
                        dismiss()
                    } label: {
                        Text("Valider")
                    }
                    .interactiveDismissDisabled()
                    .buttonStyle(.borderedProminent)
                }
            }
            .onAppear {
                self.choixCouleurFond = parametres.choixCouleurFond
                self.choixCouleurTexte = parametres.choixCouleurTexte
                self.choixLangue = parametres.choixLangue
                self.coinsArrondis = parametres.coinsArrondis
                self.tailleCaractere = parametres.tailleCaratere
            }
        }
    }
}

struct VueParametres_Previews: PreviewProvider {
    static var previews: some View {
        VueParametres(parametres: Parametres())
    }
}
