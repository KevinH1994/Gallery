//
//  ViewController.swift
//  Gallery
//
//  Created by Kevin Hering on 02.09.22.
//

import UIKit

struct MyCustomData {
    var image = UIImage()
}

class ViewController: UIViewController {
    
    fileprivate let data = [
        MyCustomData(image: Image.MonaLisa),
        MyCustomData(image: Image.DerSchrei),
        MyCustomData(image: Image.Bild1),
        MyCustomData(image: Image.Bild2),
        MyCustomData(image: Image.Bild3),
        MyCustomData(image: Image.Bild4),
        MyCustomData(image: Image.Bild5),
        MyCustomData(image: Image.Bild6),
        MyCustomData(image: Image.Bild7),
        MyCustomData(image: Image.Bild8),
        MyCustomData(image: Image.Bild9),
        MyCustomData(image: Image.Bild10)
    ]

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MyCustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .white
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gallery"
        
        setupView()
        setupConstraint()
    }
    
    func setupView(){
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func setupConstraint() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}
extension ViewController: UICloudSharingControllerDelegate, UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {
    func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
    
    }
    
    func itemTitle(for csc: UICloudSharingController) -> String? {
        return ""
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCustomCell
        //cell.backgroundColor = .blue
        
        cell.data = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int ) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView : UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize {
        var Width: CGFloat = collectionView.frame.width/4 - 1
        
        if UIDevice.current.orientation.isLandscape {
            Width = collectionView.frame.width/6 - 1
        }
        
        return CGSize (width: Width, height: Width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ImageVC()
        vc.selectedIndex = indexPath.row
        vc.imageArray = data
        pushView(viewController: vc)
    }
}
