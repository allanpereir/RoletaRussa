//
//  HistoricoTableViewCell.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import UIKit

class HistoricoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelQtd: UILabel!
    @IBOutlet weak var labelItem: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    @IBOutlet weak var imagemItem: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(value: produto?, imageTipo: String){

        if value != nil {
            self.labelQtd.text = "\(value!.quantity)"
            self.labelItem.text = value!.name
            self.labelValor.text = String(format: "%.2f", value!.price)
            self.imagemItem.image = UIImage(named: imageTipo)
        }
    }
}
