//
//  CalendarViewMode.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//import SwiftUI
import SwiftUI
import FirebaseFirestore

class CalendarViewModel: ObservableObject {
    @Published var treatments: [Treatment] = [] // Initialize as an empty array
    @Published var selectedTreatment: Treatment? = nil
    @Published var currentMonth = Calendar.current.dateComponents([.year, .month], from: Date())
    @Published var errorMessage: String?

    private var db = Firestore.firestore()

    func fetchTreatments() {
        db.collection("treatments").getDocuments { snapshot, error in
            if let error = error {
                self.errorMessage = "Fehler beim Laden: \(error.localizedDescription)"
                return
            }
            if let snapshot = snapshot {
                self.treatments = snapshot.documents.compactMap { document in
                    var treatment = try? document.data(as: Treatment.self)
                    treatment?.id = document.documentID // Assign Firestore document ID
                    return treatment
                }
            }
        }
    }

    func bookAppointment(for date: Date) {
        guard let treatment = selectedTreatment else {
            print("Kein Treatment ausgewählt.")
            return
        }
        let appointmentData: [String: Any] = [
            "treatment": treatment.name,
            "date": Timestamp(date: date),
            "user": "user_id" // Placeholder for user ID
        ]
        db.collection("appointments").addDocument(data: appointmentData) { error in
            if let error = error {
                self.errorMessage = "Fehler beim Buchen des Termins: \(error.localizedDescription)"
            } else {
                print("Termin für \(treatment.name) am \(date) erfolgreich gebucht.")
            }
        }
    }
}
