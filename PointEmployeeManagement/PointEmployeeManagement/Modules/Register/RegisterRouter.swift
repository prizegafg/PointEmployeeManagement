//
//  RegisterRouter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit

class RegisterRouter: PTRRegisterProtocol{
    static func createRegisterModule() -> RegisterVC {
        let view = RegisterVC()
        let presenter = RegisterPresenter()
        let interactor: PTIRegisterProtocol = RegisterInteractor()
        let router : PTRRegisterProtocol = RegisterRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    static func createSuccessRegisterModule() -> SuccessRegisterVC {
        let view = SuccessRegisterVC()
        let presenter = RegisterPresenter()
        let interactor: PTIRegisterProtocol = RegisterInteractor()
        let router : PTRRegisterProtocol = RegisterRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func goToSuccess(nav: UINavigationController){
        let vw = LoginRouter.createLoginModule()
        nav.pushViewController(vw, animated: true)
    }
    
    func goToLogin(nav: UINavigationController) {
        let vw = LoginRouter.createLoginModule()
        nav.pushViewController(vw, animated: true)
    }
    
    
}
