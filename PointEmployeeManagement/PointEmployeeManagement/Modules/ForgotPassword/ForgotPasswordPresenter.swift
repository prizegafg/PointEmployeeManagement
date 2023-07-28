//
//  ForgotPasswordPresenter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit

class ForgotPasswordPresenter: VTPForgotPasswordProtocol{
    var view: PTVForgotPasswordProtocol?
    
    var interactor: PTIForgotPasswordProtocol?
    
    var router: PTRForgotPasswordProtocol?
    
    func startFetchForgotPassword(data: ForgotPasswordModel, nav: UINavigationController) {
        interactor?.fetchForgotPassword(data: data, nav: nav)
    }
    
    func navToCreatePassword(data: String, nav: UINavigationController) {
        router?.goToCreatePassword(data: data, nav: nav)
    }
    
    func navToLogin(nav: UINavigationController) {
        router?.goToLogin(nav: nav)
    }
    
    
}

extension ForgotPasswordPresenter: ITPForgotPasswordProtocol{
    func onSuccessRegis() {
        view?.SuccessForgot()
    }
    
    func onFailedRegis(error: String) {
        view?.FailedForgot(error: error)
    }
    
    
}
