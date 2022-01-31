//
//  ContentView.swift
//  addToCalendar
//
//  Created by Muqaddas Haroon on 26/01/2022.
//

import SwiftUI
import EventKit

public struct AddToCalendar: View {
    @State var isChecked: Bool = false
    @State var width: CGFloat = 24
    @State var height: CGFloat = 24
    @State var title: String = "Add To Calendar"
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State var note: String = "Adding a test note swift"
    
    /// This component wil help you add an event to your calendar.
    /// - Parameters:
    ///   - isChecked: a variable to see if the box is checked or not (optional)
    ///   - width width of the box (optional)
    ///   - height: height of the box (optional)
    ///   - title: any Text you want to add with the calendar..
    ///   - startDate: starting date with data type Date (optional)
    ///   - endDate: starting date with data type Date. (optional)
    ///   - note: any additional note you want to add.
    ///
    public init(isChecked: Bool, width: CGFloat, height: CGFloat, title: String, startDate: Date, endDate: Date, note: String) {
        self.isChecked = isChecked
        self.width = width
        self.height = height
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.note = note

    }
  
    public var body: some View {
      
        Button(action:{
            isChecked.toggle()
         if isChecked {
             let eventStore = EKEventStore()
                    
                // 2
                switch EKEventStore.authorizationStatus(for: .event) {
                case .authorized:
                    insertEvent(store: eventStore)
                    case .denied:
                        print("Access denied")
                    case .notDetermined:
                    // 3
                        eventStore.requestAccess(to: .event, completion:
                          {(granted: Bool, error: Error?) -> Void in
                              if granted {
                                insertEvent(store: eventStore)
                              } else {
                                    print("Access denied")
                              }
                        })
                        default:
                            print("Case default")
                }
        }
            
        }){
            Text(title)
    Image(systemName: isChecked ? "checkmark.square": "square").frame(width: width, height: height).foregroundColor(Color.black)
        .padding()
        }
        
    }
    func insertEvent(store: EKEventStore) {
        let event:EKEvent = EKEvent(eventStore: store)
      
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.notes = note
        event.calendar = store.defaultCalendarForNewEvents
        do {
            try store.save(event, span: .thisEvent)
        } catch let error as NSError {
        print("failed to save event with error : \(error)")
        }
        print("Saved Event")
  }
}


