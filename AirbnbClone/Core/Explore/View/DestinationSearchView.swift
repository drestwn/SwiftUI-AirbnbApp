//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Andre on 22/07/25.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    withAnimation(.snappy){
                        show.toggle()
                    }
                    
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination )
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    CollapsePickerView(title: "Where to", description: "Add destinations")
                }
                
            }
            .modifier(CollapseableDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy, { selectedOption = .location})
            }
            //dateselectview
            VStack(alignment: .leading) {
                if selectedOption == .dates{
                    Text("When your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker("From",selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To",selection: $endDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    CollapsePickerView(title: "When", description: "Add Dates")
                }
            }
            .modifier(CollapseableDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy, {  selectedOption = .dates})
                
            }
            //numguestview
            VStack (alignment: .leading){
                if selectedOption == .guests {
                  Text("Who's Coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                      numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else {return}
                      numGuests -= 1
                    }
                    
                }else{
                    CollapsePickerView(title: "Who", description: "Add Guests")
                }
            }
         
     
            .modifier(CollapseableDestinationViewModifier())
            .frame(height: selectedOption  == .guests ? 120 : 64)
            .onTapGesture {
                
                withAnimation(.snappy, { selectedOption = .guests})
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}
struct CollapseableDestinationViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsePickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                
                
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
