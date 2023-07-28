//
//  StartMenuVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import UIKit

class StartMenuVC: UIViewController {
    
    @IBOutlet weak var btnLogIn: RoundedCornerButton!
    @IBOutlet weak var btnRegis: RoundedCornerButton!
    var presenter: VTPStartMenuProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: SetUp View
        
        btnRegis.setTitle("Register", for: .normal)
        btnLogIn.setTitle("Login", for: .normal)
        
        // MARK: SetUp Action
        
        btnRegis.addTarget(self, action: #selector(regisTapped), for: .touchUpInside)
        btnLogIn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
    }
    
    @objc func regisTapped(){
        if let navigation = navigationController {
            presenter?.navToRegister(nav: navigation)
        }
    }
    
    @objc func loginTapped(){
        if let navigation = navigationController {
            presenter?.navToLogin(nav: navigation)
        }
    }




}

extension StartMenuVC: PTVStartMenuProtocol{
    
}
