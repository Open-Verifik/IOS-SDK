//
//  VerifikTutorialApp.swift
//  VerifikTutorial
//
//  Created by Carlos Bleck on 20/12/22.
//

import SwiftUI

@main
struct VerifikTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(verifikServices: VerifikService.sampleData)
            }
        }
    }
}
