import wollok.game.*
import susana.*
import escenarios.*
import personajes.*
import elementos.*

object nivel {
    method configurarTeclas(zonas) {
        keyboard.a().onPressDo( {susana.moverseIzquierda(zonas)} )
        keyboard.d().onPressDo( {susana.moverseDerecha(zonas)} )
        keyboard.w().onPressDo( {susana.moverseArriba(zonas)} )
        keyboard.s().onPressDo( {susana.moverseAbajo(zonas)} )
    }

    method cargarMapa(mapa) {
        game.clear()
        self.configurarTeclas(mapa.zonas())

        game.addVisual(susana)
        game.onCollideDo(susana, {algo => algo.interactuar()})
        
        mapa.generar()
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
	
	method quedaEnZona (x, y) = x >= xIni &&  x <= xFin && y >= yIni && y <= yFin
}