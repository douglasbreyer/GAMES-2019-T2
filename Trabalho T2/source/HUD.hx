package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class HUD extends FlxGroup{
    var _score:FlxText;
    var _municao:FlxText;
    var _vidas:FlxText;
    var _tempo:FlxText;
    var _fundo:FlxSprite;

    public function new (){
        super();
        _fundo = new FlxSprite();
        _fundo.makeGraphic(FlxG.width, 25, FlxColor.WHITE);
        _score = new FlxText(5, 1, 0, "Score: 000");
        _municao = new FlxText(150, 1, 0, "Magazine: 000");
        _vidas = new FlxText(330, 1, 0, "Life: 0");
        _score.color = FlxColor.BLUE;
        _municao.color = FlxColor.BLUE;
        _vidas.color = FlxColor.BLUE;

        _score.size = _municao.size = _vidas.size = 18;
        add(_fundo);
        add(_score);
        add(_municao);
        add(_vidas);
        
    }

    public function atualiza(_pontos:Int, _balas:Int, _vida:Int):Void{
        _score.text = "Score: " + _pontos;
        _municao.text = "Magazine: " + _balas;
        _vidas.text = "Life: " + _vida;
    }

    override public function update(elapsed:Float):Void{
        
    }
}