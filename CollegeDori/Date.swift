//
//  Date.swift
//  CollegeDori
//
//  Created by Jae-Young Heo on 6/2/22.
//

import Foundation


class Date2 {
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    var second: Int
    var semester: Semester
    
    let secondsInYear = 31536000
    let secondsInMonth = 2678400
    let secondsInDay = 86400
    
    let data = OSUDoriData()


    init (year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.hour = 0
        self.minute = 0
        self.second = 0
        self.semester = data.au22
        self.semester = findSemester(year: year, month: month, day: day)
    }
    
    init (date: Date?) {
        let calendar = Calendar.current
        self.year = calendar.component(.year, from: date!)
        self.month = calendar.component(.month, from: date!)
        self.day = calendar.component(.day, from: date!)
        self.hour = 0
        self.minute = 0
        self.second = 0
        self.semester = data.au22
        self.semester = findSemester(year: self.year, month: self.month, day: self.day)
    }
    
    func findSchoolYear() -> SchoolYear {
        for schoolYear in data.schoolYears {
            if (self.year >= schoolYear.startYear && self.year <= schoolYear.endYear && ((self.month == schoolYear.startMonth && self.day >= schoolYear.startDay) || (self.month == schoolYear.endMonth && self.day < schoolYear.endDay) || ((self.year == schoolYear.endYear) && (self.month < schoolYear.waitingSemester.startMonth || (self.month == schoolYear.waitingSemester.startMonth && self.day < schoolYear.waitingSemester.startDay))))){
                return schoolYear
            }
        }
        
        return data.schoolYears[1]
    }
    
    func findSemester(year: Int, month: Int, day: Int) -> Semester {
        var yearIndex = data.years.keys.firstIndex(of: year)!
        
        for semester in data.years.values[yearIndex] {
            if ((month == semester.startMonth && day >= semester.startDay) || (month == semester.endMonth && day < semester.endDay) || (month > semester.startMonth && month < semester.endMonth)) {
                return semester
            }
        }
        if month == 12 || month == 1 {
            return data.years.values[yearIndex][2]
        } else if month == 4 || month == 5 {
            return data.years.values[yearIndex][0]
        } else if month == 7 || month == 8 {
            return data.years.values[yearIndex][1]
        }

        return data.au23
    }
    
    func next(sem: Semester) -> Int {
        let y = (sem.endMonth - self.month) * secondsInMonth + (sem.endDay - self.day) * secondsInDay
        
        return y / secondsInDay
    }
    
    func daysTilEndOfSchoolYear() -> Int {

        var y = (self.findSchoolYear().endYear - self.year) * secondsInYear + (self.findSchoolYear().endMonth - self.month) * secondsInMonth + (self.findSchoolYear().endDay - self.day) * secondsInDay

        if y < 0 {
            y = (self.findSchoolYear().endYear - self.findSchoolYear().startYear) * secondsInYear + (self.findSchoolYear().endMonth - self.findSchoolYear().startMonth) * secondsInMonth + (self.findSchoolYear().endDay - self.findSchoolYear().startDay) * secondsInDay
        }
        
        
        return y / secondsInDay
    }

    
    
    
}
