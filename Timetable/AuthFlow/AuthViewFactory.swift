enum AuthViewFactory {
    static func makeLoginViewController(
        authService: AuthService,
        tokenService: TokenService,
        onRegisterScreenTapped: @escaping () -> Void,
        onFinishFlow: @escaping () -> Void
    ) -> LoginViewController {
        let presenter = LoginPresenterImpl(authService: authService, tokenService: tokenService)
        let viewController = LoginViewController()
        presenter.viewController = viewController
        viewController.presenter = presenter
        presenter.onRegisterScreenTapped = onRegisterScreenTapped
        presenter.onFinishFlow = onFinishFlow
        return viewController
    }
    
    static func makeRegisterViewController(
        authService: AuthService,
        tokenService: TokenService,
        onLoginScreenTapped: @escaping () -> Void,
        onFinishFlow: @escaping () -> Void
    ) -> RegisterViewController {
        let presenter = RegisterPresenterImpl(authService: authService, tokenService: tokenService)
        let viewController = RegisterViewController()
        presenter.viewController = viewController
        viewController.presenter = presenter
        presenter.onLoginScreenTapped = onLoginScreenTapped
        presenter.onFinishFlow = onFinishFlow
        return viewController
    }
}
