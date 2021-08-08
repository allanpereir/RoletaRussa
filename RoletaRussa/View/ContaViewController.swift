//
//  HitoricoViewController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import UIKit

class ContaViewController: UIViewController {

    @IBOutlet weak var contaTableView: UITableView!

    @IBOutlet weak var labelValor: UILabel!
    
    let contaController: ContaController = ContaController()
    let controller: Controller = Controller()
    
    
    @IBOutlet weak var labelQuantidade: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        contaController.importaData(value: "JSONData")
        self.contaTableView.dataSource = self
        self.contaTableView.delegate = self
        self.contaTableView.register(UINib(nibName: "ContaTableViewCell", bundle: nil), forCellReuseIdentifier: "ContaTableViewCell")
        
        self.labelValor.text =  "R$ \(String(format: "%.2f", contaController.valorConta))"
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
        
        return contaController.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConta: ContaTableViewCell? = contaTableView.dequeueReusableCell(withIdentifier: "ContaTableViewCell", for: indexPath) as? ContaTableViewCell
        
        cellConta?.setup(value: contaController.loadCurrentProduto(indexPah: indexPath) ?? nil, imageTipo: contaController.getTipo(indexPah: indexPath))
        return cellConta ?? UITableViewCell()
    }
}
