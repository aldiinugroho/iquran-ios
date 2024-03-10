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
        ctx.backgroundColor = .orange
        return ctx
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuplayoutbase()
        setuplayout()
    }
    
    private func setuplayout() {
        self.view.addSubview(mview)
        mview.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
        }
    }
    
    private func setuplayoutbase() {
        self.view.backgroundColor = .systemPink
    }
}
