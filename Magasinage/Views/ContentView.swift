//
//  ContentView.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var tasks = Task.getTasks()

//    @StateObject private var data = DataStore()

    //@ObservedObject var data = DataStore()
    @State private var taskText = ""
    @EnvironmentObject private var data: DataStore

   // private var pendingTasks: [Binding<Task>] { $tasks.filter { !$0.isCompleted.wrappedValue } }
//
//    private var completedTasks: [Binding<Task>] { $tasks.filter { $0.isCompleted.wrappedValue } }

    private var pendingTasks: [Task] { data.tasks.filter { !$0.isCompleted }}
    private var completedTasks: [Task] { data.tasks.filter { $0.isCompleted }}
    
    var body: some View {

        VStack {
            List {
                Section("En cours") {
                    if pendingTasks.isEmpty {
                        Text("rien")
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
                        Text("rien")
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
                .padding()
                //.background(.gray)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataStore())
    }
}
