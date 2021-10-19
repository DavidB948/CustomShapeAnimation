//
//  VehicleShape.swift
//  Profile Shape Animation
//
//  Created by David Bong Chung Hua on 19/10/2021.
//

import SwiftUI

struct ProfileShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = rect.width / 4
        let startPoint = CGPoint(x: rect.midX * 1.54 , y: rect.maxY)
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: rect.midX * 1.54 , y: rect.midY * 1.6))
        path.addQuadCurve(to: CGPoint(x: rect.midX * 1.13 , y: rect.midY * 1.3), control: CGPoint(x: rect.midX * 1.45 , y: rect.midY * 1.34))
        path.addArc(center: CGPoint(x: rect.midX * 1.01, y: rect.midY * 1.3 - radius), radius: radius, startAngle: .degrees(80), endAngle: .degrees(110), clockwise: true)
        path.addLine(to: CGPoint(x: rect.midX * 0.83 , y: rect.midY * 1.3))
        path.addQuadCurve(to: CGPoint(x: rect.midX * 0.4 , y: rect.midY * 1.7), control: CGPoint(x: rect.midX * 0.4 , y: rect.midY * 1.37))
        path.addLine(to: CGPoint(x: rect.midX * 0.4 , y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX * 0.4 , y: rect.maxY*0.9))
        return path
    }
}

struct VehicleShape: View {
    var body: some View {
        ProfileShape()
    }
}

struct VehicleShape_Previews: PreviewProvider {
    static var previews: some View {
        VehicleShape()
    }
}
