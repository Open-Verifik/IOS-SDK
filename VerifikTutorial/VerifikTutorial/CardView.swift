//
//  CardView.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 20/12/22.
//

import SwiftUI

struct CardView: View {
    let verifikService: VerifikService
    var body: some View {
        VStack(){
            HStack(){
                Text(verifikService.group)
                    .font(.headline)
                    .foregroundColor(verifikService.theme.accentColor)
                if(verifikService.ready){
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(verifikService.theme.accentColor)
                }
                Spacer()
            }
            HStack(){
                Text(verifikService.title)
                    .font(.title)
                    .foregroundColor(verifikService.theme.accentColor)
                Spacer()
            }
            HStack(){
                Text(verifikService.description)
                    .foregroundColor(verifikService.theme.accentColor)
                Spacer()
            }.padding(.top, 5)
            Divider()
            HStack(){
                Text(verifikService.time).foregroundColor(verifikService.theme.accentColor)
                Spacer()
            }
            HStack(){
                NavigationLink(NSLocalizedString("Explore", comment: ""), destination: DetailView(verifikService: verifikService))
                    .foregroundColor(verifikService.theme.accentColor)
            }
        }.padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var verifikService = VerifikService.sampleData[0]
    static var previews: some View {
        CardView(verifikService: verifikService)
            .background(verifikService.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
