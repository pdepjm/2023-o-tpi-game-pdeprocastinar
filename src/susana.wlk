import wollok.game.*

object susana {
	var property position = game.at(0,0)
	const inventario = []
	const elemEntregados = []

	method inventario() = inventario
	method elemEntregados() = elemEntregados

	method tiene(elemento) = self.inventario().contains(elemento)
	method tuvo(elemento) = self.elemEntregados().contains(elemento)

	method agregarA(lugar, elemento) {
		lugar.add(elemento)
	}

	method quitarDe(lugar, elemento) {
		lugar.remove(elemento)
	}

	method entregar(elemento) {
		self.quitarDe(inventario, elemento)
		self.agregarA(elemEntregados, elemento)
	}
	
	method image() = "marley.png"
	
	method quedaEnZona (zona, x, y) {
		return x >= zona.xIni() &&  x <= zona.xFin() && y >= zona.yIni() && y <= zona.yFin()
	}
	
	method moverseArriba(zonas) {
		var puedeMoverse = false
		
		zonas.forEach({ zona => if (self.quedaEnZona(zona, position.x(), position.y() + 1)) { puedeMoverse = true } })

		if(puedeMoverse) self.position(position.up(1))
	}
	
	method moverseAbajo(zonas) {
		var puedeMoverse = false
		
		zonas.forEach({ zona => if (self.quedaEnZona(zona, position.x(), position.y() - 1)) { puedeMoverse = true } })

		if(puedeMoverse) self.position(position.down(1))
		
	}
	
	method moverseDerecha(zonas) {
		
		var puedeMoverse = false
		
		zonas.forEach({ zona => if (self.quedaEnZona(zona, position.x() + 1, position.y())) { puedeMoverse = true } })

		if(puedeMoverse) self.position(position.right(1))
	}
	
	method moverseIzquierda(zonas) {
		
		var puedeMoverse = false
		
		zonas.forEach({ zona => if (self.quedaEnZona(zona, position.x() - 1, position.y())) { puedeMoverse = true } })

		if(puedeMoverse) self.position(position.left(1))
	}
}