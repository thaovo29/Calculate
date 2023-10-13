//
//  ContentView.swift
//  Calculus
//
//  Created by Thao Vo on 13/10/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel: CalculusViewModel
    
    var body: some View {
        VStack {
            TextField("First number", text: $viewModel.firstNum)
                .textFieldStyle(.roundedBorder)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            Picker(
                "Choose operator",
                selection: $viewModel.calOperator
            ) {
                ForEach(viewModel.operatorOptions, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .buttonStyle(.bordered)
            .padding(.leading, 20)
            
            TextField("Second number", text: $viewModel.secondNum)
                .textFieldStyle(.roundedBorder)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .onSubmit {
                    viewModel.cal()
                }
            
            Button("Calculate") {
                viewModel.cal()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)
            
            Text(viewModel.errorMessage)
                .foregroundColor(.red)
                .padding(.leading, 20)
            
            Text(viewModel.ans)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CalculusViewModel())
    }
}
