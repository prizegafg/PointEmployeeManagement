//
//  MenuRouter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 28/07/23.
//

import Foundation
import UIKit

class MenuRouter: PTRMenuProtocol{
    static func createMainMenuModule() -> MenuVC {
        let view = MenuVC()
        let presenter = MenuPresenter()
        let interactor: PTIMenuProtocol = MenuInteractor()
        let router : PTRMenuProtocol = MenuRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func goToChangeData(data: MenuModel, nav: UINavigationController) {
        
    }
    
    func goToAttendance(data: MenuModel, nav: UINavigationController) {
        
    }
    
    
}
