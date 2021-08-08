//
//  HistoryTableViewCell.swift
//  RoletaRussa
//
//  Created by Alan Silva on 08/08/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBar: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(valor: historico?){
        
        if valor != nil {
            self.imageBar.image = UIImage(named: "Image-1")
            self.labelNome.text = valor!.name
            self.labelValor.text = "R$ \(String(format: "%.2f", valor!.price))"
  
        }
    }
}
