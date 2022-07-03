//
//  SchoolYear.swift
//  CollegeDori
//
//  Created by Jae-Young Heo on 6/5/22.
//

import Foundation

class SchoolYear {
    var name: String
    var startYear: Int
    var startMonth: Int
    var startDay: Int
    var endYear: Int
    var endMonth: Int
    var endDay: Int
    var waitingSemester: Semester
    
    init (name: String, startYear: Int, startMonth: Int, startDay: Int, endYear: Int, endMonth: Int, endDay: Int, waitingSemester: Semester) {
        self.name = name
        self.startYear = startYear
        self.startMonth = startMonth
        self.startDay = startDay
        self.endYear = endYear
        self.endMonth = endMonth
        self.endDay = endDay
    
        self.waitingSemester = waitingSemester
    }
    
}
