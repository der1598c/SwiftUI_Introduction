//
//  NotificationView.swift
//  Animation-Demo
//
//  Created by Leyee.H on 2019/11/21.
//  Copyright © 2019 Leyee. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("Success")
            .padding()
            .foregroundColor(Color.white)
            .frame(width: UIScreen.main.bounds.width - 10, height: 100)
            .background(Color.blue)
            .cornerRadius(20)
            
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
