//
//  ViewController.swift
//  iquran
//
//  Created by aldinugroho on 09/03/24.
//

import UIKit
import SnapKit

// MARK: CONTROLLER
class ViewController: UIViewController {
    
    let body: BodyMain = {
        let ctx = BodyMain()
        return ctx
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuplayoutbase()
        setuplayout()
    }
    
    private func setuplayoutbase() {
        self.view.backgroundColor = .cColorbasegreen
    }
    
    private func setuplayout() {
        self.view.addSubview(body)
        body.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
}

// MARK: BODY
class BodyMain: UIView {
    
    let ccheader: CHeaderTitle = {
        let ctx = CHeaderTitle()
        return ctx
    }()
    
    let maindisplayer: MainDisplayer = MainDisplayer()
    var mainlv: MainLv = MainLv()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuplayout()
    }
    
    private func setuplayout() {
        self.addSubview(ccheader)
        ccheader.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(UIEdgeInsets(top: UIApplication.topSafeArea(), left: 0, bottom: 0, right: 0))
            make.width.equalTo(self.snp.width)
        }
        self.addSubview(maindisplayer)
        maindisplayer.snp.makeConstraints { make in
            make.top.equalTo(ccheader.snp.bottom)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.width).multipliedBy(0.45)
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.addSubview(mainlv)
        mainlv.snp.makeConstraints { make in
            make.top.equalTo(maindisplayer.snp.bottom)
            make.width.equalTo(self.snp.width)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
