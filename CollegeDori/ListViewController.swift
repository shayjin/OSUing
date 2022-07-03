import UIKit

class ListViewController: UIViewController {

    var test: [Student] = []
    var test2: [String] = []
    var stu: Student?
    var offset: Int = 0
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for student in test {
            let button = UIButton()
            button.setTitle(student.name + " - " + student.grade, for: .normal)
            button.backgroundColor = UIColor(red: 20/255.0, green: 127/255.0, blue: 141/255.0, alpha: 1)
            self.view.addSubview(button)
            button.frame = CGRect(x: 0, y: 30 + offset, width: Int(UIScreen.main.bounds.width), height: 50)
            button.tag = index
            button.addTarget(self,
                             action: #selector(buttonAction),
                             for: .touchUpInside)
            offset += 55
            index += 1
        }
    }
    
    @objc func buttonAction(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.me = test[sender.tag]
        vc.test = test
        vc.test2 = test2
        present(vc, animated: false, completion: nil)
    }

}
