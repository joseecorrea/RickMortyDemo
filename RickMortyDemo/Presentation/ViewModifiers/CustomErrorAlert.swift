//
//  CustomErrorAlert.swift
//  RickMortyDemo
//
//  Created by Jose E on 7/7/23.
//

import SwiftUI

struct CustomErrorAlert: ViewModifier {
    
    @Binding var errorOcurred: Bool
    
    var retryFunction: (() -> ())?
    
    func body(content: Content) -> some View {
        content
            .alert(Constants.Strings.error, isPresented: $errorOcurred) {
            if let retryFunction {
                Button(Constants.Strings.retry) {
                    retryFunction()
                }
            }
                Button(Constants.Strings.ok) {}
        } message: {
            Text(Constants.Strings.sWentWrong)
        }
    }
}



extension View {
    func customErrorAlert(isPresented: Binding<Bool>, retryComplention: (() -> ())? = nil) -> some View {
        modifier(CustomErrorAlert(errorOcurred: isPresented, retryFunction: retryComplention))
    }
}
