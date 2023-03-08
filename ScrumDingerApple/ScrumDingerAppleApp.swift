//
//  ScrumDingerAppleApp.swift
//  ScrumDingerApple
//
//  Created by Jash Dhinoja on 01/03/2023.
//

import SwiftUI

@main
struct ScrumDingerAppleApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumView(scrums: $scrums)
            }
        }
    }
}
