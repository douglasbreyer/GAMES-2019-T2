package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	

	public function new()
	{
		super();
		loadGraphic("assets/images/ship.png");
		drag.x = drag.y = 200;
		
	}
	function movement() {
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        if (FlxG.keys.anyPressed([UP, W])) {
            _up = true;
        }

        if (FlxG.keys.anyPressed([DOWN, S])) {
            _down = true;
        }

        if (FlxG.keys.anyPressed([LEFT, A])) {
            _left = true;
        }

        if (FlxG.keys.anyPressed([RIGHT, D])) {
            _right = true;
        }

        if (_up && _down) {
            _up = _down = false;
        }

        if (_left && _right) {
            _left = _right = false;
        }

        if (_up || _down || _left || _right) {
            if (_up) {
                this.y -= 5;
				if(this.y <= 0) this.y = FlxG.height;

            } else if (_down) {
                this.y += 5;
				if(this.y >= FlxG.height) this.y = 0;
            }

            if (_left) {
				this.x -= 5;
				if(this.x <= 0) this.x = FlxG.width;
                
            } else if (_right) {
                this.x += 5;
				if(this.x >= FlxG.width) this.x = 0;
            }

        } else {

        }
    }


    override public function update(elapsed:Float):Void {
        movement();
        super.update(elapsed);
    }

    override public function destroy():Void {
		super.destroy();
	}
}
