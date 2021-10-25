import marcas.*
import carpas.*

class Personas {
	var property peso = 0
	var property leGustaEscucharMusica = true
	var property nivelDeAguante = 0
	var property nacionalidad
	var property jarrasCompradas = [ ]
	
	method comprarJarra(unaJarra) {
		jarrasCompradas.add(unaJarra)
	}
	
	method cantidadDeLitrosIngeridos() {
		return jarrasCompradas.sum({j=> j.capacidad()})
	}
	
	method estaEbria() {
		return (self.totalDeAlcohol() * peso) > nivelDeAguante
	}
	
	method totalDeAlcohol() {
		return jarrasCompradas.sum({j=> j.alcoholPorLitro()})
	}
	
	method leGustaMarca(cerveza) 
	
	method quiereEntrarACarpa(unaCarpa) {
		return self.leGustaMarca(unaCarpa.marcaQueVende() and (self.leGustaEscucharMusica() and unaCarpa.banda()))
	}
	
	method puedeEntrarACarpa(unaCarpa, unaPersona) { 
		return self.quiereEntrarACarpa(unaCarpa) and unaCarpa.dejaIngresar(unaPersona)
	} // revisar
	
	method entrarACarpa(unaCarpa, unaPersona) {	
		return if (self.puedeEntrarACarpa(unaCarpa, unaPersona)){ true } else { "Error" }
	}
	
	method esPatriota(unaPersona) {
		return unaPersona.jarrasCompradas().all({j=> j.paisDeFabricacion() == unaPersona.nacionalidad() })
	}
	
}

class Belgas inherits Personas{
	override method leGustaMarca(unaCerveza) {
		return unaCerveza.cantidadDeLupulo() > 4
	}
}

class Checos inherits Personas {
	override method leGustaMarca(unaCerveza) {
		return unaCerveza.graduacion() > 8
	}
}

class Alemanes inherits Personas {
	 override method leGustaMarca(unaCerveza) {
		return true
	}
	
	override method quiereEntrarACarpa(unaCarpa) { return super(unaCarpa) and unaCarpa.limiteDeGente() % 2 == 0 }
}
