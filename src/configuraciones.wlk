import wollok.game.*
import susana.*
import escenarios.*
import personajes.*
import elementos.*
import interacciones.*

object nivel {
    method configurarTeclas(zonasHabilitadas, zonasProhibidas) {
        keyboard.a().onPressDo( {susana.moverseIzquierda(zonasHabilitadas, zonasProhibidas)} )
        keyboard.d().onPressDo( {susana.moverseDerecha(zonasHabilitadas, zonasProhibidas)} )
        keyboard.w().onPressDo( {susana.moverseArriba(zonasHabilitadas, zonasProhibidas)} )
        keyboard.s().onPressDo( {susana.moverseAbajo(zonasHabilitadas, zonasProhibidas)} )
    }

    method cargarMapa(mapa) {
        game.clear()
        self.configurarTeclas(mapa.zonasHabilitadas(), mapa.zonasProhibidas())

        mapa.generar()

        game.addVisual(susana)
        game.onCollideDo(susana, {algo => algo.interactuar()})
        
        mapa.agregarNoPisables()
    }
}

class Zona {
	var xIni
	var xFin	
	var yIni
	var yFin	
// ver que responsabilidades tiene zona
	method xIni() = xIni
	method xFin() = xFin
	method yIni() = yIni
	method yFin() = yFin
	
//	method quedaEnZona(x, y) = x >= xIni &&  x <= xFin && y >= yIni && y <= yFin
	
	method quedaEnZona(pos) = pos.x() >= xIni &&  pos.x() <= xFin && pos.y() >= yIni && pos.y() <= yFin

}

object inicio {
	var property position = game.at(0,0)
	method image() = "vecindad/pantalla-inicial.png"
	
	method cargarPantallaInicio() {
		game.addVisual(self)
		keyboard.space().onPressDo { self.comenzar() }
	}
    method comenzar() {
		game.removeVisual(self)
		nivel.cargarMapa(vecindad)
	}
}
