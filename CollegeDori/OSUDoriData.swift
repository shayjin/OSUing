//
//  OSUDoriData.swift
//  CollegeDori
//
//  Created by Jae-Young Heo on 6/5/22.
//

import Foundation

class OSUDoriData {
    
    let sp19 = Semester(name: "Spring 2019", year: 2019, startMonth: 1, startDay: 19, endMonth: 5, endDay: 5)
    let su19 = Semester(name: "Summer 2019", year: 2019, startMonth: 5, startDay: 12, endMonth: 8, endDay: 5)
    let au19 = Semester(name: "Autumn 2019", year: 2019, startMonth: 8, startDay: 25, endMonth: 12, endDay: 18)
    
    let sp20 = Semester(name: "Spring 2020", year: 2020, startMonth: 1, startDay: 18, endMonth: 5, endDay: 4)
    let su20 = Semester(name: "Summer 2020", year: 2020, startMonth: 5, startDay: 11, endMonth: 8, endDay: 4)
    let au20 = Semester(name: "Autumn 2020", year: 2020, startMonth: 8, startDay: 25, endMonth: 12, endDay: 18)
    
    let sp21 = Semester(name: "Spring 2021", year: 2021, startMonth: 1, startDay: 18, endMonth: 5, endDay: 4)
    let su21 = Semester(name: "Summer 2021", year: 2021, startMonth: 5, startDay: 11, endMonth: 8, endDay: 4)
    
    let au21 = Semester(name: "Autumn 2021", year: 2021, startMonth: 8, startDay: 24, endMonth: 12, endDay: 16)
    let sp22 = Semester(name: "Spring 2022", year: 2022, startMonth: 1, startDay: 10, endMonth: 5, endDay: 3)
    let su22 = Semester(name: "Summer 2022", year: 2022, startMonth: 5, startDay: 10, endMonth: 8, endDay: 3)
    
    let au22 = Semester(name: "Autumn 2022", year: 2022, startMonth: 8, startDay: 23, endMonth: 12, endDay: 15)
    let sp23 = Semester(name: "Spring 2023", year: 2023, startMonth: 1, startDay: 9, endMonth: 5, endDay: 2)
    let su23 = Semester(name: "Summer 2023", year: 2023, startMonth: 5, startDay: 9, endMonth: 8, endDay: 2)
    
    let au23 = Semester(name: "Autumn 2023", year: 2023, startMonth: 8, startDay: 22, endMonth: 12, endDay: 14)
    let sp24 = Semester(name: "Spring 2024", year: 2024, startMonth: 1, startDay: 8, endMonth: 4, endDay: 30)
    let su24 = Semester(name: "Summer 2024", year: 2024, startMonth: 5, startDay: 7, endMonth: 7, endDay: 31)
    
    let au24 = Semester(name: "Autumn 2024", year: 2024, startMonth: 8, startDay: 20, endMonth: 12, endDay: 12)
    let sp25 = Semester(name: "Spring 2025", year: 2025, startMonth: 1, startDay: 6, endMonth: 4, endDay: 29)
    var su25 = Semester(name: "Summer 2025", year: 2025, startMonth: 5, startDay: 6, endMonth: 7, endDay: 30)

    let au25 = Semester(name: "Autumn 2025", year: 2025, startMonth: 8, startDay: 19, endMonth: 12, endDay: 11)
    
    let semesters: [Semester]
    let schoolYears: [SchoolYear]
    let years: [Int: [Semester]]
    
    init() {
        self.semesters = [au19, sp20, su20, au20, sp21, su21, au21, sp22, su22, au22, sp23, su23, au23, sp24, su24, au24, sp25, su25, au25]
        
        self.years = [2019:[sp19, su19, au19], 2020:[sp20, su20, au20], 2021:[sp21, su21, au21], 2022:[sp22, su22, au22], 2023:[sp23, su23, au23], 2024:[sp24, su24, au24], 2025:[sp25, su25, au25]]
    
        let year21_22 = SchoolYear(name: "2021-2022 Year", startYear: au21.year, startMonth: au21.startMonth, startDay: au21.startDay, endYear: sp22.year, endMonth: sp22.endMonth, endDay: sp22.endDay, waitingSemester: su22)
        
        let sb22 = SchoolYear(name: "Summer Break 2022", startYear: sp22.year, startMonth: sp22.endMonth, startDay: sp22.endDay, endYear: sp22.year, endMonth: au22.startMonth, endDay: au22.startDay, waitingSemester: su23)
        
        let year22_23 = SchoolYear(name: "2022-2023 Year", startYear: au22.year, startMonth: au22.startMonth, startDay: au22.startDay, endYear: sp23.year, endMonth: sp23.endMonth, endDay: sp23.endDay, waitingSemester: su23)
        
        let sb23 = SchoolYear(name: "Summer Break 2023", startYear: sp23.year, startMonth: sp23.endMonth, startDay: sp23.endDay, endYear: sp23.year, endMonth: au23.startMonth, endDay: au23.startDay, waitingSemester: su24)
        
        let year23_24 = SchoolYear(name: "2023-2024 Year", startYear: au23.year, startMonth: au23.startMonth, startDay: au23.startDay, endYear: sp24.year, endMonth: sp24.endMonth, endDay: sp24.endDay, waitingSemester: su24)
        
        let sb24 = SchoolYear(name: "Summer Break 2024", startYear: sp24.year, startMonth: sp24.endMonth, startDay: sp24.endDay, endYear: sp24.year, endMonth: au24.startMonth, endDay: au24.startDay, waitingSemester: su25)
        
        let year24_25 = SchoolYear(name: "2024-2025 Year", startYear: au24.year, startMonth: au24.startMonth, startDay: au24.startDay, endYear: sp25.year, endMonth: sp25.endMonth, endDay: sp25.endDay, waitingSemester: su25)
        
        self.schoolYears = [year21_22, sb22, year22_23, sb23, year23_24, sb24, year24_25]
    }
    
    

}
