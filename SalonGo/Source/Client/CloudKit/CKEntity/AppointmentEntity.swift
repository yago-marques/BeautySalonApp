//
//  Appointment.swift
//  SalonGo
//
//  Created by Yago Marques on 09/11/22.
//

import Foundation

struct AppointmentEntity: CKEntityProtocol {
    var type: CloudKitEntityTypes = .appointment

    var body: Data = Data()

    init(appointment: CKAppointment) {
        let data = try? JSONEncoder().encode(appointment)
        if let data { self.body = data }
    }
}
