//
//  ContentView.swift
//  PokemonCoreData
//
//  Created by Norman Okolo on 30/04/2023.
//

import SwiftUI
import CoreData
import FirebaseAnalytics

struct ContentView: View {
    
    @State private var isShowingDestination = false
    
    var body: some View {
        NavigationStack{
            TabView {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
                    .ignoresSafeArea()
                    .overlay (
                        VStack {
                            Text("Welcome to my PokeDex")
                                .font(.title)
                                .fontWeight(.heavy)
                                .padding(.bottom, 40)
                                .foregroundColor(.white)
                            Text("Swipe through for more")
                                .foregroundColor(.white)
                        }
                    )
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
                    .ignoresSafeArea()
                    .overlay (
                        VStack {
                            Text("Demonstrates the use of Core Data")
                                .font(.title)
                                .fontWeight(.heavy)
                                .padding(.bottom, 40)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Text("Click each cell for more information on each Pokemon")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 70)
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(maxWidth: 50, maxHeight: 50)
                                .foregroundColor(.white)
                        }
                    )
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
                    .ignoresSafeArea()
                    .overlay (
                        VStack {
                            Text("That's all!")
                                .font(.title)
                                .fontWeight(.heavy)
                                .padding(.bottom, 40)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Text("Enjoy.")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 60)
                            Button {
                                self.isShowingDestination.toggle()
                                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                                  AnalyticsParameterItemID: "id-\("Pokemon")",
                                  AnalyticsParameterItemName: "Pokemon",
                                  AnalyticsParameterContentType: "cont",
                                ])
                            } label: {
                                Text("Done")
                                    .frame(maxWidth: 50)
                            }.buttonStyle(.borderedProminent)
                                .padding()
                                .foregroundColor(.black)
                                .tint(.white)
                                .background(
                                                NavigationLink(destination: ListView(), isActive: $isShowingDestination) {
                                                    EmptyView()
                                                })
                        })
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        
    }
}

//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
