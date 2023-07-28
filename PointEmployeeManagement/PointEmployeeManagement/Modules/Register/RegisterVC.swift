//
//  RegisterVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    @IBOutlet weak var btnRegister: RoundedCornerButton!
    @IBOutlet weak var lblOtherOption: UILabel!
    @IBOutlet weak var btnLogin: RoundedCornerButton!
    @IBOutlet weak var btnHideUnhidePass: UIButton!
    @IBOutlet weak var btnHideUnhideRePass: UIButton!
    
    var presenter: VTPRegisterProtocol?
    var data = RegisModel()
    var showPopup = true
    var passHide = true
    var rePassHide = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        navigationBar.setTitle("Register")
        txtFirstName.placeholder = "First Name"
        txtLastName.placeholder = "Last Name"
        txtUsername.placeholder = "Username"
        txtEmail.placeholder = "Email"
        txtPassword.placeholder = "Password"
        txtRepeatPassword.placeholder = "Repeat Password"
        btnRegister.setTitle("Register", for: .normal)
        btnLogin.setTitle("Login", for: .normal)
        lblOtherOption.text = "Already Have Account?"
        
        txtFirstName.layer.borderColor = UIColor.gray.cgColor
        txtLastName.layer.borderColor = UIColor.gray.cgColor
        txtUsername.layer.borderColor = UIColor.gray.cgColor
        txtEmail.layer.borderColor = UIColor.gray.cgColor
        txtPassword.layer.borderColor = UIColor.gray.cgColor
        txtRepeatPassword.layer.borderColor = UIColor.gray.cgColor
        
        txtFirstName.layer.borderWidth = 1
        txtLastName.layer.borderWidth = 1
        txtUsername.layer.borderWidth = 1
        txtEmail.layer.borderWidth = 1
        txtPassword.layer.borderWidth = 1
        txtRepeatPassword.layer.borderWidth = 1
        
        txtFirstName.layer.cornerRadius = 5
        txtLastName.layer.cornerRadius = 5
        txtUsername.layer.cornerRadius = 5
        txtEmail.layer.cornerRadius = 5
        txtPassword.layer.cornerRadius = 5
        txtRepeatPassword.layer.cornerRadius = 5
        
        btnHideUnhidePass.setTitle("", for: .normal)
        btnHideUnhideRePass.setTitle("", for: .normal)
        
        btnHideUnhidePass.setImage(UIImage(named: "eye"), for: .normal)
        btnHideUnhideRePass.setImage(UIImage(named: "eye"), for: .normal)
        btnHideUnhidePass.tintColor = UIColor.black
        btnHideUnhideRePass.tintColor = UIColor.black
        btnHideUnhidePass.tag = 1
        btnHideUnhideRePass.tag = 2
        
        
        
    }
    
    func setUpAction(){
        btnRegister.addTarget(self, action: #selector(regisPressed), for: .touchUpInside)
        btnLogin.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        btnHideUnhidePass.addTarget(self, action: #selector(hideUnhide(_ :)), for: .touchUpInside)
        btnHideUnhideRePass.addTarget(self, action: #selector(hideUnhide(_ :)), for: .touchUpInside)
        txtFirstName.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidBegin)
        txtLastName.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidBegin)
        txtUsername.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidBegin)
        txtEmail.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidBegin)
        txtPassword.addTarget(self, action: #selector(passwordPressed), for: .editingDidBegin)
        txtRepeatPassword.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidBegin)
        
    }
    
    func goToSuccess(){
        if let navigation = navigationController{
            presenter?.navToSuccessRegis(nav: navigation)
        }
    }
    
    @objc func hideUnhide(_ sender: UIButton){
        if sender.tag == 1 {
            if passHide == true {
                passHide = false
                btnHideUnhidePass.setImage(UIImage(named:  "eye.slash"), for: .normal)
                txtPassword.isSecureTextEntry = false
            } else {
                passHide = true
                btnHideUnhidePass.setImage(UIImage(named: "eye"), for: .normal)
                txtPassword.isSecureTextEntry = true
            }
            
        } else if sender.tag == 2 {
            if rePassHide == true {
                rePassHide = false
                btnHideUnhideRePass.setImage(UIImage(named: "eye.slash"), for: .normal)
                txtRepeatPassword.isSecureTextEntry = false
            } else {
                rePassHide = true
                btnHideUnhideRePass.setImage(UIImage(named: "eye"), for: .normal)
                txtRepeatPassword.isSecureTextEntry = true
            }
        }
    }
    
    @objc func regisPressed(){
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let alert = (self.presentedViewController as? UIAlertController) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        let actions = [okAction]
        
        if txtFirstName.text?.isEmpty == true {
            txtFirstName.layer.borderColor = UIColor.red.cgColor
            Alert.showAlert(title: "FirstName is Empty", message: "Please fill FirstName", actions: actions, on: self)
        }
        
        if txtLastName.text?.isEmpty == true {
            txtLastName.layer.borderColor = UIColor.red.cgColor
            Alert.showAlert(title: "Lastname is Empty", message: "Please fill Lastname", actions: actions, on: self)
        }
        
        if txtUsername.text?.isEmpty == true {
            txtUsername.layer.borderColor = UIColor.red.cgColor
            Alert.showAlert(title: "Username is Empty", message: "Please fill Username", actions: actions, on: self)
        }
        
        if txtEmail.text?.isEmpty == true {
            txtEmail.layer.borderColor = UIColor.red.cgColor
            Alert.showAlert(title: "Email is Empty", message: "Please fill Email", actions: actions, on: self)
        }
        
        if txtPassword.text?.isEmpty == true {
            txtPassword.layer.borderColor = UIColor.red.cgColor
            Alert.showAlert(title: "Password is Empty", message: "Please fill Password", actions: actions, on: self)
        }
        
        if txtRepeatPassword.text?.isEmpty == true {
            txtRepeatPassword.layer.borderColor = UIColor.red.cgColor
            Alert.showAlert(title: "Repeat Password is Empty", message: "Please fill Repeat Password", actions: actions, on: self)
        }
        
        if txtPassword.text == txtRepeatPassword.text && txtFirstName.text?.isEmpty == false && txtLastName.text?.isEmpty == false && txtUsername.text?.isEmpty == false && txtEmail.text?.isEmpty == false && txtPassword.text?.isEmpty == false && txtRepeatPassword.text?.isEmpty == false {
            
            data.firstName = txtFirstName.text!
            data.lastName = txtLastName.text!
            data.userName = txtUsername.text!
            data.email = txtEmail.text!
            data.password = txtPassword.text!
            
            if let navigation = navigationController {
                self.presenter?.navToSuccessRegis(nav: navigation)
//                self.presenter?.startFetchRegister(data: data, nav: navigation)
            }
        } else if txtPassword.text != txtRepeatPassword.text {
            Alert.showAlert(title: "Password that entered did not same", message: "Please double check your password and repeat password", actions: actions, on: self)
        }
        
        
    }
    
    @objc func loginPressed(){
        if let navigation = navigationController {
            presenter?.navToLogin(nav: navigation)
        }
        
        
    }
    
    @objc func passwordPressed(){
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let alert = (self.presentedViewController as? UIAlertController) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        let actions = [okAction]
        
        if showPopup == true {
            showPopup = false
            Alert.showAlert(title: "Password", message: "Password must contain at least one UPPERCASE, lowercase, and number", actions: actions, on: self)
        } else if showPopup == false{
           textFieldDidChange()
        }
    }
    
    @objc func textFieldDidChange(){
        txtFirstName.layer.borderColor = UIColor.gray.cgColor
        txtLastName.layer.borderColor = UIColor.gray.cgColor
        txtUsername.layer.borderColor = UIColor.gray.cgColor
        txtEmail.layer.borderColor = UIColor.gray.cgColor
        txtPassword.layer.borderColor = UIColor.gray.cgColor
        txtRepeatPassword.layer.borderColor = UIColor.gray.cgColor
        
        if txtFirstName.isFirstResponder {
            txtFirstName.layer.borderColor = UIColor.blue.cgColor
        } else if txtFirstName.text?.isEmpty == false {
            txtFirstName.layer.borderColor = UIColor.blue.cgColor
        }
        
        if txtLastName.isFirstResponder {
            txtLastName.layer.borderColor = UIColor.blue.cgColor
        } else if txtLastName.text?.isEmpty == false {
            txtLastName.layer.borderColor = UIColor.blue.cgColor
        }
        
        if txtUsername.isFirstResponder {
            txtUsername.layer.borderColor = UIColor.blue.cgColor
        } else if txtUsername.text?.isEmpty == false {
            txtUsername.layer.borderColor = UIColor.blue.cgColor
        }
        
        if txtEmail.isFirstResponder {
            txtEmail.layer.borderColor = UIColor.blue.cgColor
        } else if txtEmail.text?.isEmpty == false {
            txtEmail.layer.borderColor = UIColor.blue.cgColor
        }
        
        if txtPassword.isFirstResponder {
            txtPassword.layer.borderColor = UIColor.blue.cgColor
        } else if txtPassword.text?.isEmpty == false {
            txtPassword.layer.borderColor = UIColor.blue.cgColor
        }
        
        if txtRepeatPassword.isFirstResponder {
            txtRepeatPassword.layer.borderColor = UIColor.blue.cgColor
        } else if txtRepeatPassword.text?.isEmpty == false {
            txtRepeatPassword.layer.borderColor = UIColor.blue.cgColor
        }
        
        
        
    }

}

extension RegisterVC: PTVRegisterProtocol{
    func SuccessRegis() {
        goToSuccess()
    }
    
    func FailedRegid(error: String) {
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let alert = (self.presentedViewController as? UIAlertController) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        let actions = [okAction]
        Alert.showAlert(title: "Error", message: error, actions: actions, on: self)
    }
    
    
}
