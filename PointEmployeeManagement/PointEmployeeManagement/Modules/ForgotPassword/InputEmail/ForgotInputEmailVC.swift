//
//  ForgotInputEmailVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import UIKit

class ForgotInputEmailVC: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    
    var presenter: VTPForgotPasswordProtocol?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        navigationBar.setTitle("Forgot Password")
        lblDesc.text = "Please enter your log in email"
        txtEmail.placeholder = "Email"
        btnContinue.setTitle("Continue", for: .normal)
    }
    
    func setUpAction(){
        btnContinue.addTarget(self, action: #selector(onClickContinue), for: .touchUpInside)
    }
    
    @objc func onClickContinue(){
        email = txtEmail.text
        
        if let navigation = navigationController{
            presenter?.navToCreatePassword(data: email!, nav: navigation)
        }
    }


}

extension ForgotInputEmailVC: PTVForgotPasswordProtocol{
    func SuccessForgot() {}
    func FailedForgot(error: String) {}
}
