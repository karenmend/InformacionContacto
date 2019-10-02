//
//  ViewController.swift
//  Informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var contactos : [Contacto] = []
    
    @IBOutlet weak var tvContactos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactos.append(Contacto(nombre: "Park Jimin", telefono: "(065)4255812", direccion: "Seoul, Korea Gangnam", correo: "btsjimin@hotmail.com", foto: "foto1"))
        contactos.append(Contacto(nombre: "V Taehyung", telefono: "(065)42142512", direccion: "Seoul, Korea Gangnam", correo: "btstaehyung@hotmail.com", foto: "foto2"))
         contactos.append(Contacto(nombre: "V Taehyung Rubio", telefono: "(065)4252512", direccion: "Seoul, Korea Gangnam", correo: "btstaehyung@hotmail.com", foto: "foto3"))
         contactos.append(Contacto(nombre: "Park Soyoung", telefono: "(065)12543812", direccion: "Seoul, Korea Gangnam", correo: "rvjoy@hotmail.com", foto: "foto4"))
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        celda?.imagenContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        if(contactos[indexPath.row].telefono != nil) {
            celda?.lblTelefono.text = contactos[indexPath.row].telefono
        }
        else {
            celda?.lblTelefono.text = ""
        }
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 155
    }
    
    func recargarTabla(){
            tvContactos.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as? EditarContactoController
            
            destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            destino?.callbackActualizarTabla = recargarTabla 
            
        }
}
}

