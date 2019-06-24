package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class GameOverState extends FlxState{
    var _title:FlxText;
    var _pont:FlxText;
    var _btnMenu:FlxButton;
    override public function create():Void{
        _title = new FlxText(0, 0, 0, "GAME OVER", 40);
        _title.x = (FlxG.width/2)-(_title.width / 2);
        _title.y = (FlxG.height/2)-(_title.height / 2) - 50;

       /* _pont = new FlxText(0, 0, 0, "Pontos: " + _pontos, 40);
        _pont.x = (FlxG.width/2)-(_title.width / 2);
        _pont.y = (FlxG.height/2)-(_title.height / 2) - 50;
*/
        _btnMenu = new FlxButton(0, 0, "Menu", goMenu);
        _btnMenu.x = (FlxG.width/2) - 40;
        _btnMenu.y = 300;
        
        add(_title);
       // add(_);
        add(_btnMenu);
        super.create();
    }
	override public function update(elapsed:Float):Void{
        if(FlxG.keys.justPressed.ENTER){
			goMenu();
        }
        super.update(elapsed);
    }

    function goMenu():Void{
        FlxG.switchState(new MenuState());
    }

}