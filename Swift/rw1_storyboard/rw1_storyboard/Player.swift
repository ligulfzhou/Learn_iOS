//
//  Player.swift
//  rw1_storyboard
//
//  Created by zhou ligang on 30/07/2017.
//  Copyright © 2017 zhouligang. All rights reserved.
//

import UIKit

func imageForRating(rating: Int) -> UIImage? {
    let imageName = "\(rating)Stars"
    return UIImage(named: imageName)
}


struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String?, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}
