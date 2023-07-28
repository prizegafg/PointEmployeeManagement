//
//  MenuVC.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 28/07/23.
//

import UIKit

class MenuVC: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnAttendance: UIButton!
    @IBOutlet weak var btnUpdateData: UIButton!
    
    var presenter: VTPMenuProtocol?
    var email: String?
    var userName: String? = ""
    var data = MenuModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        navigationBar.setTitle("Menu")
        lblTitle.text = "Hello, \(userName ?? "User")"
        btnAttendance.setTitle("Attendance", for: .normal)
        btnUpdateData.setTitle("Update Data", for: .normal)
    }
    
    func setUpAction(){
        btnAttendance.addTarget(self, action: #selector(onClickAttendance), for: .touchUpInside)
        btnUpdateData.addTarget(self, action: #selector(onClickUpdateData), for: .touchUpInside)
    }
    
    func setUpData(){
        data.email = email
        data.userName = userName
    }
    
    @objc func onClickAttendance(){
        if let navigation = navigationController{
            presenter?.navToAttendance(data: data, nav: navigation)
        }
    }
    
    @objc func onClickUpdateData(){
        if let navigation = navigationController{
            presenter?.navToChangeData(data: data, nav: navigation)
        }
    }


}

extension MenuVC: PTVMenuProtocol{}
