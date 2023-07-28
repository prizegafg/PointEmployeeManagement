//
//  ForgotPasswordRouter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit

class ForgotPasswordRouter: PTRForgotPasswordProtocol{
    static func createForgotEmailModule() -> ForgotInputEmailVC {
        let view = ForgotInputEmailVC()
        let presenter = ForgotPasswordPresenter()
        let interactor: PTIForgotPasswordProtocol = ForgotPasswordInteractor()
        let router : PTRForgotPasswordProtocol = ForgotPasswordRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    static func createCreatePasswordModule() -> ForgotCreatePasswordVC {
        let view = ForgotCreatePasswordVC()
        let presenter = ForgotPasswordPresenter()
        let interactor: PTIForgotPasswordProtocol = ForgotPasswordInteractor()
        let router : PTRForgotPasswordProtocol = ForgotPasswordRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func goToCreatePassword(data: String, nav: UINavigationController){
        let vc = ForgotPasswordRouter.createCreatePasswordModule()
        vc.email = data
        nav.pushViewController(vc, animated: true)
    }
    
    func goToLogin(nav: UINavigationController) {
        let vc = LoginRouter.createLoginModule()
        nav.pushViewController(vc, animated: true)
    }
    
    
}
