//
//  ScrumView.swift
//  ScrumDingerApple
//
//  Created by Jash Dhinoja on 02/03/2023.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScruView = false
    @State private var newScrumData = DailyScrum.Data()
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar{
            Button(action: {
                isPresentingNewScruView = true
            }){
                Image(systemName: "plus")
            }
            .accessibilityLabel("Add Scrum")
        }
        .sheet(isPresented: $isPresentingNewScruView){
            NavigationView{
                DetailEditView(data: $newScrumData)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Dismiss"){
                                isPresentingNewScruView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Add"){
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScruView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
            .onChange(of: scenePhase){phase in
                if phase == .inactive { saveAction()}
            }
        }
    }
}

struct ScrumView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumView(scrums: .constant(DailyScrum.sampleData),saveAction: {})
        }
    }
}
