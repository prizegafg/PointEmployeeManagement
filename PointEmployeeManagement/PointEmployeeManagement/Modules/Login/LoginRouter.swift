//
//  LoginRouter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

class LoginRouter: PTRLoginProtocol{
    static func createLoginModule() -> LoginVC {
        let view = LoginVC()
        let presenter = LoginPresenter()
        let interactor: PTILoginProtocol = LoginInteractor()
        let router : PTRLoginProtocol = LoginRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func goToRegister(nav: UINavigationController) {
        let vw = RegisterRouter.createRegisterModule()
        nav.pushViewController(vw, animated: true)
        
    }
    
    func goToMainMenu(nav: UINavigationController) {
        
    }
    
    func goToForgotPassword(nav: UINavigationController) {
        
    }
    
    
    
}
