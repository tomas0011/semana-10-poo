import marcas.*
import carpas.*

class Personas {
	var property peso
	const jarrasCompradas = []
	var property leGustaLaMusica
	var property nivelDeAguante
	var property leGustaLaMarca = []
	var property nacionalidad
	
	method comprarJarra(unaJarra){jarrasCompradas.add(unaJarra)}
	
	method jarrasCompradas(){return jarrasCompradas}
	
	method estaEbria(){	return jarrasCompradas.sum({ j => j.capacidad() }) * peso > nivelDeAguante	}

	method marcaQueleGusta(unaCerveza)
	
	method totalDeAlcoholIngerido() { return jarrasCompradas.sum({ j=> j.capacidad() * j.contenidoDeAlcohol() }) }
		
	method cantidadDeLitrosIngeridos() {return jarrasCompradas.sum({j=> j.capacidad()})	}
	
	method quiereEntrarACarpa(unaCarpa) {
		return self.leGustaLaMarca() == unaCarpa.marcaQueVende() and self.leGustaLaMusica() and unaCarpa.bandaMusical()
	}
	
	method puedeEntrarACarpa(unaCarpa) { 
		return self.quiereEntrarACarpa(unaCarpa) and unaCarpa.dejaIngresar(self)
	}
	
	method entrarACarpa(unaCarpa) {
		if (self.puedeEntrarACarpa(unaCarpa)){
			unaCarpa.cantidadDePersonasEnCarpa().add(self)
			return true
		} else { 
			return "No puede ingresar a la carpa"
		}
	}
	
	method esPatriota() {
		return self.jarrasCompradas().all({j=> j.contenido().marca().paisFabricacion() == self.nacionalidad() })
	}
}

class Belgas inherits Personas{
	override method marcaQueleGusta(unaCerveza) {
		if (unaCerveza.marca().grsLupulo() > 4) {
			leGustaLaMarca = unaCerveza.marca()
		} else {
			leGustaLaMarca = null
		}
		return leGustaLaMarca
	}	
}

class Checos inherits Personas {
	override method marcaQueleGusta(unaCerveza) {
		if (unaCerveza.graduacion() > 8) {
			leGustaLaMarca = unaCerveza.marca()
		} else {
			leGustaLaMarca = null
		}
		return leGustaLaMarca
	}
}

class Alemanes inherits Personas {
	override method marcaQueleGusta(unaCerveza) {
	 	leGustaLaMarca = unaCerveza.marca()
		return leGustaLaMarca
	}
	
	override method quiereEntrarACarpa(unaCarpa) { return super(unaCarpa) and unaCarpa.limitePersonas() % 2 == 0 }
}

