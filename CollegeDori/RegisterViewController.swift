import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var startOptions: UIPickerView!
    @IBOutlet weak var endOptions: UIPickerView!
    
    let data = OSUDoriData()
    
    var pickerData: [String] = []
    

    var startDate: String?
    var endDate: String?
    var me: Student?
    
    var image: UIImage? = UIImage(named: "profile")
    
    var test: [Student] = []
    var test2: [String] = []
    
    var edit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startOptions.dataSource = self
        self.startOptions.delegate = self
        self.endOptions.dataSource = self
        self.endOptions.delegate = self
        var x = me?.startingDate?.semester.name
        var y = me?.endingDate?.semester.name
        
        nameField.text = me?.name

        profilePicture.image = image
        
        for semester in data.semesters {
            pickerData.append(semester.name)
        }
        
        print(pickerData)
        
        if x != nil {
            let startIndex = pickerData.firstIndex(of: x!)
            self.startOptions.selectRow(startIndex!, inComponent: 0, animated: false)
            let endIndex = pickerData.firstIndex(of: y!)

            self.endOptions.selectRow(endIndex!, inComponent: 0, animated: false)
            startDate = pickerData[startIndex!]
            endDate = pickerData[endIndex!]
        } else {
            startDate = pickerData[0]
            endDate = pickerData[0]
        }
        startOptions.tag = 1
        endOptions.tag = 2
    }

    
    @IBAction func pickProfilePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = (info[.editedImage] as! UIImage)
        profilePicture.image = image
        dismiss(animated: true)
    }
    
    @IBAction func buttonPressed() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        

        if let index = test.index(where: {$0 === me!}) {
            test.remove(at: index)
        }
        
        me = Student(name: nameField.text!, profilePicture: image!, startingDate: convertToStartDate(dataPicked: startDate!), now: Date2(date: Date()), endingDate: convertToEndDate(dataPicked: endDate!))
        test.append(me!)
        vc.me = me!
        vc.imageChosen = image
        
        vc.test = test
        present(vc, animated: true, completion: nil)
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       switch pickerView.tag {
       case 1:
           startDate = pickerData[row]
       case 2:
           endDate = pickerData[row]
       default:
           break
       }
    }
    
    func convertToStartDate(dataPicked: String) -> Date2 {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        var index = 0
        for semester in pickerData {
            if semester == dataPicked {
                return Date2(year: data.semesters[index].year, month: data.semesters[index].startMonth, day: data.semesters[index].startDay)
            }
            index += 1
        }
        
        return Date2(year: 2020, month: 8, day: 25)
    }
    
    func convertToEndDate(dataPicked: String) -> Date2 {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        var index = 0
        for semester in pickerData {
            print(semester)
            if semester == dataPicked {
                var x = Date2(year: data.semesters[index].year, month: data.semesters[index].endMonth, day: data.semesters[index].endDay)
                return x
            }
            index += 1
        }
    
        return Date2(year: 2020, month: 8, day: 25)
    }
    
}
