//
//  ContentView.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tasks = Task.getTasks()

    private var pendingTasks: [Binding<Task>] { $tasks.filter { !$0.isCompleted.wrappedValue } }
    private var completedTasks: [Binding<Task>] { $tasks.filter { $0.isCompleted.wrappedValue } }

    var body: some View {

        VStack {
            List {
                Section("En cours") {
                    ForEach(pendingTasks) { $task in
                        TaskViewCell(task: $task)
                    }
                }

                Section("Terminé") {
                    ForEach(completedTasks) { $task in
                        TaskViewCell(task: $task)
                    }
                }
            }
            Spacer()
            AddTaskView()
                .padding()
                .shadow(radius: 2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
