//
//  ImageVC.swift
//  Gallery
//
//  Created by Kevin Hering on 09.09.22.
//

import UIKit

class ImageVC: UIViewController, UIScrollViewDelegate {
    
    var selectedIndex: Int = 0
    var imageArray: [MyCustomData] = []
    
    
    fileprivate let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentMode = .scaleAspectFit
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.backgroundColor = .black
        sv.minimumZoomScale = 1
        sv.maximumZoomScale = 6
        return sv
    }()
    
    fileprivate let img: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    fileprivate let closeBtn: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "ic_close")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget (ImageVC.self, action: #selector(closeBtnTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate let countlbl: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraint()
        loadImage()
        setupGesture()

       
    }
    func setupView(){
        view.backgroundColor = .black
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(img)
        view.addSubview(countlbl)
        view.addSubview(closeBtn)
    }
    func setupConstraint(){
        scrollView.frame = view.bounds
        img.frame = scrollView.bounds
        
        countlbl.frame = CGRect(x: 20, y: view.frame.height - 50 , width: view.frame.width - 40, height: 21)
        closeBtn.frame = CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.size.height)!, width: 25, height: 25)
    }
    func setupGesture(){
        let signalTapGesture = UITapGestureRecognizer(target: self, action: #selector (handleSignleTapOnScrollView(recognizer:)))
        signalTapGesture.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(signalTapGesture)
        
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector (handleDoubleTapOnScrollView(recognizer:)))
        doubleTapGesture.numberOfTouchesRequired = 2
        scrollView.addGestureRecognizer(doubleTapGesture)
        
        signalTapGesture.require(toFail: doubleTapGesture)
    }
    
    func loadImage(){
        img.image = imageArray[selectedIndex].image
        countlbl.text = String(format: "%1d / %1d", selectedIndex + 1, imageArray.count)
    }
        
    

    @objc func closeBtnTapped(){
        dismissView()
        
    }
    @objc func handleSignleTapOnScrollView(recognizer: UITapGestureRecognizer){
        if closeBtn.isHidden{
            closeBtn.isHidden = false
            countlbl.isHidden = false
        }else{
            closeBtn.isHidden = true
            countlbl.isHidden = true
        }
        
    }
    @objc func handleDoubleTapOnScrollView(recognizer: UITapGestureRecognizer){
        if scrollView.zoomScale == 1 {
            scrollView.zoom(to: zoomRectForScale(scale: scrollView.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
            closeBtn.isHidden = true
            countlbl.isHidden = true
        }else{
            scrollView.setZoomScale(1, animated: true)
            closeBtn.isHidden = false
            countlbl.isHidden = false
        }
        
        
        func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect{
            var zoomRect = CGRect.zero
            zoomRect.size.height = img.frame.size.height / scale
            zoomRect.size.width = img.frame.size.width / scale
            
            let newCenter = img.convert(center,from: scrollView)
            zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
            zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
            
            return zoomRect
        }
        
        func viewForZooming(in scrollView: UIScrollView) ->UIView?{
            return img
        }
        
        
        
    }

}
