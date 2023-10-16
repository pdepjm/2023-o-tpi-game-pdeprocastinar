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