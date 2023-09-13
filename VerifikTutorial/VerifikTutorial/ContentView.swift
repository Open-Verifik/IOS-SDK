//
//  ContentView.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    let verifikServices: [VerifikService]
    var body: some View {
        VStack() {
            HStack {
                Text(NSLocalizedString("What do you want to learn today?", comment: ""))
                    .font(.title2)
                    .padding(.leading,20)
                Spacer()
            }
            HStack {
                Text(NSLocalizedString("Tutorial desc", comment: ""))
                    .padding(.leading,20)
                Spacer()
            }.padding(.top, 2)
            /*
            Button(NSLocalizedString("Change language", comment: "")) {
                
            }
            .padding(.top, 10)
            */
            List {
                ForEach(verifikServices, id: \.title){ verifikService in
                    CardView(verifikService: verifikService).listRowBackground(verifikService.theme.mainColor)
                }
            }
        }
        .navigationTitle(NSLocalizedString("Verifik Tutorials", comment: ""))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(verifikServices: VerifikService.sampleData)
        }
    }
}
