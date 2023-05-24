import UIKit

class OnboardingUserInfoViewController: UIViewController {
    
    var presenter: OnboardingUserInfoPresenter?
    
    @IBOutlet private weak var courseTextField: UITextField!
    @IBOutlet private weak var facultyTextField: UITextField!
    @IBOutlet private weak var groupTextField: UITextField!
    @IBOutlet private weak var subgroupTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didDoneTap(_ sender: UIButton) {
        
    }
}
