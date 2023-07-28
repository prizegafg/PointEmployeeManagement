//
//  StartMenuRouter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

class StartMenuRouter: PTRStartMenuProtocol{
    static func createStartMenuModule() -> StartMenuVC {
        let view = StartMenuVC()
        let presenter = StartMenuPresenter()
        let interactor: PTIStartMenuProtocol = StartMenuInteractor()
        let router : PTRStartMenuProtocol = StartMenuRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func goToLogin(nav: UINavigationController) {
        let vw = LoginRouter.createLoginModule()
        nav.pushViewController(vw, animated: true)
    }
    
    func goToRegister(nav: UINavigationController) {
        let vw = RegisterRouter.createRegisterModule()
        nav.pushViewController(vw, animated: true)
    }
    
    
    
}
