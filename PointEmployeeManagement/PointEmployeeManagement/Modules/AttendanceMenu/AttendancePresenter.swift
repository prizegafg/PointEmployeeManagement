//
//  AttendancePresenter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 29/07/23.
//

import Foundation
import UIKit

class AttendancePresenter: VTPAttendanceProtocol{
    var view: PTVAttendanceProtocol?
    
    var interactor: PTIAttendanceProtocol?
    
    var router: PTRAttendanceProtocol?
    
    func presence(data: AttendanceModel, nav: UINavigationController) {
        interactor?.submitPresence(data: data, nav: nav)
    }
    
    func goToMenu(data: AttendanceModel, nav: UINavigationController) {
        router?.goToMenu(data: data, nav: nav)
    }
    
    
}

extension AttendancePresenter: ITPAttendanceProtocol{
    
}
