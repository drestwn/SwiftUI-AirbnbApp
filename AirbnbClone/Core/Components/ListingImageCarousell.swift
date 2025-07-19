//
//  ListingImageCarousell.swift
//  AirbnbClone
//
//  Created by Andre on 19/07/25.
//

import SwiftUI

struct ListingImageCarousell: View {
    
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
        
    ]
    var body: some View {
        TabView{
            ForEach(images, id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        
        .tabViewStyle(.page) //carousell on the bottom
    }
}

#Preview {
    ListingImageCarousell()
}
