//
//  StartMenuPresenter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

class StartMenuPresenter: VTPStartMenuProtocol{
    var view: PTVStartMenuProtocol?
    var interactor: PTIStartMenuProtocol?
    var router: PTRStartMenuProtocol?
    
    func navToLogin(nav: UINavigationController) {
        router?.goToLogin(nav: nav)
    }
    
    func navToRegister(nav: UINavigationController) {
        router?.goToRegister(nav: nav)
    }
    
    
    
}

extension StartMenuPresenter: ITPStartMenuProtocol{
    // Empty -> interactor did not hit api
    
}
