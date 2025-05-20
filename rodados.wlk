class Corsa {
  var property color 

  method capacidad() = 4
  method velMax() = 150
  method peso() = 1300 

}

class Kwid {
  var property tieneTanqueAdicional  
  method capacidad() = if(tieneTanqueAdicional) 3 else 4
  method velMax() =  if(tieneTanqueAdicional) 120 else 110
   method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
   method color() = "azul"  
}

object trafic {
  var interior = comodo
  var motor = pulenta
  method capacidad() = interior.capacidad()
  method peso() = interior.peso() + motor.peso() + 4000
  method velMax() = motor.velMax()
  method color() = "blanco"
  method interior(inte) {
    interior = inte
  }
  method motor(mot){
    motor = mot
  }
}

object comodo {
  method capacidad() = 5 
  method peso() = 700
}

object popular {
  method capacidad() = 12  
  method peso() = 1000 
}

object pulenta {
  method velMax() = 130  
  method peso() = 800 
}

object bataton {
  method velMax() = 80  
  method peso() = 500 
}

class Especial{
  var property capacidad  
  const property velMax  
  var property peso  
  var property color  
}

class Dependencia {
  const flota = []
  var property empleados = 0
  method agregarAFlota(rodado) {
    flota.add(rodado)
  }
  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }
  method pesoTotalDeLaFlota() = flota.sum({rodado => rodado.peso()})
  method estaBienEquipada() = (self.tieneAlMenos_Rodados(3)) && (self.todosVanAlMenosA100())
  method tieneAlMenos_Rodados(cant) = flota.size()>= cant
  method todosVanAlMenosA100() = flota.all({rodado => rodado.velMax() >= 100})
  method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({rodado=>rodado.capacidad()})
  method rodadosDeColor(color) = flota.filter({rodado => rodado.color()==color})
  method colorDeRodadoMasRapido() = self.rodadoMasRapido().color()
  method rodadoMasRapido() = flota.max({rodado=>rodado.velMax()})
  method capacidadFaltante() = 0.max(empleados - self.capacidadDeLaFlota())
  method capacidadDeLaFlota() = flota.sum({rodado=>rodado.capacidad()})
  method esGrande() = empleados >= 40 && self.tieneAlMenos_Rodados(5)
}