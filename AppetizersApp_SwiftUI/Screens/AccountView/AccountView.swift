//
//  AccountView.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 11/01/25.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FocusedTextField?
    
    enum FocusedTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("FirstName", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("LastName", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    
                    DatePicker("BirthDay", selection: $viewModel.user.birthDay, displayedComponents: .date)
                        .tint(.brandPrimary)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                } header: {
                    Text("Requests")
                }
                .tint(Color.brandPrimary)

            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
            .navigationTitle("👩‍🦰 Accounts")
            
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        })
    }
}

#Preview {
    AccountView()
}
