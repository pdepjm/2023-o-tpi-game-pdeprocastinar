import wollok.game.*
import configuraciones.*
import escenarios.*
import personajes.*
import elementos.*

object susana {
	var property position = game.at(0,0)
	const inventario = []
	const elemEntregados = []
	
	method image() = "susana.png"

	method inventario() = inventario
	method elemEntregados() = elemEntregados

	method tiene(elemento) = self.inventario().contains(elemento)
	method tuvo(elemento) = self.elemEntregados().contains(elemento)
	
	method tieneOTuvo(elemento) = self.tiene(elemento) || self.tuvo(elemento)
	
// cambiar lugar x otra cosa mas expresiva
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
	
	method moverseArriba(zonas) {
		if (zonas.any(zona => zona.quedaEnZona(position.x(), position.y() + 1))) { self.position(position.up(1)) }
	}

	method moverseAbajo(zonas) {
		if (zonas.any(zona => zona.quedaEnZona(position.x(), position.y() - 1))) { self.position(position.down(1)) }
	}
	
	method moverseDerecha(zonas) {
		if (zonas.any(zona => zona.quedaEnZona(position.x() + 1, position.y()))) { self.position(position.right(1)) } 
	}
	
	method moverseIzquierda(zonas) {
		if (zonas.any(zona => zona.quedaEnZona(position.x() - 1, position.y()))) { self.position(position.left(1)) } 
	}
}