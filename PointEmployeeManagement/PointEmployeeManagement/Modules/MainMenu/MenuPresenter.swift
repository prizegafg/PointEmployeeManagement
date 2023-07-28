//
//  MenuPresenter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 28/07/23.
//

import Foundation
import UIKit

class MenuPresenter: VTPMenuProtocol{
    var view: PTVMenuProtocol?
    var interactor: PTIMenuProtocol?
    var router: PTRMenuProtocol?
    
    func navToChangeData(data: MenuModel, nav: UINavigationController) {
        router?.goToChangeData(data: data, nav: nav)
    }
    
    func navToAttendance(data: MenuModel, nav: UINavigationController) {
        router?.goToAttendance(data: data, nav: nav)
    }
    
    
}

extension MenuPresenter: ITPMenuProtocol{
    
}
