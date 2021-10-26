class Marcas {
	var property grsLupulo
	var property paisFabricacion	
}


class Cervezas {
	var property marca
}

class CervezaRubia inherits Cervezas{
	var property graduacion
}


class CervezaNegra inherits Cervezas {
	var property graduacionReglamentaria = 10
	
	method graduacion(){return graduacionReglamentaria.min(marca.grsLupulo() * 2)}
}

class CervezaRoja inherits CervezaNegra {
	override method graduacion() { return super() * 1.25 }
}

class Jarras inherits Cervezas{
	var property capacidad
	var property contenido
	
	method contenidoDeAlcohol() {
		return  contenido.graduacion() * capacidad 
	}

}
