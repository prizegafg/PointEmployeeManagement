//
//  SuccessRegisterVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import UIKit

class SuccessRegisterVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnNavigate: RoundedCornerButton!
    
    
    var presenter: VTPRegisterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: SetUp View
        lblTitle.text = "Registration Success"
        lblDesc.text = "Please Login to Your New Account"
        btnNavigate.setTitle("Login", for: .normal)
        
        //MARK: SetUp Action
        btnNavigate.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc func goToLogin(){
        if let navigation = navigationController{
            presenter?.navToLogin(nav: navigation)
        }
    }

}

extension SuccessRegisterVC: PTVRegisterProtocol{
    func SuccessRegis() {}
    func FailedRegid(error: String) {}
}
