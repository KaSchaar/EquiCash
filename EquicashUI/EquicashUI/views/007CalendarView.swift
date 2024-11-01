//
//  007CalendarView.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//
import SwiftUI

struct CalendarView: View {
    @ObservedObject private var viewModel = CalendarViewModel()
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            // Treatment selection menu
            Menu {
                ForEach(viewModel.treatments) { treatment in
                    Button(treatment.name) {
                        viewModel.selectedTreatment = treatment
                    }
                }
            } label: {
                Text(viewModel.selectedTreatment?.name ?? "Produkt wählen")
                    .padding()
                    .background(Color(hex: "D4A776"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Placeholder for Calendar functionality
            Text("Kalenderansicht für \(selectedDate, formatter: DateFormatter())")

            Spacer()

            Button("Termin buchen") {
                viewModel.bookAppointment(for: selectedDate)
            }
            .padding()
            .background(Color(hex: "D4A776"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            viewModel.fetchTreatments()
        }
    }
}
