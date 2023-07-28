//
//  ForgotPasswordProtocol.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit


protocol PTVForgotPasswordProtocol: AnyObject {
    func SuccessForgot()
    func FailedForgot(error: String)
}

protocol VTPForgotPasswordProtocol: AnyObject {
    var view: PTVForgotPasswordProtocol? {get set}
    var interactor: PTIForgotPasswordProtocol? {get set}
    var router: PTRForgotPasswordProtocol? {get set}
    
    func startFetchForgotPassword(data: ForgotPasswordModel, nav: UINavigationController)
    func navToCreatePassword(data: String, nav: UINavigationController)
    func navToLogin(nav: UINavigationController)
}

protocol PTRForgotPasswordProtocol: AnyObject {
    static func createForgotEmailModule() -> ForgotInputEmailVC
    static func createCreatePasswordModule() -> ForgotCreatePasswordVC
    func goToCreatePassword(data: String, nav: UINavigationController)
    func goToLogin(nav: UINavigationController)
    
}

protocol PTIForgotPasswordProtocol: AnyObject {
    var presenter: ITPForgotPasswordProtocol? {get set}
    func fetchForgotPassword(data: ForgotPasswordModel, nav: UINavigationController)
}

protocol ITPForgotPasswordProtocol: AnyObject {
    func onSuccessRegis()
    func onFailedRegis(error: String)
    
}

