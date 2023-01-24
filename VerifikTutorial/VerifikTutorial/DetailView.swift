//
//  DetailView.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 22/12/22.
//

import SwiftUI

struct DetailView: View {
    let verifikService: VerifikService
    var body: some View {
        List {
            Section(header: Text(NSLocalizedString("Description", comment: ""))) {
                HStack {
                    Label(NSLocalizedString(verifikService.description, comment: ""), systemImage: "exclamationmark.shield")
                }
                VStack {
                    HStack {
                        Label(NSLocalizedString("Parameters", comment: ""), systemImage: "list.bullet.clipboard")
                        Spacer()
                    }
                    HStack {
                        Label(NSLocalizedString(verifikService.parameters, comment: ""), image: "")
                        Spacer()
                    }
                }
            }
            Section(header: Text(NSLocalizedString("Success criteria", comment: ""))){
                HStack {
                    Label(NSLocalizedString(verifikService.successCriteria, comment: ""), systemImage: "list.bullet.rectangle")
                    Spacer()
                }
            }
            Section {
                NavigationLink(NSLocalizedString("Continue tuto", comment: ""), destination: StartView(verifikService: verifikService))
            }
        }
        .navigationTitle(verifikService.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(verifikService: VerifikService.sampleData[0])
    }
}
