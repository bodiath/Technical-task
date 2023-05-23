//
//  QuotesTableViewCell.swift
//  Technical-test
//
//  Created by Bogdan Deshko on 23.05.2023.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {

    static let reuseIdentifier = "QuotesTableViewCell"
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var readableLastChangePercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(quote: Quote, isFavorite: Bool) {
        name.text = quote.name
        currency.text = quote.currency
        last.text = quote.last
        
        let color = quote.variationColor
        readableLastChangePercent.textColor = VariationColor(rawValue: color )?.color
        readableLastChangePercent.text = quote.readableLastChangePercent
        
        favoriteImageView.image = isFavorite ? UIImage(named: "favorite") : UIImage(named: "no-favorite")
    }
}

enum VariationColor: String {
    case red
    case green
    
    var color: UIColor {
        switch self {
        case .green: return .green
        case .red: return .red
        }
    }
}
