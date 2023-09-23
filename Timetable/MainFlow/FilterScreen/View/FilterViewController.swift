import UIKit

class FilterViewController: UIViewController {
    
    var presenter: FilterPresenter?
    
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var facultyTextField: UITextField!
    @IBOutlet weak var groupTextField: UITextField!
    @IBOutlet weak var subgroupTextField: UITextField!
    @IBOutlet weak var teacherTextField: UITextField!
    @IBOutlet weak var roomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFilterConfig()
    }
    
    @IBAction func didApplyTap(_ sender: UIButton) {
        var newConfig = FilterConfig(
            course: Int(courseTextField.text ?? ""),
            faculty: facultyTextField.text,
            group: groupTextField.text,
            room: groupTextField.text,
            teacher: teacherTextField.text
        )
        presenter?.saveFilterConfig(newConfig: newConfig)
    }
    
}

private extension FilterViewController {
    func loadFilterConfig() {
        guard let config = presenter?.getFilterConfig() else { return }
        
        courseTextField.text = config.course != nil ? String(config.course!) : ""
        facultyTextField.text = config.faculty
        groupTextField.text = config.group
        subgroupTextField.text = config.subgroup.rawValue
        teacherTextField.text = config.teacher
        roomTextField.text = config.room != nil ? String(config.room!) : ""
    }
}
