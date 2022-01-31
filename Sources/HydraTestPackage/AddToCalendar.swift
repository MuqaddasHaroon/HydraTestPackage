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
    @State var title: String
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    
    /// This component wil help you add an event to your calendar.
    /// - Parameters:
    ///   - isChecked: a variable to see if the box is checked or not (optional)
    ///   - width width of the box (optional)
    ///   - height: height of the box (optional)
    ///   - title: any Text you want to add with the calendar..
    ///   - startDate: starting date with data type Date (optional)
    ///   - endDate: starting date with data type Date. (optional)
//    public init(isChecked: Bool, width: CGFloat = 24, height: CGFloat = 24, title: String, startDate: Date, endDate: Date) {
//        self.isChecked = isChecked
//        self.width = width
//        self.height = height
//        self.title = title
//        self.startDate = startDate
//        self.endDate = endDate
//
//    }
  
    public var body: some View {
      
        Button(action:{
            isChecked.toggle()
         if isChecked {
            let eventStore = EKEventStore()
            switch EKEventStore.authorizationStatus(for: .event) {
               case .authorized:
                   insertEvent(store: eventStore, title: title, startDate: startDate, endDate: endDate)
                   case .denied:
                       print("Access denied")
                   case .notDetermined:
                   // 3
                       eventStore.requestAccess(to: .event, completion:
                         {(granted: Bool, error: Error?) -> Void in
                             if granted {
                                 insertEvent(store: eventStore, title: title, startDate: startDate, endDate: endDate)
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
    func insertEvent(store: EKEventStore, title: String, startDate: Date, endDate: Date) {
        // 1
        DispatchQueue.main.async {
        let calendars = store.calendars(for: .event)
            
        for calendar in calendars {
            // 2
            if calendar.title == "Calendar" {
                // 3
                let startDate = startDate
                // 2 hours
               // let endDate = endDate
                    
                // 4
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                    
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                    
                // 5
                do {
                    try store.save(event, span: .thisEvent)
                }
                catch {
                   print("Error saving event in calendar")
                    
                }
             
            }
        }
        }
    }
}


