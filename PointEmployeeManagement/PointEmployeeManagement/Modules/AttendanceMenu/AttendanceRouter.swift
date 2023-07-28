//
//  AttendanceRouter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 29/07/23.
//

import Foundation
import UIKit

class AttendanceRouter: PTRAttendanceProtocol{
    static func createMainAttendanceModule() -> AttendanceVC {
        let view = AttendanceVC()
        let presenter = AttendancePresenter()
        let interactor: PTIAttendanceProtocol = AttendanceInteractor()
        let router : PTRAttendanceProtocol = AttendanceRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func goToMenu(data: AttendanceModel, nav: UINavigationController) {
        let vc = MenuRouter.createMainMenuModule()
        vc.email = data.email
        vc.userName = data.email
        nav.pushViewController(vc, animated: true)
        
    }
    
    
}
