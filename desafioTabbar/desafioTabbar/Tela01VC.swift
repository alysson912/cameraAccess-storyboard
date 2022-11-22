//
//  ViewController.swift
//  desafioTabbar
//
//  Created by ALYSSON DODO on 22/11/22.
//

import UIKit

class Tela01VC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editPictureButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var data : [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        configTableView()
    }

    func configElements(){
        nameLabel.text = "Nome"
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = .black
        profileImageView.clipsToBounds = true // dando altorizacao para arredondar a imagem
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2  // setando o quanto a borda pode ser arredondada
        nameTextField.placeholder = "Digite seu nome:"
        
    }
    
    
    @IBAction func tappedEditPictureButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedAddButton(_ sender: UIButton) {
        data.append(Profile(name: nameTextField.text ?? "", photo: profileImageView.image ?? UIImage()))
        nameTextField.text = ""
        tableView.reloadData()
    }
     
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        // register
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        
    }
}

extension Tela01VC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(profile: self.data[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
