class Marcas { 
	var property cantidadDeLupulo = 0
	var property paisDeFabricacion = "Argentina"
}
  

class Cervezas inherits Marcas{
	var property graduacion = 0
	var property marca = "none"
	var property graduacionReglamentaria = 0
}

class Rubia inherits Cervezas {
	
}

class Negra inherits Cervezas {
	override method graduacion() {
		return graduacionReglamentaria.min(self.cantidadDeLupulo() * 2)
	}
}

class Roja inherits Cervezas {
	override method graduacion() {
		return graduacionReglamentaria.min(self.cantidadDeLupulo() * 2) * 1.25
	}
}

class Jarra inherits Cervezas{
	const contenido = []
	var property capacidad
	
	override method marca() { return contenido.map({c=> c.marca()})} // creo que bien
	
	method agregarContenido(unaCerveza) { contenido.add(unaCerveza) }
	
	method contenidoDeLaJarra() { return contenido }
	
	method alcoholPorLitro() {
		return  contenido.map({c=> c.graduacion() * capacidad})  // creo que bien
	}
}
