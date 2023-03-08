//
//  History.swift
//  ScrumDingerApple
//
//  Created by Jash Dhinoja on 08/03/2023.
//

import Foundation

struct History: Identifiable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendees]
    var lengthInMinutes: Int
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendees], lengthInMinutes: Int = 5) {
            self.id = id
            self.date = date
            self.attendees = attendees
            self.lengthInMinutes = lengthInMinutes
        }
}
