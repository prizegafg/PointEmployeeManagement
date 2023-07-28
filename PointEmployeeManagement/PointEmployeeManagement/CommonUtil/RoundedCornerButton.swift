//
//  RoundedButton.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit

class RoundedCornerButton: UIButton {
    // Customizable properties
    private let cornerRadius: CGFloat = 8.0
    private let borderWidth: CGFloat = 2.0
    private let borderColor: UIColor = .black
    private let buttonColor: UIColor = .systemBlue
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // MARK: - Private Methods
    
    private func setupButton() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        backgroundColor = buttonColor
        
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
    }
}
