import wollok.game.*

object susana {
	var property checkpoint = 0
	var property position = game.at(0,0)
	const inventario = []

	method inventario() = inventario

	method agregarAInventario(elemento) {
		inventario.add(elemento)
	}
	
	method image() = "marley.png"
	
	method moverseArriba() {
		self.position(position.up(1))
	}
	
	method moverseAbajo() {
		self.position(position.down(1))
	}
	
	method moverseDerecha() {
		self.position(position.right(1))
	}
	
	method moverseIzquierda() {
		self.position(position.left(1))
	}

	

}