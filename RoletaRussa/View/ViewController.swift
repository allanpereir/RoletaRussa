//
//  ViewController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 29/07/21.
//

import UIKit


protocol ViewControllerDelegate: AnyObject{
    func enableBtnSortear(contador: Int)
    func criaAlert ()    
}
class ViewController: UIViewController {

    @IBOutlet weak var textNome: UITextField!
    @IBOutlet weak var btnSortear: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    private let controller = Controller()
    
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.textNome.delegate = self
        
        self.controller.delegate = self
        
        // Do any additional setup after loading the view.
        self.myTableView.register(UINib(nibName: "EmptyCustomCell", bundle: nil), forCellReuseIdentifier: "EmptyCustomCell")
        self.myTableView.register(UINib(nibName: "CustomCellNomes", bundle: nil), forCellReuseIdentifier: "CustomCellNomes")

    }
    
    @IBAction func btnSortear(_ sender: UIButton) {
        controller.sorteiaPessoa()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        self.delegate = self
        self.delegate?.enableBtnSortear(contador: Int(controller.count))
    
        return controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if controller.arrayIsEmpty() {
            let emptyCell: EmptyCustomCell? = myTableView.dequeueReusableCell(withIdentifier: "EmptyCustomCell", for: indexPath) as? EmptyCustomCell
            
            myTableView.isScrollEnabled = false
            emptyCell?.isUserInteractionEnabled = false
            return emptyCell ?? UITableViewCell()
        }
        else{
            myTableView.isScrollEnabled = true
            
            let cellNomes: CustomCellNomes? = myTableView.dequeueReusableCell(withIdentifier: "CustomCellNomes", for: indexPath) as? CustomCellNomes
            
            cellNomes?.setup(value: self.controller.loadCurrentPerson(indexPah: indexPath))
            return cellNomes ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if controller.validaPessoaSorteada(indexPath: indexPath) {
            self.myTableView.reloadData()
            
        }else{
            self.delegate = self
            delegate?.criaAlert()
        }
    }

}
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        controller.addPessoa(value: textNome.text ?? "")
        
        self.myTableView.reloadData()
        self.textNome.text = nil
        textNome.resignFirstResponder()
    
        return true
    }
}
extension ViewController: ControllerProtocol{
    func showConta() {
        performSegue(withIdentifier: "ContaViewController", sender: nil)
        self.myTableView.reloadData()
    }
}
