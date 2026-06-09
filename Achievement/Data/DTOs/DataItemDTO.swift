
struct APIResponseDTO: Codable {
    let data: [DataItemDTO]
}

struct DataItemDTO: Codable {
    let label: String
    let type: String
    let target: Int
    let currentValue: Int
    let minimumTarget: Int
}
