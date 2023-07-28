//
//  LoginVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: RoundedCornerButton!
    @IBOutlet weak var btnRegister: RoundedCornerButton!
    @IBOutlet weak var lblOtherOption: UILabel!
    
    var presenter: VTPLoginProtocol?
    var data: LoginModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        txtEmail.placeholder = "Enter your email address"
        txtPassword.placeholder = "Enter your password"
        btnForgotPassword.setTitle("Forgot Password?", for: .normal)
        btnLogin.setTitle("Login", for: .normal)
        btnRegister.setTitle("Register", for: .normal)
        lblOtherOption.text = "Don't Have Account?"
    }
    
    func setUpAction(){
        btnLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        btnRegister.addTarget(self, action: #selector(regis), for: .touchUpInside)
        btnForgotPassword.addTarget(self, action: #selector(forgot), for: .touchUpInside)
        
        
    }
    
    func goToMenu(){
        if let navigation = navigationController{
            presenter?.navToMainMenu(nav: navigation)
        }
    }
    
    @objc func login(){
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let alert = (self.presentedViewController as? UIAlertController) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        let actions = [okAction]

        
        if txtEmail.text == "" || txtPassword.text == "" {
            Alert.showAlert(title: "Email or Password is Empty", message: "Please Fill the Blank", actions: actions, on: self)
            
        } else {
            data?.username = txtEmail.text
            data?.password = txtPassword.text
            if let navigation = navigationController {
                presenter?.startFetchLogin(data: data!, nav: navigation)
            }
        }
        
        
    }
    
    @objc func regis(){
        if let navigation = navigationController {
            presenter?.navToRegis(nav: navigation)
        }
    }
    
    @objc func forgot(){
        if let navigation = navigationController {
            presenter?.navToForgotPassword(nav: navigation)
        }
    }



}

extension LoginVC: PTVLoginProtocol{
    func successLogin() {
        goToMenu()
        
    }
    
    func failedLogin(error: String) {
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let alert = (self.presentedViewController as? UIAlertController) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        let actions = [okAction]
        Alert.showAlert(title: "Error", message: error, actions: actions, on: self)
    }
    
    
}
