//
//  WebImageView.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

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
                    self.image = image
                }
            }
        }
    }
}
