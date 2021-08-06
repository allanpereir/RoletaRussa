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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self

        // Do any additional setup after loading the view.
    }

}
extension HistoricoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
