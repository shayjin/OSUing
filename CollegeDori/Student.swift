//
//  Student.swift
//  CollegeDori
//
//  Created by Jae-Young Heo on 6/4/22.
//

import Foundation
import UIKit

class Student {
    
    var name: String
    var startingDate: Date2?
    var endingDate: Date2?
    var attendedSemesters: [String]
    var attendedSemestersCount: Int
    var attendingSemesters: [String]
    var gapSemesters: Int
    var grade: String
    var profilePicture: UIImage
    
    var semesters: [String] = ["Spring 2019", "Summer 2019", "Autumn 2019", "Spring 2020", "Summer 2020", "Autumn 2020", "Spring 2021", "Summer 2021", "Autumn 2021", "Spring 2022", "Summer 2022", "Autumn 2022", "Spring 2023", "Summer 2023", "Autumn 2023", "Spring 2024", "Summer 2024", "Autumn 2024", "Spring 2025", "Summer 2025", "Autumn 2025"]
    
    
    init (name: String, profilePicture: UIImage, startingDate: Date2, now: Date2, endingDate: Date2){
        self.name = name
        self.profilePicture = profilePicture
        self.startingDate = startingDate
        self.endingDate = endingDate
        var startIndex: Int = semesters.firstIndex(of: self.startingDate!.semester.name)!
        var endIndex: Int = semesters.firstIndex(of: self.endingDate!.semester.name)!
        var nowIndex = semesters.firstIndex(of: now.semester.name)!
        if nowIndex > startIndex {
            self.attendedSemesters = Array(semesters[startIndex...nowIndex-1])
        } else if nowIndex == startIndex {
            self.attendedSemesters = Array(semesters[startIndex...nowIndex])
        } else {
            self.attendedSemesters = []
        }
        self.attendedSemestersCount = attendedSemesters.count
        self.attendingSemesters = Array(semesters[startIndex...endIndex])
        self.gapSemesters = 0
        self.grade = ""
        self.grade = self.calculateGrade()
    }
    
    init() {
        self.name = ""
        self.profilePicture = UIImage(named: "profile")!
        self.startingDate = Date2(date: Date())
        self.endingDate = Date2(date: Date())
        self.attendedSemesters = []
        self.attendedSemestersCount = 0
        self.attendingSemesters = []
        self.gapSemesters = 0
        self.grade = ""
    }
    
    func calculateGrade() -> String{
        var countSemesters: Int = 0
        
        for semester in attendedSemesters {
            if !semester.contains("Summer") {
                countSemesters += 1
            }
        }
        
        if countSemesters <= 2 {
            return "Freshman"
        } else if countSemesters <= 4 {
            return "Sophomore"
        } else if countSemesters <= 6 {
            return "Junior"
        } else if countSemesters <= 8 {
            return "Senior"
        } else if countSemesters <= 10 {
            return "5th Year"
        } else if countSemesters <= 12 {
            return "Go In Mul"
        } else if countSemesters <= 14 {
            return "Fossil"
        } else if countSemesters <= 16 {
            return "Haeun Song"
        } else if countSemesters <= 18 {
            return "Jae Hee"
        } else {
            return "Ddak Ddak"
        }
    }

}
