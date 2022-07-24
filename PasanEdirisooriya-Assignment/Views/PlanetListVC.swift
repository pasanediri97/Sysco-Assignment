//
//  PlanetListVC.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-22.
//

import UIKit
import RxCocoa
import RxSwift
import PullToRefreshKit

class PlanetListVC: UIViewController, UIScrollViewDelegate,LoadingIndicatorDelegate {
    
    let vm = MainListVM()
    let bag = DisposeBag()
    var isLoadMore = true
    
    @IBOutlet weak var tableView: UITableView! {didSet { configureTableView() }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        self.loadPlanets(isLoadMore: false, page: 1)
        // Do any additional setup after loading the view.
    }
    
    //MARK: Adding RXSwift bindings
    
    func addObservers() {
        
        vm.planetList.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: PlanetTVC.id, cellType: PlanetTVC.self)) { row, model, cell in
                cell.configureCell(with: model)             }
            .disposed(by: bag)
        
        //Table View click event
        tableView.rx.itemSelected
            .subscribe(onNext: {[weak self] indexPath in
                
                if let _planet = self?.vm.planetList.value[indexPath.row] {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "PlanetDetailsVC") as! PlanetDetailsVC
                    vc.vm.planet = _planet
                    self?.present(vc, animated: true)
                    
                    
                }
            })
            .disposed(by: bag)
    }
    
    //MARK: Setup refreshing (Load more)
    
    func setUpRefreshing() {
        DispatchQueue.main.async {
            let footer = self.configureLoadMoreFooter()
            let currentPage = self.vm.currentPage
            //log.debug("CURRENT PAGE IS: \(currentPage)")
            
            
            self.tableView.configRefreshFooter(with: footer, container: self) {
                self.delay(1.0, closure: {
                    if(self.isLoadMore){
                        self.tableView.switchRefreshFooter(to: .normal)
                        self.loadPlanets(isLoadMore: self.isLoadMore, page: Int(currentPage) + 1)
                        self.vm.currentPage += 1
                        self.tableView.switchRefreshFooter(to: .removed)
                    }
                })
            }
        }
    }
    
    //MARK: Calling api via view model
    func loadPlanets(isLoadMore: Bool, page: Int) {
        startLoading()
        vm.fetchPlanets(isLoadMore: isLoadMore, page: page){ (status, code, message, data) in
            self.stopLoading()
            switch status {
            case true:
                
                if let _planetResponse = data as? GetPlanetsListResponse {
                    if(_planetResponse.next == nil){
                        self.isLoadMore = false
                    }
                    
                    if !(isLoadMore) {
                        DispatchQueue.main.async {
                            self.setTableViewContentOffset(self.tableView, dataCount: self.vm.planetList.value.count)
                        }
                    }
                    
                    // Set up load more if eligible
                    self.setUpRefreshing()
                }else {
                    AlertProvider(vc: self).showAlert(title: .Error, message: "Failed to map data", action: AlertAction(title: .Dismiss))
                }
                
                
            default:
                AlertProvider(vc: self).showAlert(title: .Error, message: message, action: AlertAction(title: .Dismiss))
            }
        }
    }
    
    
    // Set TableView contet offset to zero
    func setTableViewContentOffset(_ tableView: UITableView, dataCount: Int) {
        guard dataCount > 0 else {
            return
        }
        
        tableView.layoutIfNeeded()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: false)
        tableView.setContentOffset(.zero, animated: false)
    }
    
    
    //MARK: Configure load more
    func configureLoadMoreFooter() -> DefaultRefreshFooter {
        let footer = DefaultRefreshFooter.footer()
        footer.setText("", mode: .pullToRefresh)
        footer.setText("", mode: .noMoreData)
        footer.setText("Load more...", mode: .refreshing)
        footer.setText("Tap to load more", mode: .tapToRefresh)
        footer.tintColor = .black
        footer.textLabel.textColor  = .black
        footer.refreshMode = .scroll
        
        return footer
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    //MARK: TableView configurations
    
    private func configureTableView() {
        self.tableView.register(UINib(nibName: PlanetTVC.id, bundle: nil), forCellReuseIdentifier: PlanetTVC.id)
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.rx.setDelegate(self).disposed(by: bag)
    }

}

 
