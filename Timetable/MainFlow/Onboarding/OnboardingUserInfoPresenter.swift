import Foundation

class OnboardingUserInfoPresenter {
    weak var onboardingViewController: OnboardingUserInfoViewController?
    var completion: (() -> Void)?
    
    private let userInfoService: UserInfoService
    
    init(userInfoService: UserInfoService) {
        self.userInfoService = userInfoService
    }
    
    func saveUserInfo(
        course: Int,
        faculty: String,
        group: String,
        subgroup: Subgroup
    ) {
        let user = UserInfo(
            course: course,
            faculty: faculty,
            group: group,
            subgroup: subgroup
        )
        userInfoService.updateUserInfo(user: user)
        completion?()
    }
}
