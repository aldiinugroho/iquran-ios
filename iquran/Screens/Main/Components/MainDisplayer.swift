//
//  MainDisplayer.swift
//  iquran
//
//  Created by aldinugroho on 10/03/24.
//

import Foundation
import UIKit
import SnapKit

class MainDisplayer: UIView {
    
    let ivLogo: UIImageView = {
        let ctx = UIImageView()
        ctx.image = UIImage(named: "ramadan")
        ctx.contentMode = .scaleAspectFit
        return ctx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuplayout()
    }
    
    private func setuplayout() {
        self.addSubview(ivLogo)
        ivLogo.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
            make.width.equalTo(self.snp.width).multipliedBy(0.15)
            make.height.equalTo(self.snp.width).multipliedBy(0.15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
