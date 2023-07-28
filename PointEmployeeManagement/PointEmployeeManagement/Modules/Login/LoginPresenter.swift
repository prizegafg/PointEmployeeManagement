//
//  LoginPresenter.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

class LoginPresenter: VTPLoginProtocol{
    var view: PTVLoginProtocol?
    var interactor: PTILoginProtocol?
    var router: PTRLoginProtocol?
    
    func startFetchLogin(data: LoginModel, nav: UINavigationController) {
        interactor?.fetchLogin(data: data, nav: nav)
    }
    
    func navToMainMenu(nav: UINavigationController) {
        router?.goToMainMenu(nav: nav)
    }
    
    func navToRegis(nav: UINavigationController){
        router?.goToRegister(nav: nav)
    }
    
    func navToForgotPassword(nav: UINavigationController) {
        router?.goToForgotPassword(nav: nav)
    }
    
    
}

extension LoginPresenter: ITPLoginProtocol{
    func onSucessLogin() {
        view?.successLogin()
    }
    
    func onFailedLogin(error: String) {
        view?.failedLogin(error: error)
    }
    
    
}
