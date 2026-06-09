//
//  CardView.swift

//  Created by Muhammad Hamzah Robbani on 03/06/26.
//

import SwiftUI

struct CardView: View {
    let item: Achievement
    @State private var statusDotColor: Color = .red
    let onDetailTap: () -> Void
    
    private func updateStatusDotColor() {
        if item.currentTarget > item.minimumTarget {
            statusDotColor = .green60
        }else{
            statusDotColor = .red
        }
    }
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Circle()
                        .fill(statusDotColor)
                        .frame(width: 10, height: 10)
                        .onAppear { updateStatusDotColor()}
                    Text(item.label)
                        .bold()
                        .font(.system(size:14))
                    Spacer()
                    Image("info-circle")
                }
                .padding(.vertical, 10)
                
                HStack{
                    (
                        Text("\(item.currentTarget)")
                            .bold(true) +
                        Text(" dari\(item.type == "Coverage" ? " Target" : "") ") +
                        Text("\(item.target)")
                    )
                    .font(.system(size:12))
                    .foregroundColor(.black)
                        
                    Spacer()
                }
                
                
                HStack{
                    ProgressView( value: Double(item.currentTarget)/Double(item.target)*100.0, total: 125)
                        .scaleEffect(y: 1.5)
                    Text("\(UInt8(Double(item.currentTarget)/Double(item.target)*100.0))%")
                        .font(.system(size:12))
                        .bold(true)
                }
            }
            .padding(10)
            
            Button(action: {
                onDetailTap()
            }) {
                HStack {
                    Spacer()
                    Text("Lihat Detail \(item.type) >")
                        .font(.system(size: 12))
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
                .frame(height: 32)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6)) // Use system color instead of .dark2
            }
            .buttonStyle(PlainButtonStyle()) // Removes default button styling
            
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.dark20, lineWidth: 2)
        )
    }
}

#Preview{
    CardView(
        item: Achievement(label: "Coverage", type:"Coverage",minimumTarget: 1000, currentTarget: 10000, target: 20000)
    ){
        
    }
}
