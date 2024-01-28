//
//  HeroDetailViewController.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 27-01-24.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    
    //ViewModel
    private var detailViewModel: DetailViewModel
    
    // MARK: - Model
    private let hero: HeroModel
    private let name: String
    // MARK: - Initializers
    init(name: String, detailViewModel: DetailViewModel = DetailViewModel()) {
        self.name = name
        self.detailViewModel = detailViewModel
        hero = HeroModel(id: "", name: "", description: "", photo: "", favorite: false)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailViewModel.loadHero(name: name)
        setObservers()
    }
    
    //Conectar-Escuchar-Variabl Estado ViewModel
    private func setObservers() {
        detailViewModel.detailStatusLoad = { [weak self] status in
            switch status {
            case .loading:
                print("Detail Loading")
            case .loaded:
                print("Detail loaded")
                self?.configureView()
            case .error:
                print("Detail Error")
            case .none:
                print("Detail None")
            }
        }
    
    
}
    
//    @IBAction func transformationButton(_ sender: Any) {
//        DispatchQueue.main.async {
//            
//            let transformationsTableViewController = TransformationsTableViewController(idHero: self.hero.id)
//            self.navigationController?.show(transformationsTableViewController, sender: nil)
//        }
//    }
//    
}

// MARK: - View Configuration
private extension HeroDetailViewController {
    func configureView() {

        heroNameLabel.text = detailViewModel.dataHeroe.first?.name

        heroDescriptionLabel.text = detailViewModel.dataHeroe.first?.description
        
        guard let imageURL = URL(string: (detailViewModel.dataHeroe.first?.photo) ?? "")  else {
            return
        }
        
        heroImageView.setImage(url: imageURL)
        
        
    }
}
