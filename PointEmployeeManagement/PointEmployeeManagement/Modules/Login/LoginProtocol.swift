//
//  LoginProtocol.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

protocol PTVLoginProtocol: AnyObject {
    func successLogin()
    func failedLogin(error: String)
}

protocol VTPLoginProtocol: AnyObject {
    var view: PTVLoginProtocol? {get set}
    var interactor: PTILoginProtocol? {get set}
    var router: PTRLoginProtocol? {get set}
    
    func startFetchLogin(data: LoginModel, nav: UINavigationController)
    func navToMainMenu(nav: UINavigationController)
    func navToRegis(nav: UINavigationController)
    func navToForgotPassword(nav: UINavigationController)
}

protocol PTRLoginProtocol: AnyObject {
    static func createLoginModule() -> LoginVC
    func goToMainMenu(nav: UINavigationController)
    func goToRegister(nav: UINavigationController)
    func goToForgotPassword(nav: UINavigationController)
    
}

protocol PTILoginProtocol: AnyObject {
    var presenter: ITPLoginProtocol? {get set}
    func fetchLogin(data: LoginModel, nav: UINavigationController)
}

protocol ITPLoginProtocol: AnyObject {
    func onSucessLogin()
    func onFailedLogin(error: String)
    
}
