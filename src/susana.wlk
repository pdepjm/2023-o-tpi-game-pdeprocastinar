import wollok.game.*
import configuraciones.*
import escenarios.*
import personajes.*
import elementos.*
import interacciones.*

object susana {
	var property position = game.at(19,3)
	var property mapaActual = vecindad
	
	const inventario = []
	const elemEntregados = []
	
	method image() = "personajes/susana.png"

	method inventario() = inventario

	method tiene(elemento) = inventario.contains(elemento)
	method tuvo(elemento) = elemEntregados.contains(elemento)
	method tieneOTuvo(elemento) = self.tiene(elemento) || self.tuvo(elemento)

	method entregar(elemento) {
		inventario.remove(elemento)
		elemEntregados.add(elemento)
	}

	method moverse(direccion) {
		if(mapaActual.sePuedeAcceder(direccion.ir(position))) {
			self.position(direccion.ir(position))
		}
	}
	
	method irALaPuerta() {
		position = mapaActual.posSusana()
	}

	method recibirObjeto (objeto) {
		self.inventario().add(objeto)
		game.addVisual(objeto)
		game.schedule(2000, { game.removeVisual(objeto) })
	}
}

object arriba {
	method ir(pos) = pos.up(1) 
}

object abajo {
	method ir(pos) = pos.down(1) 
}

object izquierda {
	method ir(pos) = pos.left(1) 
}

object derecha {
	method ir(pos) = pos.right(1) 
}