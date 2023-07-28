//
//  RegisterProtocol.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit


protocol PTVRegisterProtocol: AnyObject {
    func SuccessRegis()
    func FailedRegid(error: String)
}

protocol VTPRegisterProtocol: AnyObject {
    var view: PTVRegisterProtocol? {get set}
    var interactor: PTIRegisterProtocol? {get set}
    var router: PTRRegisterProtocol? {get set}
    
    func startFetchRegister(data: RegisModel, nav: UINavigationController)
    func navToSuccessRegis(nav: UINavigationController)
    func navToLogin(nav: UINavigationController)
}

protocol PTRRegisterProtocol: AnyObject {
    static func createRegisterModule() -> RegisterVC
    static func createSuccessRegisterModule() -> SuccessRegisterVC
    func goToSuccess(nav: UINavigationController)
    func goToLogin(nav: UINavigationController)
    
}

protocol PTIRegisterProtocol: AnyObject {
    var presenter: ITPRegisterProtocol? {get set}
    func fetchRegister(data: RegisModel, nav: UINavigationController)
}

protocol ITPRegisterProtocol: AnyObject {
    func onSuccessRegis()
    func onFailedRegis(error: String)
    
}

