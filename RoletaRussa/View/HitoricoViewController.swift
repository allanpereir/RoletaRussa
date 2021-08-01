//
//  HitoricoViewController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import UIKit

class HitoricoViewController: UIViewController {

    @IBOutlet weak var historicoTableView: UITableView!

    @IBOutlet weak var labelValor: UILabel!
    
    let historicoController: HitoricoController = HitoricoController()
    
    @IBOutlet weak var labelQuantidade: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historicoController.importaData()

        self.historicoTableView.dataSource = self
        self.historicoTableView.delegate = self
        self.historicoTableView.register(UINib(nibName: "HistoricoTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoricoTableViewCell")
        
        self.labelValor.text =  String(format: "%.2f", historicoController.valor)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    

}
extension HitoricoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return historicoController.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellHistorico: HistoricoTableViewCell? = historicoTableView.dequeueReusableCell(withIdentifier: "HistoricoTableViewCell", for: indexPath) as? HistoricoTableViewCell
        
        cellHistorico?.setup(value: historicoController.loadCurrentProduto(indexPah: indexPath) ?? nil, imageTipo: historicoController.getTipo(indexPah: indexPath))
        return cellHistorico ?? UITableViewCell()
    }
}
