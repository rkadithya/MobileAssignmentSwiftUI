//
//  ContentView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject  var viewModel = ContentViewModel()
    var body: some View {
        NavigationStack {
            VStack{
            List(viewModel.data){ data in
                
                NavigationLink(destination: DetailView(device: data)){
               let color = data.data?.color
                    let capacity = data.data?.capacity

                VStack(alignment: .leading, spacing: 5){
                    Text(data.name)
                        .font(.headline)
                    if (color != nil){
                        Text("Color: \(color ?? "")")
                            .font(.subheadline)

                    }
                    
                    if (capacity != nil){
                        Text("Capacity: \(capacity ?? "")")
                            .font(.subheadline)



                    }
                }
            }}
        }}.onAppear(perform: viewModel.fetchAPI)
    }
}
#Preview {
    ContentView()
}
