//
//  HexagonalView.swift
//  slot-machine
//
//  Created by Aman Negi on 05/09/22.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            let arbitaryPoint = CGFloat(20)
            let p1 = CGPoint(x: 0, y: arbitaryPoint)
            let p2 = CGPoint(x: 0, y: rect.height - arbitaryPoint)
            let p3 = CGPoint(x: rect.width/2, y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height - arbitaryPoint)
            let p5 = CGPoint(x: rect.width, y: arbitaryPoint)
            let p6 = CGPoint(x: rect.width/2, y: 0)
            
            path.move(to: p6)
            
            let rad :Double = 15
            path.addArc(tangent1End: p1, tangent2End: p2, radius: rad)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: rad)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: rad)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: rad)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: rad)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: rad)
            
        }
    }
}

//struct HexagonalView_Previews: PreviewProvider {
//    static var previews: some View {
//        Hexagon().frame(width: 100, height: 120, alignment: .center)
//    }
//}
