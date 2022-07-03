import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var percentage: UILabel!
    @IBOutlet var startDate: UILabel!
    @IBOutlet var endDate: UILabel!
    
    @IBOutlet weak var semesterProgressView: UIProgressView!
    @IBOutlet weak var semesterPercentage: UILabel!
    @IBOutlet weak var semesterStartDate: UILabel!
    @IBOutlet weak var semesterEndDate: UILabel!

    @IBOutlet weak var schoolYearProgressView: UIProgressView!
    @IBOutlet weak var schoolYearPercentage: UILabel!
    @IBOutlet weak var schoolYearStartDate: UILabel!
    @IBOutlet weak var schoolYearEndDate: UILabel!
    
    
    @IBOutlet weak var duldosText: UILabel!
    @IBOutlet weak var daysUntilLastDayOfSchool: UILabel!
    @IBOutlet weak var daysUntilLastDayOfSemester: UILabel!
    @IBOutlet weak var daysUntilEndOfSchoolYear: UILabel!
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var schoolYearLabel: UILabel!
    
    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var showLIst: UIButton!
    @IBOutlet weak var add: UIButton!
    
    var test: [Student] = []
    var test2: [String] = []
    
    var me: Student?
    var nameEntered: String = ""
    var startDatePicker: Date2?
    var endDatePicker: Date2?
    var imageChosen: UIImage?
    
    var timer = Timer()
    let dateNow = Date()
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    let secondsInYear = 31536000
    let secondsInMonth = 2678400
    let secondsInDay = 86400
    
    var totalSeconds = 0
    var currentSeconds = 0
    var totalSemesterSeconds = 0
    var currentSemesterSeconds = 0
    var totalSchoolYearSeconds = 0
    var currentSchoolYearSeconds = 0
    var milli: Float = 0
    
    
    
    fileprivate func showTime()  {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.image = me?.profilePicture
        calculate()
    }
    
    func calculate() {
        showTime()
    }
    
    @objc func updateUI() {
        let startingDate = me?.startingDate
        let endingDate = me?.endingDate
        let now = Date2(date: Date())
        name.text = me?.name
        grade.text = me?.grade

        let startYear = startingDate!.year
        let startMonth = startingDate!.month
        let startDay = startingDate!.day
        let startHour = startingDate!.hour
        let startMinute = startingDate!.minute
        let startSecond = startingDate!.second
        
        let year = calendar.component(.year, from: dateNow)
        let month = calendar.component(.month, from: dateNow)
        let day = calendar.component(.day, from: dateNow)
        let hour = calendar.component(.hour, from: dateNow)
        let minute = calendar.component(.minute, from: dateNow)
        let second = calendar.component(.second, from: dateNow)
        
        
        let endYear = endingDate!.year
        let endMonth = endingDate!.month
        let endDay = endingDate!.day
        let endHour = endingDate!.hour
        let endMinute = endingDate!.minute
        let endSecond = endingDate!.second
        
        totalSeconds = (endYear-startYear)*secondsInYear + (endMonth - startMonth) * secondsInMonth + (endDay-startDay) * secondsInDay + (endHour - startHour) * 3600 + (endMinute - startMinute) * 60 + (endSecond-startSecond)
        
        currentSeconds = (year-startYear)*secondsInYear + (month - startMonth) * secondsInMonth + (day-startDay) * secondsInDay + (hour - startHour) * 3600 + (minute - startMinute) * 60 + (second-startSecond)
        
        totalSemesterSeconds = (now.semester.endMonth - now.semester.startMonth) * secondsInMonth + (now.semester.startMonth - now.semester.startDay) * secondsInDay
        
        currentSemesterSeconds = (month - now.semester.startMonth) * secondsInMonth + (day - now.semester.startDay) * secondsInDay + (hour) * 3600 + (minute) * 60 + (second)
        
        totalSchoolYearSeconds = (now.findSchoolYear().endYear - now.findSchoolYear().startYear) * secondsInYear + (now.findSchoolYear().endMonth - now.findSchoolYear().startMonth) * secondsInMonth + (now.findSchoolYear().endDay - now.findSchoolYear().startDay) * secondsInDay
        
        currentSchoolYearSeconds = (year - now.findSchoolYear().startYear) * secondsInYear + (month - now.findSchoolYear().startMonth) * secondsInMonth + (day - now.findSchoolYear().startDay) * secondsInDay
    
        self.startDate.text = String(startMonth) + "/" + String(startDay) + "/" + String(startYear)
        self.endDate.text = String(endMonth) + "/" + String(endDay) + "/" + String(endYear)
        
        self.schoolYearLabel.text = now.findSchoolYear().name

        self.schoolYearStartDate.text = String(now.findSchoolYear().startMonth) + "/" + String(now.findSchoolYear().startDay) + "/" + String(now.findSchoolYear().startYear)
        
        self.schoolYearEndDate.text = String(now.findSchoolYear().endMonth) + "/" + String(now.findSchoolYear().endDay) + "/" + String(now.findSchoolYear().endYear)
        
        self.daysUntilLastDayOfSchool.text = String((totalSeconds - currentSeconds) / secondsInDay + 1)
        
        self.daysUntilEndOfSchoolYear.text = String((totalSchoolYearSeconds - currentSchoolYearSeconds) / secondsInDay + 1)
        
        if (now.semester.name.contains("Summer")) {
            self.duldosText.text = "Days until end of summer"
        } else {
            self.duldosText.text = "Days until end of school year"
        }
        
        milli += 0.1
            
        var progress = (Float(currentSeconds) + milli) / Float(totalSeconds)
        
        var semesterProgress = (Float(currentSemesterSeconds) + milli) / Float(totalSemesterSeconds)
        
        var schoolYearProgress = (Float(currentSchoolYearSeconds) + milli) / Float(totalSchoolYearSeconds)
        
        if progress < 0 {
            progress = 0
            semesterProgress = 0
            schoolYearProgress = 0
            self.semesterLabel.text = startingDate?.semester.name
            self.schoolYearLabel.text = startingDate?.findSchoolYear().name
            self.daysUntilLastDayOfSemester.text = String(startingDate!.next(sem: startingDate!.semester))
            self.daysUntilEndOfSchoolYear.text = String(startingDate!.daysTilEndOfSchoolYear())
            
            self.schoolYearStartDate.text = String(startingDate!.semester.startMonth) + "/" + String(startingDate!.semester.startDay) + "/" + String(startingDate!.semester.year)
            
            self.schoolYearEndDate.text = String(startingDate!.semester.endMonth) + "/" + String(startingDate!.semester.endDay) + "/" + String(startingDate!.semester.year)
            
            self.semesterStartDate.text = String(startingDate!.semester.startMonth) + "/" + String(startingDate!.semester.startDay) + "/" +  String(startingDate!.semester.year)
            
            self.semesterEndDate.text = String(startingDate!.semester.endMonth) + "/" + String(startingDate!.semester.endDay) + "/" +  String(startingDate!.semester.year)
        } else if progress >= 0  {
            self.semesterLabel.text = now.semester.name
            self.semesterStartDate.text = String(now.semester.startMonth) + "/" + String(now.semester.startDay) + "/" +  String(now.semester.year)
            
            self.semesterEndDate.text = String(now.semester.endMonth) + "/" + String(now.semester.endDay) + "/" + String(now.semester.year)
            
            self.daysUntilLastDayOfSemester.text = String(now.next(sem: now.semester))
            
            self.schoolYearLabel.text = now.findSchoolYear().name
            
            self.daysUntilEndOfSchoolYear.text = String(now.daysTilEndOfSchoolYear())
            
            self.schoolYearStartDate.text = String(now.findSchoolYear().startMonth) + "/" + String(now.findSchoolYear().startDay) + "/" + String(now.findSchoolYear().startYear)
            
            self.schoolYearEndDate.text = String(now.findSchoolYear().endMonth) + "/" + String(now.findSchoolYear().endDay) + "/" + String(now.findSchoolYear().endYear)
        }
    
        if semesterProgress > 1 {
            semesterProgress = 1
            self.semesterLabel.text = now.semester.name
            self.semesterStartDate.text = String(now.semester.startMonth) + "/" + String(now.semester.startDay) + "/" +  String(now.semester.year)
            
            self.semesterEndDate.text = String(now.semester.endMonth) + "/" + String(now.semester.endDay) + "/" + String(now.semester.year)
            
            self.daysUntilLastDayOfSemester.text = "0"
        }
        
        self.percentage.text = String(progress * 100) + "%"
        self.progressBar.setProgress(progress, animated: true)
        self.semesterPercentage.text = String(semesterProgress * 100) + "%"
        self.semesterProgressView.setProgress(semesterProgress, animated: true)
        self.schoolYearPercentage.text = String(schoolYearProgress * 100) + "%"
        self.schoolYearProgressView.setProgress(schoolYearProgress, animated: true)
        
    }
    
    @IBAction func showListPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "list") as! ListViewController
        vc.modalPresentationStyle = .fullScreen

        vc.test = test
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        vc.modalPresentationStyle = .fullScreen
        vc.me = me
        vc.edit = true
        vc.test = test
        present(vc, animated: true, completion: nil)
    }
    @IBAction func addPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        vc.modalPresentationStyle = .fullScreen
        vc.test2 = test2
        vc.test = test
        vc.edit = false
        vc.me = Student()
        present(vc, animated: true, completion: nil)
    }
    
}

