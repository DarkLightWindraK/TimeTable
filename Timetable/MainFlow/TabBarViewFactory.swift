import Foundation

enum TabBarViewFactory {
    static func createOnboardingScreen() -> OnboardingUserInfoViewController {
        let viewController = OnboardingUserInfoViewController()
        let presenter = OnboardingUserInfoPresenter()
        viewController.presenter = presenter
        presenter.onboardingViewController = viewController
        return viewController
    }
}
