//
//  CustomCellNomes.swift
//  RoletaRussa
//
//  Created by Alan Silva on 29/07/21.
//

import UIKit


class CustomCellNomes: UITableViewCell {

    @IBOutlet weak var perfilImage: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(value: Pessoa){
        self.perfilImage.image = UIImage(named: value.idImagem)
        self.labelNome.text = value.nome
    }
    
    
}
