//
//  WebImageView.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit


//************************************ This class needs more work, cant be used this with current state *******************

class WebImageView: UIImageView {
    private var _url: String?
    var url: String? {
        set {
            _url = newValue
            downloadImage(from: _url!)
        }
        get { return _url }
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.image = UIImage(named: "user")
    }
    
    private func downloadImage(from url: String){
        self.image = UIImage(named: "user")
        
        ImageDownloader.shared.downloadImage(from: url) { image, error in
            if let image = image {
                DispatchQueue.main.async{
                    if url == self._url {
                        self.image = image
                    }
                }
            }
        }
    }
    
}

extension UIImageView {

public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {

       if self.image == nil{
             self.image = PlaceHolderImage
       }

       URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

           if error != nil {
               print(error ?? "No Error")
               return
           }
           DispatchQueue.main.async(execute: { () -> Void in
               let image = UIImage(data: data!)
               self.image = image
           })

       }).resume()
    }
    
}
