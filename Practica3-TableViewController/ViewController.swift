//
//  ViewController.swift
//  Practica3-TableViewController
//
//  Created by Aldo on 04/09/18.
//  Copyright © 2018 Aldo. All rights reserved.
//

import UIKit

//3.-Extender/Implementar protocolos UITableViewDataSource, UITableViewDelegate
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //5.- Idenfiticar/Definir fuente de información
    let nombres = ["Aldo", "Antonio", "Karen", "Yolanda", "Moi", "Javier", "Oscar", "Benja", "Jonathan","Aldo", "Antonio", "Karen", "Yolanda", "Moi", "Javier", "Oscar", "Benja", "Jonathan"]
    let telefonos = ["2322434245", "1231414555","2322434245", "1231414555","2322434245", "1231414555","2322434245", "1231414555", "3313452134","2322434245", "1231414555","2322434245", "1231414555","2322434245", "1231414555","2322434245", "1231414555", "3313452134"]
    
    //1.-Generar Outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //2.-Conectar protocolos
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //4.-Implementar métodos
    //Secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return 50
        
        //6.-Adaptar el número de filas a la estructura de información que vamos a utilizar
        return nombres.count
    }
    //Celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda")
        //7.-Después de construir la celda, se coloca la información correspondiente a la fila que se está mostrando
        celda?.textLabel?.text = nombres[indexPath.row]
        celda?.detailTextLabel?.text = telefonos[indexPath.row]
        return celda!
    }
    
    //Extra
    //Identificar el evento de selección de una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Hola \(nombres[indexPath.row])", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

