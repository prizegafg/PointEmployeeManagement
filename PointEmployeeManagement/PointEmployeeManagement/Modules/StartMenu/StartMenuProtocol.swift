//
//  StartMenuProtocol.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

protocol PTVStartMenuProtocol: AnyObject {
}

protocol VTPStartMenuProtocol: AnyObject {
    var view: PTVStartMenuProtocol? {get set}
    var interactor: PTIStartMenuProtocol? {get set}
    var router: PTRStartMenuProtocol? {get set}
    
    func navToLogin(nav: UINavigationController)
    func navToRegister(nav: UINavigationController)
}

protocol PTRStartMenuProtocol: AnyObject {
    static func createStartMenuModule() -> StartMenuVC
    func goToLogin(nav: UINavigationController)
    func goToRegister(nav: UINavigationController)
    
}

protocol PTIStartMenuProtocol: AnyObject {
    var presenter: ITPStartMenuProtocol? {get set}
}

protocol ITPStartMenuProtocol: AnyObject {
    
}
