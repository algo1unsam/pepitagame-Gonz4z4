import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else if (self.estaCansada() or self.estaAtrapada()) "pepita-gris.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.finJuego() and self.dentroLimites(nuevaPosicion)){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
		} else {
			niveles.ganarOPerder()
		}
	}
	method dentroLimites(nuevaPosicion){
			return nuevaPosicion.x().between(0,9) and nuevaPosicion.y().between(0,9)
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaAtrapada() {
		return self.position()==silvestre.position()
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}
	method finJuego(){
		return self.estaAtrapada() or self.estaCansada() or self.estaEnElNido()
	}
	

	
}


