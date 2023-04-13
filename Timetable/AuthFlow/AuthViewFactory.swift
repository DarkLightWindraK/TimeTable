enum AuthViewFactory {
    static func makeLoginViewController(delegate: AuthCoordinator, apiClient: APIClient) -> LoginViewController {
        let presenter = LoginPresenter(apiClient: apiClient)
        let viewController = LoginViewController()
        presenter.viewController = viewController
        viewController.presenter = presenter
        presenter.delegate = delegate
        return viewController
    }
    
    static func makeRegisterViewController() -> RegisterViewController {
        return RegisterViewController()
    }
}
