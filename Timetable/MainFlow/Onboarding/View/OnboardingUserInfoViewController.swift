import UIKit

class OnboardingUserInfoViewController: UIViewController {
    
    var presenter: OnboardingUserInfoPresenter?
    
    @IBOutlet private weak var courseTextField: UITextField!
    @IBOutlet private weak var facultyTextField: UITextField!
    @IBOutlet private weak var groupTextField: UITextField!
    @IBOutlet private weak var subgroupTextField: UITextField!
    
    private lazy var coursePickerView = UIPickerView()
    private lazy var facultyPickerView = UIPickerView()
    private lazy var groupPickerView = UIPickerView()
    private lazy var subgroupPickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPickerViewForFields()
        
        //Временно
        facultyTextField.isEnabled = true
        groupTextField.isEnabled = true
        subgroupTextField.isEnabled = true
    }
    
    @IBAction func didDoneTap(_ sender: UIButton) {
        presenter?.saveUserInfo(
            course: Int(courseTextField.text ?? "") ?? 1,
            faculty: facultyTextField.text ?? "",
            group: groupTextField.text ?? "",
            subgroup: Subgroup(rawValue: subgroupTextField.text ?? "") ?? .first
        )
    }
}

extension OnboardingUserInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return TestData.courses.count
        case 2:
            return TestData.faculties.count
        case 3:
            return TestData.groups.count
        case 4:
            return TestData.subgroups.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return String(TestData.courses[row])
        case 2:
            return TestData.faculties[row]
        case 3:
            return TestData.groups[row]
        case 4:
            return TestData.subgroups[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            courseTextField.text = String(TestData.courses[row])
            courseTextField.resignFirstResponder()
        case 2:
            facultyTextField.text = TestData.faculties[row]
            facultyTextField.resignFirstResponder()
        case 3:
            groupTextField.text = TestData.groups[row]
            groupTextField.resignFirstResponder()
        case 4:
            subgroupTextField.text =  TestData.subgroups[row]
            subgroupTextField.resignFirstResponder()
        default:
            break
        }
    }
}

private extension OnboardingUserInfoViewController {
    func setPickerViewForFields() {
        coursePickerView.tag = 1
        courseTextField.inputView = coursePickerView
        coursePickerView.delegate = self
        coursePickerView.dataSource = self
        
        facultyPickerView.tag = 2
        facultyTextField.inputView = facultyPickerView
        facultyPickerView.delegate = self
        facultyPickerView.dataSource = self
        
        groupPickerView.tag = 3
        groupTextField.inputView = groupPickerView
        groupPickerView.delegate = self
        groupPickerView.dataSource = self
        
        subgroupPickerView.tag = 4
        subgroupTextField.inputView = subgroupPickerView
        subgroupPickerView.delegate = self
        subgroupPickerView.dataSource = self
    }
}

private extension OnboardingUserInfoViewController {
    enum TestData {
        static let faculties = ["ПММ", "ФКН", "МатФак", "Исторический", "ФМО", "Физический"]
        static let courses = [1, 2, 3, 4]
        static let groups = ["Группа1", "Группа2", "Группа3", "Группа4", "Группа5", "Группа6"]
        static let subgroups = ["first", "second"]
    }
}
