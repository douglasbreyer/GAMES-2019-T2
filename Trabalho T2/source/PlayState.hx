package;

import flixel.util.FlxCollision;
import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.*;

class PlayState extends FlxState{
	var bg:FlxSprite;
   	var bg2:FlxSprite;
   	var camTarget:FlxObject;

	var _hud:HUD;
	var _player:Player;
	public static var asteroides:FlxTypedGroup<Asteroids>;
	var _balas:FlxTypedGroup<Bullet>;
	var _velocity:FlxVector = new FlxVector();

	public static var life:FlxTypedGroup<Life>;
	public static var especmunicao:FlxTypedGroup<Ammunition>;


	public var cont:Float = 2;
	public var tiros:Int = 0;
	public var municao:Int = 20;
	public var vidas:Int = 5;
	public var pontos:Int = 0;

	var random:FlxRandom = new FlxRandom();
	var ramdomLife:FlxRandom = new FlxRandom();
	var ramdomMunicao:FlxRandom = new FlxRandom();


	override public function create():Void {

		bg = new FlxSprite(0,0,AssetPaths.bg__png);
      	bg2 = new FlxSprite(0,bg.height,AssetPaths.bg__png);
		camTarget = new FlxObject();
		_hud = new HUD();
		_player = new Player();
		asteroides = new FlxTypedGroup<Asteroids>();
		_balas = new FlxTypedGroup<Bullet>(20);

		life = new FlxTypedGroup<Life>();
		especmunicao = new FlxTypedGroup<Ammunition>();


      	camTarget.setPosition(FlxG.width/2, FlxG.height/2);
      	FlxG.camera.target = camTarget;
		_player.x = _player.y = 300;
		

		add(bg);
      	add(bg2);
      	add(camTarget);
 		add(_player);
		add(_hud);
		add(asteroides);
		add(_balas);
		add(life);
		add(especmunicao);


		for (i in 0...200) {          //gera asteroides
			var a = new Asteroids();
			a.kill();
			asteroides.add(a);
		}
		spawnarAsteroides();

		for (i in 0...10){
			var n = new Life();  //gera especial de vidas
			n.kill();
			life.add(n);
		}
		spawnarVidas();

		for (i in 0...10){
			var n = new Ammunition();  //gera especial de municao
			n.kill();
			especmunicao.add(n);
		}
		spawnarMunicao();
		
		
		for(i in 0...20){
            var s = new Bullet();
			s.kill();
            _balas.add(s);
        }
		
		super.create();
		_velocity.x = 0;
        _velocity.y = 0;
		
	}


	function criaAsteroides():Void{
		for (i in 0...5) {          //gera asteroides
			var a = new Asteroids();
			a.kill();
			asteroides.add(a);
			geraAsteroides();
		}
	}
	function criaVidas():Void{
		for (i in 0...5) {          //gera asteroides
			var n = new Life();
			n.kill();
			life.add(n);
			geraVidas();
		}
	}

	function criaMunicao():Void{
		for (i in 0...5) {          //gera especial de municao
			var n = new Ammunition();
			n.kill();
			especmunicao.add(n);
			geraMunicao();
		}
	}

	function onOverlapMunicao(a:FlxSprite, b:FlxSprite):Void{   //Colisao das municoes com o player
		var colide = FlxCollision.pixelPerfectCheck(a, b);
		if(colide){
        	municao += 100;
			a.kill();
		}
    }

	function onOverlapVida(a:FlxSprite, b:FlxSprite):Void{   //Colisao dos coracoes com o player
		var colide = FlxCollision.pixelPerfectCheck(a, b);
		if(colide){
        	vidas += 1;
			a.kill();
		}
    }


	function onOverlapPlayer(a:FlxSprite, b:FlxSprite):Void{   //Colisao de player com asteroides
		var colide = FlxCollision.pixelPerfectCheck(a, b);
		if(colide){
        	vidas -= 1;
			b.kill();
		}
    }

	function onOverlapTiro(a:FlxSprite, b:FlxSprite):Void{   //Colisao de tiro com asteroides
		var colide = FlxCollision.pixelPerfectCheck(a, b);
		if(colide){
			a.kill();
			b.kill();
			b.reset(b.x, b.y);
			b.loadGraphic(AssetPaths.explode__png, true, 64, 64);
			pontos += 10;
			new FlxTimer().start(0.2, function(Timer:FlxTimer) {
				b.kill();
				cast(b, Asteroids).reloadSprite();
			}, 1);
		}
		
    }

	function goGameOver():Void{
        FlxG.switchState(new GameOverState());
    }

	override public function update(elapsed:Float):Void{

		//atualizar os scores
		_hud.atualiza(pontos, municao, vidas);


		
		//se atirar
		if((FlxG.keys.justPressed.SPACE && municao > 0 )|| (FlxG.mouse.justPressed && municao > 0)){
			var b = _balas.getFirstAvailable();
			if(b != null){
				b.reset(_player.x + 20, _player.y);
                _velocity.x = _velocity.x;
                _velocity.y = 0 - _player.y;
                _velocity.normalize();
                _velocity.scale(300);
                b.velocity.x = _velocity.x;
                b.velocity.y = _velocity.y;
                tiros++;
                municao--;

			}
		}
		if(municao == 0){
            cont -= elapsed;
        }
        if(cont <= 0){
            municao = 20;
            cont = 2;
        }
		if(asteroides == null){
			criaAsteroides();
		}
		if(life == null){
			criaVidas();
		}

		///////////////////////////COLISAO
		FlxG.overlap(_player, asteroides, onOverlapPlayer);
		FlxG.overlap(_balas, asteroides, onOverlapTiro);
		FlxG.overlap(life, _player, onOverlapVida);
		FlxG.overlap(especmunicao, _player, onOverlapMunicao);
       
		if(vidas == 0){
			goGameOver();
		}

		super.update(elapsed);
		
	}

	private function geraAsteroides():Void
	{
		var asteroide:Asteroids = asteroides.recycle(Asteroids);
		asteroide.angularVelocity = 100;
	}


	private function geraBalas():Void
	{
		var balas:Bullet = _balas.recycle(Bullet);
	}

	private function geraVidas():Void
	{
		var life:Life = life.recycle(Life);
		life.angularVelocity = 100;
	}

	private function geraMunicao():Void
	{
		var especmunicao:Ammunition = especmunicao.recycle(Ammunition);
		especmunicao.angularVelocity = 100;
	}

	function spawnarAsteroides() {
		new FlxTimer().start(0.5, function(Timer:FlxTimer) {
			var xRandom = random.int(0, FlxG.width - 64);
			var asteroide = asteroides.getFirstAvailable();
			asteroide.reset(xRandom, 0);
		}, 0);
	}
	function spawnarVidas() {
		new FlxTimer().start(10, function(Timer:FlxTimer) {
			var xxRandom = ramdomLife.int(0, FlxG.width - 64);
			var life = life.getFirstAvailable();
			life.reset(xxRandom, 0);
			life.velocity.y = 100;
		}, 0);
	}
	function spawnarMunicao() {
		new FlxTimer().start(20, function(Timer:FlxTimer) {
			var xxxRandom = ramdomMunicao.int(0, FlxG.width - 64);
			var especmunicao = especmunicao.getFirstAvailable();
			especmunicao.reset(xxxRandom, 0);
			especmunicao.velocity.y = 100;
		}, 0);
	}
}
