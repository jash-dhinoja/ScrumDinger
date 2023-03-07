//
//  ScrumDingerAppleApp.swift
//  ScrumDingerApple
//
//  Created by Jash Dhinoja on 01/03/2023.
//

import SwiftUI

@main
struct ScrumDingerAppleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
