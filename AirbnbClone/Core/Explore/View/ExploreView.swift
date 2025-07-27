//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Andre on 19/07/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack{
            
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView)
            }
            else{
                ScrollView{
                    SearchAndFilterbar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack (spacing: 32){
                        ForEach(0...10, id: \.self){ listing in
                            NavigationLink(value: listing){
                                ListingItemView()
                                       .frame(height:410)
                                       .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self){ listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
            
        }
    }
}

#Preview {
    ExploreView()
}
