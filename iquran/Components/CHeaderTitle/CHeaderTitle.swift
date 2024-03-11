//
//  CHeaderTitle.swift
//  iquran
//
//  Created by aldinugroho on 10/03/24.
//

import Foundation
import SnapKit
import UIKit

class CHeaderTitle: UIView {
    
    let labelTitle: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "IQURAN")
        ctx.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        ctx.textColor = .white
        return ctx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
        }
        
        self.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
