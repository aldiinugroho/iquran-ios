//
//  ViewController.swift
//  iquran
//
//  Created by aldinugroho on 09/03/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mview: UIView = {
        let ctx = UIView()
        ctx.backgroundColor = .cColorbasegray
        return ctx
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuplayoutbase()
        setuplayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setuplayoutTopSafeArea()
    }
    
    private func setuplayout() {
        self.view.addSubview(mview)
    }
    
    private func setuplayoutTopSafeArea() {
        mview.snp.remakeConstraints { make in
            let topEdgeInset: CGFloat = UIApplication.topSafeArea()
            make.top.equalTo(self.view.snp.top).inset(UIEdgeInsets(top: topEdgeInset, left: 0, bottom: 0, right: 0))
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
    }
    
    private func setuplayoutbase() {
        self.view.backgroundColor = .cColorbasegreen
    }
}
