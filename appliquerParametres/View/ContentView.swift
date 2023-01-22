//
//  ContentView.swift
//  appliquerParametres
//
//  Created by Philippe MICHEL on 21/01/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var parametres = Parametres()
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Label {
                        Text("titastus.com") }
                    
                icon: {
                            Image("TiTasTus")
                        .resizable()
                                .frame(width: 30,height: 30)
                    }
                    Spacer()
                }
                Spacer()
                // applique les parametres de la fenetre sheet
                Text("\(Parametres.motsMerci[self.parametres.choixLangue]) swiftUI")
                    .font(.system(size: CGFloat(Parametres.tCaractere[self.parametres.tailleCaratere])))
                .frame(width: 200,height: 200)
                .foregroundColor(Parametres.couleurs[self.parametres.choixCouleurTexte])
                    .background(Parametres.couleurs[self.parametres.choixCouleurFond])
                    .cornerRadius(parametres.coinsArrondis ? 20 : 0)
            }
            Spacer()
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        parametres.montrerParametre = true
                    } label: {
                        Text("Paramètrage")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .sheet(isPresented: $parametres.montrerParametre) {
                VueParametres(parametres: self.parametres)
                    .presentationDetents([.fraction(0.70)])
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
