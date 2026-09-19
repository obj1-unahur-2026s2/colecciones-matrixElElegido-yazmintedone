//pasajeros de la nave

/*
ELEGIDO:
empieza con 100 de energia (cambia)
                       ->salta->pierde la mitad de energia
su vitalidad es La decima parte de su energia
*/
object neo {
    var energia = 100
  
  method esElElegido(){return true}
  method saltar(){energia = energia / 2}
  method vitalidad(){return energia / 10}
}
/*
NO ES EL ELEGIDO:
vitalidad inicial 8 (cambia)
     ->siempre que salta su vitalizad disminuye en 1
empieza descansado y al saltar se cansa
  ->si salta estando cansado vuelve a quedar descansado 
*/
object morfeo {
    var vitalidad = 8
    var estaDescansado = true

    method esElElegido(){return false}

  method saltar(){ 
    estaDescansado = not estaDescansado
    vitalidad = (vitalidad - 1).max(0)
  }

 /*
  otra forma= 
  if (estaDescansado) {
            estaDescansado = false
        } else {
            estaDescansado = true
        }
    }
  */
  method vitalidad(){return vitalidad}
}
/*
NO ES LA ELEGIDA
sabe decir su vitalidad SIEMPRE 0
saltar no le afecta
*/
object trinity {
    method esElElegido(){return false}
    method vitalidad(){return 0}
    method saltar(){}
}

object nave {
  const pasajeros = [neo, morfeo , trinity]
  
  //agregamos nosotros en la clase
  method subirPasajeros(unPasajero){
    pasajeros.add(unPasajero)
  }
  method bajarPasajeros(unPasajero){
    pasajeros.remove(unPasajero)
  }
  method cantidadDePasajeros(){
    return pasajeros.size()
  }
  method pasajeroConMayorVitalidad(){return pasajeros.max({p => p.vitalidad()})}
  //otro ejemplo
  method laMayorVitalidad(){
    return pasajeros.max({unPasajero => unPasajero.vitalidad()}).vitalidad()
  }  
  method estaEquilibrada() {
    //max <= min*2
    //return self.pasajeroConMayorVitalidad().vitalidad() <= min*2
    return pasajeros.all({ p1 => 
        pasajeros.all({ p2 => p1.vitalidad() <= (p2.vitalidad() * 2) }) 
    })
}
  method elegidoEsta(){return pasajeros.contains(neo)}
  //return pasajeros.any({pasajero => pasajero.esElElegido()})

  // hechos que le suceden a la nave
  method chocar(){
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()

  }
  method acelerar(){
    // [ neo,trinity,morfeo]
    //{trinity,morfeo}
    pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
  
  /*
  pasajeros.forEach({p => if(not p.esElElegido()){
                            p.saltar()
                          }
                        })
  */
  }

}