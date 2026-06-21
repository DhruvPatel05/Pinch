//
//  ControlImageView.swift
//  Pinch
//
//  Created by Dhruv Patel on 21/06/26.
//

import SwiftUI

struct ControlImageView: View {
    let icon:String
    
    var body: some View {
        Image(systemName: icon)
            .font(Font.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
