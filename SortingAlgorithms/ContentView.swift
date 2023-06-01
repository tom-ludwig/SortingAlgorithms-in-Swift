//
//  ContentView.swift
//  SortingAlgorithms
//
//  Created by Tommy Ludwig on 01.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var data: [DataModel] = DecodeJSON().decodeJSON("Data")
    var body: some View {
        NavigationStack {
            List {
                ForEach(data) { data in
                    LazyVStack(alignment: .leading) {
                        Text(data.fileURL)
                    }
                }
            }
            .navigationTitle("Sorting")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Button("Bubble Sort") {
                            SortingAlgorithms().bubbleSort(dataSet: &data)
                        }
                        Button("Insertion Sort") {
                            SortingAlgorithms().insertionSort(dataSet: &data)
                        }
                        Button("Selection Sort") {
                            SortingAlgorithms().selectionSort(dataSet: &data)
                        }
                        Button("Merge Sort") {
                            data = SortingAlgorithms().mergeSort(dataSet: data)
                        }
                        Button("Quick Sort") {
                            SortingAlgorithms().quickSort(dataSet: &data, low: 0, high: data.count - 1)
                        }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.square")
                    }
                }
                
                ToolbarItem {
                    Button {
                        data.shuffle()
                    } label: {
                        Image(systemName: "shuffle")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
