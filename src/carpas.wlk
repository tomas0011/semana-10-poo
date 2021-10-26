import marcas.*
import personas.*

class Carpas{
	var property limitePersonas
	var property bandaMusical
	var property marcaQueVende
	var cantidadDeCervezas = 0
	const cantidadDePersonasEnCarpa = []
	
	method venderCerveza(cantidad){ cantidadDeCervezas += cantidad }
	
	method dejaIngresar(unaPersona) { 
		return cantidadDePersonasEnCarpa.size() + 1 < self.limitePersonas() and not unaPersona.estaEbria()
	}
	
	method cantidadDePersonasEnCarpa(){return cantidadDePersonasEnCarpa.size()}
	
	method ingresarPersona(unaPersona){
		if (self.dejaIngresar(unaPersona)){
			cantidadDePersonasEnCarpa.add(unaPersona)
		}
	}
	
	method servirJarra(unaPersona, ltsAServir ,cerveza) { 
		const jarraServ = new Jarras(capacidad = ltsAServir, marca = marcaQueVende , contenido =cerveza)
		if (cantidadDePersonasEnCarpa.contains(unaPersona)) { 
			unaPersona.comprarJarra(jarraServ)
			return true
		} else {
			return "La persona no está en la carpa"
		} 
	}
	
	method cantidadDeEbrios() {
		const personasEbrias = cantidadDePersonasEnCarpa.filter({ c => c.estaEbria() })
		return personasEbrias.count({ p => p.cantidadDeLitrosIngeridos() >= 1 })
	}
	
	
}
