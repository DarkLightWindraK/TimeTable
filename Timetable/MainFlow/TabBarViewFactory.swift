import Foundation

enum TabBarViewFactory {
    static func createOnboardingScreen(
        userInfoService: UserInfoService,
        completion: @escaping () -> Void
    ) -> OnboardingUserInfoViewController {
        let viewController = OnboardingUserInfoViewController()
        let presenter = OnboardingUserInfoPresenter(userInfoService: userInfoService)
        presenter.completion = completion
        viewController.presenter = presenter
        presenter.onboardingViewController = viewController
        return viewController
    }
}
