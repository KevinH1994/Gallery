//
//  CollectionViewCell.swift
//  Gallery
//
//  Created by Kevin Hering on 02.09.22.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
    
    fileprivate let img: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(img)
        
        img.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        img.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var data : MyCustomData? {
        
        didSet{
            guard let data = data else{return}
            img.image = data.image
        }
    }
}
