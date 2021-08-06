//
//  HitoricoViewController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import UIKit

class ContaViewController: UIViewController {

    @IBOutlet weak var historicoTableView: UITableView!

    @IBOutlet weak var labelValor: UILabel!
    
    let historicoController: ContaController = ContaController()
    let controller: Controller = Controller()
    
    
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
    
    @IBAction func btnPagar(_ sender: UIButton) {
        
        controller.limpaArray()
        self.dismiss(animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
    }
    
}
extension ContaViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return historicoController.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConta: HistoricoTableViewCell? = historicoTableView.dequeueReusableCell(withIdentifier: "HistoricoTableViewCell", for: indexPath) as? HistoricoTableViewCell
        
        cellConta?.setup(value: historicoController.loadCurrentProduto(indexPah: indexPath) ?? nil, imageTipo: historicoController.getTipo(indexPah: indexPath))
        return cellConta ?? UITableViewCell()
    }
}
