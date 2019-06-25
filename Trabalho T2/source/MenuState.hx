package;

import flixel.*;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState{
    var _title:FlxText;
    var _btnPlay:FlxButton;
    var _btnCredito:FlxButton;
    override public function create():Void{
        _title = new FlxText(0, 0, 0, "TrAbAlHo T1", 40);
        _title.x = (FlxG.width/2)-(_title.width / 2);
        _title.y = (FlxG.height/2)-(_title.height / 2) - 50;

        _btnPlay = new FlxButton(0, 0, "Play", goPlay);
        _btnPlay.x = (FlxG.width/2)-(_btnPlay.width / 2);
        _btnPlay.y = _title.y + _title.height + 30;

        _btnCredito = new FlxButton(0, 0, "Credits", goCreditos);
        _btnCredito.x = (FlxG.width/2)-(_btnCredito.width / 2);
        _btnCredito.y = _btnPlay.y + _btnPlay.height + 5;

        // if (FlxG.sound.music == null){ // don't restart the music if it's already playing
        //     FlxG.sound.playMusic(AssetPaths.dead__mp3, 1, true);
        // }


        add(_title);
        add(_btnPlay);
        add(_btnCredito);



        super.create();
    }
	override public function update(elapsed:Float):Void{
        if(FlxG.keys.justPressed.P || FlxG.keys.justPressed.ENTER){
			goPlay();
        }
		if(FlxG.keys.justPressed.C){
            goCreditos();
        }

        super.update(elapsed);
    }

    function goPlay():Void{
        FlxG.switchState(new PlayState());
    }

    function goCreditos():Void{
        FlxG.switchState(new CreditosState());
    }
}