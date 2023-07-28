//
//  ForgotCreatePasswordVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import UIKit

class ForgotCreatePasswordVC: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    
    var presenter: VTPForgotPasswordProtocol?
    var email: String?
    var data = ForgotPasswordModel()
    var tag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        navigationBar.setTitle("Forgot Password")
        lblDesc.text = "Please create your new password"
        txtPassword.placeholder = "Password"
        txtRepeatPassword.placeholder = "Repeat Password"
        txtPassword.isHidden = false
        txtRepeatPassword.isHidden = false
        
        txtPassword.isSecureTextEntry = true
        txtRepeatPassword.isSecureTextEntry = true
        btnContinue.setTitle("Continue", for: .normal)
    }
    
    func setUpAction(){
        btnContinue.addTarget(self, action: #selector(onClickContinue), for: .touchUpInside)
    }
    
    func setUpOtherView(){
        navigationBar.setTitle("Forgot Password")
        lblDesc.text = "Success Create your new Password"
        txtPassword.isHidden = true
        txtRepeatPassword.isHidden = true
        
        btnContinue.setTitle("Login", for: .normal)
    }
    
    @objc func onClickContinue(){
        if let navigation = navigationController {
            switch tag {
            case 1:
                data.email = email
                data.password = txtPassword.text
                presenter?.startFetchForgotPassword(data: data, nav: navigation)
            case 2:
                presenter?.navToLogin(nav: navigation)
            default:
                break
            }
        }
        
    }


}

extension ForgotCreatePasswordVC: PTVForgotPasswordProtocol{
    func SuccessForgot() {
        tag = 2
        setUpOtherView()
        
    }
    
    func FailedForgot(error: String) {
    }
    
    
}
