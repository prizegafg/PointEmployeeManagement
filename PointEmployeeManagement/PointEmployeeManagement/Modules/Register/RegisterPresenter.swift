//
//  RegisterPresenter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit

class RegisterPresenter: VTPRegisterProtocol{
    var view: PTVRegisterProtocol?
    var interactor: PTIRegisterProtocol?
    var router: PTRRegisterProtocol?
    
    func startFetchRegister(data: RegisModel, nav: UINavigationController) {
        interactor?.fetchRegister(data: data, nav: nav)
    }
    
    func navToSuccessRegis(nav: UINavigationController) {
        router?.goToSuccess(nav: nav)
    }
    
    func navToLogin(nav: UINavigationController) {
        router?.goToLogin(nav: nav)
    }
    
    
}

extension RegisterPresenter: ITPRegisterProtocol{
    func onSuccessRegis() {
        view?.SuccessRegis()
    }
    
    func onFailedRegis(error: String) {
        view?.FailedRegid(error: error)
    }
    
    
}
