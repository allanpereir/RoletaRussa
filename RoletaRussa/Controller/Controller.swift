//
//  Controller.swift
//  RoletaRussa
//
//  Created by Alan Silva on 29/07/21.
//

import UIKit
import SCLAlertView

protocol ControllerProtocol: AnyObject {
    func showConta()
}
class Controller{
    
    private var myArray: [Pessoa] = []
    private var myImageArray = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
    
    private var pessoaSorteada: Pessoa?
    var customCellNomes: CustomCellNomes = CustomCellNomes()
    
    weak var delegate: ControllerProtocol?
    
    
    var count: Int{
        if myArray.isEmpty{
            return 1
        }else{
            return myArray.count
        }
    }

    //Adiciona pessoa no array
    func addPessoa (value: String){
       
        let _pessoa: Pessoa =  Pessoa(id: ((self.myArray.last?.id ?? 0) + 1), nome: value, idImagem: myImageArray.randomElement() ?? "")
        self.myArray.append(_pessoa)
        
    }
    func limpaArray(){
        self.myArray = []
    }
     /*
     Valida se o array esta vazio para saber qual celula usar.
     Ex. se o array estiver vazio, utilizar a EmptyCustomCell, caso contrario utilizar a CustomCellNomes
     */
    func arrayIsEmpty() -> Bool{
        if myArray.isEmpty {
            return true
        }else{
            return false
        }
    }
    
    //Carregar a pessoa adicionada na CustomCellNomes
    func loadCurrentPerson(indexPah: IndexPath) -> Pessoa{
        return self.myArray[indexPah.row]
    }
    
    //Sorteia uma pessoa e armazena em uma variavel
    func sorteiaPessoa(){
        pessoaSorteada = self.myArray.randomElement()
    }
    
    //valida se o botão Sortear foi pressionado e valida se a pessoa da celula celecionar é igual ao que foi sorteado.
    func validaPessoaSorteada(indexPath: IndexPath) -> Bool{
        if pessoaSorteada == nil {
            return false

        }else{
            
            if self.myArray[indexPath.row].id == pessoaSorteada?.id{
                let appearance = SCLAlertView.SCLAppearance(
                    
                    kButtonFont: UIFont(name: "arial", size: 14)!, showCloseButton: false, showCircularIcon: true
                )
                let alertView = SCLAlertView(appearance: appearance)
                let alertViewIcon = UIImage(named: pessoaSorteada?.idImagem ?? "") //Replace the IconImage text with the image name
                alertView.addButton("OK", backgroundColor: .blue,textColor: .white) {
                    alertView.dismiss(animated: true, completion: nil)
                    self.myArray = []
                    self.delegate?.showConta()
                }
                
                alertView.showInfo("Parabéns! \(pessoaSorteada?.nome ?? "")", subTitle: "Você foi o premiado da rodada para pagar a conta!", circleIconImage: alertViewIcon)
            
            }else{
                self.myArray.remove(at: indexPath.row)
            }
            
            return true
        }
    }
    
}

//MARK - ViewControllerDelegate
extension ViewController: ViewControllerDelegate{
    
    func criaAlert() {
        SCLAlertView().showInfo("Informação", subTitle: "Botão Sortear não foi pressionado!")
    }
    
    //Delegate para alterar status do botão da viewController
    func enableBtnSortear(contador: Int) {
        if contador > 1 {
            btnSortear.isEnabled =  true
        }
    }
}




