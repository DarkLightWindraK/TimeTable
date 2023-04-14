enum AuthViewFactory {
    static func makeLoginViewController(
        delegate: AuthCoordinator,
        authService: AuthService
    ) -> LoginViewController {
        let presenter = LoginPresenter(authService: authService)
        let viewController = LoginViewController()
        presenter.viewController = viewController
        viewController.presenter = presenter
        presenter.delegate = delegate
        return viewController
    }
    
    static func makeRegisterViewController(
        delegate: AuthCoordinator,
        authService: AuthService
    ) -> RegisterViewController {
        let presenter = RegisterPresenter(authService: authService)
        let viewController = RegisterViewController()
        presenter.viewController = viewController
        viewController.presenter = presenter
        presenter.delegate = delegate
        return viewController
    }
}
