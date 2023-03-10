//
//  ScrumDingerAppleApp.swift
//  ScrumDingerApple
//
//  Created by Jash Dhinoja on 01/03/2023.
//

import SwiftUI

@main
struct ScrumDingerAppleApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumView(scrums: $store.scrums){
//                    ScrumStore.save(scrums: store.scrums){result in
//                        if case .failure(let error) = result {
//                            fatalError(error.localizedDescription)
//                        }
//                    }
                    Task{
                        do{
                            try await ScrumStore.save(scrums: store.scrums)
                        }catch{
                            fatalError("Error saving Scrums")
                        }
                    }
                }
            }
//            .onAppear{
//                ScrumStore.load{ result in
//                    switch result {
//                    case .success(let scrums):
//                        store.scrums = scrums
//                    case .failure(let error):
//                        fatalError(error.localizedDescription)
//                    }
//                }
//            }
            .task {
                do{
                    store.scrums = try await ScrumStore.load()
                }catch{
                    fatalError("Error loading scrums")
                }
            }
        }
    }
}
