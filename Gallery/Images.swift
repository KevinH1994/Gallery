//
//  Images.swift
//  Gallery
//
//  Created by Kevin Hering on 02.09.22.
//

import Foundation
import UIKit

struct Image{
    
    static let MonaLisa: UIImage = UIImage(named:"mona_lisa.jpeg")!
    static let DerSchrei: UIImage = UIImage(named:"der_schrei.jpeg")!
    static let Bild1 : UIImage = UIImage (named:"bild1.jpeg")!
    static let Bild2 : UIImage = UIImage (named:"bild2.jpeg")!
    static let Bild3 : UIImage = UIImage (named:"bild3.jpeg")!
    static let Bild4 : UIImage = UIImage (named:"bild4.jpeg")!
    static let Bild5 : UIImage = UIImage (named:"bild5.jpeg")!
    static let Bild6 : UIImage = UIImage (named:"bild6.jpeg")!
    static let Bild7 : UIImage = UIImage (named:"bild7.jpeg")!
    static let Bild8 : UIImage = UIImage (named:"bild8.jpeg")!
    static let Bild9 : UIImage = UIImage (named:"bild9.jpeg")!
    static let Bild10 : UIImage = UIImage (named:"bild10.jpeg")!
    
}

extension UIViewController{
    func pushView(viewController : UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(viewController , animated: true)
    }
    func dismissView(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .reveal
        transition.subtype = .fromBottom
        self.view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: true)
    }
}
