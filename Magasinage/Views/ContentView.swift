//
//  ContentView.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var taskText = ""
    @State private var settingsIsPresented = false
    @EnvironmentObject private var data: DataStore

   // private var pendingTasks: [Binding<Task>] { $tasks.filter { !$0.isCompleted.wrappedValue } }
//
//    private var completedTasks: [Binding<Task>] { $tasks.filter { $0.isCompleted.wrappedValue } }

    private var pendingTasks: [Task] { data.tasks.filter { !$0.isCompleted }}
    private var completedTasks: [Task] { data.tasks.filter { $0.isCompleted }}
    
    var body: some View {

        NavigationStack {
            VStack {
                List {
                    Section("En cours") {
                        if pendingTasks.isEmpty {
                            HStack {
                                Spacer()
                                Image("list")
                                    .resizable()
                                .frame(width: 150, height: 150)
                                Spacer()
                            }
                        }

                        ForEach(pendingTasks) { task in
                            TaskViewCell(task: task)
                        }
                        .onDelete { index in
                            //code
                        }

                    }

                    Section("Terminé") {

                        if completedTasks.isEmpty {
                            HStack {
                                Spacer()
                                Image("can")
                                    .resizable()
                                .frame(width: 150, height: 150)
                                Spacer()
                            }
                        }

                        ForEach(completedTasks) { task in
                            TaskViewCell(task: task)
                        }
                        .onDelete { index in
                            //code
                        }
                    }
                }


                Spacer()
                AddTaskView(data: _data, taskText: $taskText)
                    .padding(.horizontal)
                    //.background(.gray)
            }
            .navigationBarTitle("Votre liste d'achats")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Réglages") {
                        settingsIsPresented.toggle()
                    }
                    .sheet(isPresented: $settingsIsPresented) {
                        SettingsView()
                    }


                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
