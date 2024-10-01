import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		//config.configurarGravedad()  
	}

}

object tutorial3 {
	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	//	config.configurarGravedad()
		config.ganarOPerder()
	}

}
	
object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({pepita.irA(pepita.position().down(1))})	
		keyboard.c().onPressDo({pepita.come(game.uniqueCollider(pepita))})
	}
	method ganarOPerder(){
		if(pepita.estaCansada() or pepita.estaAtrapada()) {
			game.say(pepita, "Perdiste :(")
			game.schedule(2000, { game.stop()})
		}
		if(pepita.estaEnElNido()){
			game.say(pepita, "GANASTE!!")
			game.removeVisual(nido)
			game.schedule(2000, { game.stop()})
		}
	}

}