import marcas.*
import personas.*

class Carpas  {
	var property limiteDeGente
	var property banda = true
	var property cantidadDeCervezas = 0
	var property marcaQueVende
	var property cantidadDePersonasEnCarpa = [ ]
	
	method venderCerveza(cantidad) { cantidadDeCervezas -= cantidad }
	
	method dejaIngresar(unaPersona) { 
		return self.cantidadDePersonasEnCarpa() + 1 > self.limiteDeGente() and not unaPersona.estaEbria()
	}
	
	method servirJarra(unaPersona) { 
		var jarra1 = new Jarra(capacidad = 1, marca = marcaQueVende)
		return if unaPersona.entrarACarpa(unaCarpa, unaPersona) { jarra1.capacidad() } // revisar
	}
	
	method cantidadDeEbrios() {
		var personasEbrias = cantidadDePersonasEnCarpa.filter({c=> c.estaEbria()})
		return personasEbrias.count({p=> p.cantidadDeLitrosIngeridos() >= 1})
	}
}
