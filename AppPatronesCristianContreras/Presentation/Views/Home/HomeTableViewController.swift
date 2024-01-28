//
//  HomeTableViewController.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 26-01-24.
//

import UIKit

class HomeTableViewController: UIViewController {
    //IBOutlets
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    //ViewModel
    private var homeViewModel: HomeViewModel
    
    //Init
    init(homeViewModel: HomeViewModel = HomeViewModel()) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.register(
            UINib(nibName:  HeroTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HeroTableViewCell.identifier
        )
        tableViewOutlet.rowHeight = UITableView.automaticDimension
   
        tableViewOutlet.estimatedRowHeight = 400
        homeViewModel.loadHeros()
        setObservers()
    }
    
    
    //Conectar-Escuchar-Variabl Estado ViewModel
    private func setObservers() {
        homeViewModel.homeStatusLoad = { [weak self] status in
            switch status {
            case .loading:
                print("Home Loading")
            case .loaded:
                self?.tableViewOutlet.reloadData()
            case .error:
                print("Home Error")
            case .none:
                print("Home None")
            }
        }
    }
    
}

//MARK: - Extension Delegate
extension HomeTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let hero = self.homeViewModel.dataHeroes[indexPath.row]
            let heroDetailViewController = HeroDetailViewController(name: hero.name)
            self.navigationController?.show(heroDetailViewController, sender: nil)
            
        }
    }
}

//MARK: - Extension DataSource
extension HomeTableViewController: UITableViewDataSource {
    //Numero de columnas por seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.dataHeroes.count
    }
    
    //Formato de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HeroTableViewCell.identifier,
            for: indexPath
        ) as? HeroTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: homeViewModel.dataHeroes[indexPath.row])
        return cell
    }
}




