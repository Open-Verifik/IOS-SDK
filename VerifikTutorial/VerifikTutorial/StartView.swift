//
//  StartView.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 23/12/22.
//

import SwiftUI

struct StartView: View {
    let verifikService: VerifikService
    @State var clientTokenApi: String = ""
    var body: some View {
        List {
            Section(header: Text(NSLocalizedString("Step 1", comment: ""))) {
                HStack {
                    Label(verifikService.step1, systemImage: "1.circle.fill")
                }
            }
            Section(header: Text(NSLocalizedString("Step 2", comment: ""))){
                VStack {
                    HStack {
                        Label(verifikService.step2, systemImage: "2.circle.fill")
                        Spacer()
                    }
                    Image("verifik-keys")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            Section {
                TextField(NSLocalizedString("Secret Key", comment: ""), text: $clientTokenApi)
            }
            Section {
                NavigationLink(NSLocalizedString("Continue tuto", comment: ""), destination: VerifikViewWrapper(verifikService: verifikService, token: clientTokenApi))
            }
        }
        .navigationTitle(verifikService.title)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(verifikService: VerifikService.sampleData[0])
    }
}
