import wollok.game.*
import configuraciones.*
import escenarios.*
import personajes.*
import elementos.*
import interacciones.*

object susana {
	var property position = game.at(19,3)
	const inventario = []
	const elemEntregados = []
	
	method image() = "susana.png"

	method inventario() = inventario
//	method elemEntregados() = elemEntregados

	method tiene(elemento) = inventario.contains(elemento)
	method tuvo(elemento) = elemEntregados.contains(elemento)
	
	method tieneOTuvo(elemento) = self.tiene(elemento) || self.tuvo(elemento)
	
// cambiar lugar x otra cosa mas expresiva
	method agregarA(coleccion, elemento) {
		coleccion.add(elemento)
	}

	method quitarDeInventario(elemento) {
		inventario.remove(elemento)
	}

	method entregar(elemento) {
		self.quitarDeInventario(elemento)
		self.agregarA(elemEntregados, elemento)
	}

	
//	method moverse(direccion) {
//		const nuevaPosicion = direccion.siguiente(posicionActual())
//		if(escenarioActual.estaLibre(nuevaPosicion)) {
//			position = nuevaPosicion
//		}
//	}
	

	// Métodos de movimiento (optimizar lógica)
	// en zona.quedaEnZona(position.x(), position.y() + 1) }) se puede poner position.up() y que quedaEnZona lo separe en x e y
	// ver si se unifican los 4 en un solo metodo usando polimorfismo
	method moverseArriba(zonasHabilitadas, zonasProhibidas) {
		if (zonasHabilitadas.any({ zona => zona.quedaEnZona(self.position().up(1)) }) && zonasProhibidas.all({ zona => !zona.quedaEnZona(self.position().up(1)) }) ) { self.position(position.up(1)) }
	}

	method moverseAbajo(zonasHabilitadas, zonasProhibidas) {
		if (zonasHabilitadas.any({ zona => zona.quedaEnZona(self.position().down(1)) }) && zonasProhibidas.all({ zona => !zona.quedaEnZona(self.position().down(1)) }) ) { self.position(position.down(1)) }
	}
	
	method moverseDerecha(zonasHabilitadas, zonasProhibidas) {
		if (zonasHabilitadas.any({ zona => zona.quedaEnZona(self.position().right(1)) }) && zonasProhibidas.all({ zona => !zona.quedaEnZona(self.position().right(1)) }) ) { self.position(position.right(1)) } 
	}
	
	method moverseIzquierda(zonasHabilitadas, zonasProhibidas) {
		if (zonasHabilitadas.any({ zona => zona.quedaEnZona(self.position().left(1)) }) && zonasProhibidas.all({ zona => !zona.quedaEnZona(self.position().left(1)) }) ) { self.position(position.left(1)) } 
	}
}