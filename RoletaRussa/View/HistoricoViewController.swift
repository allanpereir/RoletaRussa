//
//  HistoricoController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 05/08/21.
//

import UIKit

class HistoricoViewController: UIViewController {
    

    @IBOutlet weak var myTableView: UITableView!
    private var myImageArray = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
    
    let historicoController: HistoricoController = HistoricoController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")

        historicoController.importaData(value: "JSONDataHistorico")
    }

}
extension HistoricoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicoController.countHistorico
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HistoryTableViewCell? = myTableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell
        
        cell?.setup(valor: self.historicoController.loadHistorico(indexPath: indexPath) ?? nil)
        return cell ?? UITableViewCell()
    }

}
