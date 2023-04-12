//
//  LoginViewController.swift
//  Timetable
//
//  Created by Антон Смирнов on 08.04.2023.
//

import UIKit
import PromiseKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        firstly {
            AuthService(apiClient: Assembly.shared.resolve()).performLoginRequest(login: "addasd", password: "asdad")
        }.done { _ in
            print()
        }.catch { error in
            print()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
