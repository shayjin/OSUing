//
//  Semester.swift
//  CollegeDori
//
//  Created by Jae-Young Heo on 6/3/22.
//

import Foundation

struct Semester : Equatable {
    var name: String
    var year: Int
    var startMonth: Int
    var startDay: Int
    var endMonth: Int
    var endDay: Int
    
    init (name: String, year: Int, startMonth: Int, startDay: Int, endMonth: Int, endDay: Int) {
        self.name = name
        self.year = year
        self.startMonth = startMonth
        self.startDay = startDay
        self.endMonth = endMonth
        self.endDay = endDay
    }
}
