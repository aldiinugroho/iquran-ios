//
//  MainLv.swift
//  iquran
//
//  Created by aldinugroho on 11/03/24.
//

import Foundation
import UIKit
import SnapKit

class MainLv: UIView {
    
    let sampledata: [String] = [
        "TESTING","TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
            "TESTING",
            "TESTING",
        "TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
        "TESTING","TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
            "TESTING",
            "TESTING",
        "TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
        "TESTING","TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
            "TESTING",
            "TESTING",
        "TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
        "TESTING","TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
            "TESTING",
            "TESTING",
        "TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
        "TESTING","TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
            "TESTING",
            "TESTING",
        "TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
        "TESTING","TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING",
            "TESTING",
            "TESTING",
        "TESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTINGTESTING"
    ]
    var mainlv: UICollectionView!
    var collectionViewFlowlayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuplayoutbase()
        setuplayout()
    }
    
    private func setuplayoutbase() {
        self.backgroundColor = .cColorbasegray
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setuplayout() {
        collectionViewFlowlayout.scrollDirection = .vertical
        collectionViewFlowlayout.minimumInteritemSpacing = 0
        collectionViewFlowlayout.minimumLineSpacing = 1
        collectionViewFlowlayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        mainlv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowlayout)
        mainlv.register(ViewSubCell.self, forCellWithReuseIdentifier: "CELL")
        mainlv.dataSource = self
        mainlv.delegate = self
        self.addSubview(mainlv)
        mainlv.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainLv: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! ViewSubCell
        cell.setupdata(data: sampledata[indexPath.item], width: collectionView.bounds.width)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampledata.count
    }
}

class ViewSubCell: UICollectionViewCell {
    
    var collectionViewWidth: CGFloat = 0
    var collectionViewHeight: CGFloat = 0
    
    let samplelabel: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "IQURAN")
        ctx.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        ctx.textColor = .white
        ctx.numberOfLines = 100
        return ctx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuplayoutbase()
    }
    
    func setupdata(data: String, width: CGFloat) {
        samplelabel.text = data
        collectionViewWidth = width
        self.layoutIfNeeded()
        self.setNeedsLayout()
    }
    private func setuplayoutbase() {
        self.backgroundColor = .systemPink
        self.addSubview(samplelabel)
        samplelabel.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attr = super.preferredLayoutAttributesFitting(layoutAttributes)
        let targetSize = CGSize(width: attr.frame.width, height: UIView.layoutFittingCompressedSize.height)
        let size = samplelabel.sizeThatFits(targetSize)
        frame.size.width = collectionViewWidth
        frame.size.height = ceil(size.height)
        attr.frame = frame
        return attr
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
