//
//  PageModel.swift
//  Pinch
//
//  Created by Dhruv Patel on 22/06/26.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
     return "thumb-" + imageName
    }
}
