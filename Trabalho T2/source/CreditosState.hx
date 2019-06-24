package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class CreditosState extends FlxState{

    var _credito:FlxText;
    var _prog:FlxText;    
    var _arte:FlxText;
    var _agradecimentos:FlxText;
    var _sprite:FlxSprite;
    var _flixel:FlxText;
    var _btnVoltar:FlxButton;
    

    override public function create():Void{
        _credito = new FlxText(0, 0, 0, "Credits\n\n\n", 40);
        _credito.x = (FlxG.width/2) - (_credito.width / 2);
        _credito.y = FlxG.height;
        _credito.moves = true;
        _credito.velocity.y = -50;
        _credito.alignment = CENTER;

        _prog = new FlxText(0, 0, 0, "------- DEV -------\nDouglas Breyer\n\n", 20);
        _prog.x = (FlxG.width/2) - (_prog.width / 2);
        _prog.y = _credito.y + _credito.height + 10;
        _prog.moves = true;
        _prog.velocity.y = -50;
        _prog.alignment = CENTER;

        _arte = new FlxText(0, 0, 0, "------- ART -------\nDougras Breyer\nUnkleMikey - opengameart.org\n\n", 20);
        _arte.x = (FlxG.width/2)-(_arte.width / 2);
        _arte.y = _prog.y + _prog.height + 10;
        _arte.moves = true;
        _arte.velocity.y = -50;
        _arte.alignment = CENTER;

        _agradecimentos = new FlxText(0, 0, 0, "------- ACKNOWLEDGMENT -------\nHaxeflixel\nArtur S.\nCaroline R.\n UFFS - Chapecó\n\n", 20);
        _agradecimentos.x = (FlxG.width/2)-(_agradecimentos.width / 2);
        _agradecimentos.y = _arte.y + _arte.height + 10;
        _agradecimentos.moves = true;
        _agradecimentos.velocity.y = -50;
        _agradecimentos.alignment = CENTER;

        _sprite = new FlxSprite(0, 0);
        _sprite.x = (FlxG.width/2)-(_sprite.width / 2);
        _sprite.y = _agradecimentos.y + _agradecimentos.height + 10;
        _sprite.velocity.y = -50;

        _flixel = new FlxText(0, 0, 0, "Powered by HaxeFlixel", 10);
        _flixel.x = (FlxG.width/2)-(_flixel.width / 2);
        _flixel.y = _sprite.y + _sprite.height + 20;
        _flixel.moves = true;
        _flixel.velocity.y = -50;
        _flixel.alignment = CENTER;

        _btnVoltar = new FlxButton(0, 0, "Menu", goMenu);
        _btnVoltar.x = (FlxG.width)-(_btnVoltar.width)-5;
        _btnVoltar.y = FlxG.height - _btnVoltar.height - 10;

        add(_prog);
        add(_credito);
        add(_arte);
        add(_agradecimentos);
        add(_sprite);
        add(_flixel);
        add(_btnVoltar);
    }

    function goMenu():Void{
        FlxG.switchState(new MenuState());
    }

    override public function update(elapsed:Float):Void{
        if(FlxG.keys.justPressed.ESCAPE){
			goMenu();
        }

        super.update(elapsed);
    }

}