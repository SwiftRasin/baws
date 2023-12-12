package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;

class Player extends FlxSprite
{
	/*var variants:Array<Dynamic> = [
			{
				name: 'The Rager',
				asset: 'rager',
				speed: 1,
				jump_height: 5
			}
		]; */ // old unused stuff from other game
	var char:String = '';

	public var offsets:Map<String, FlxPoint>;

	public function new(x:Float, y:Float, char:String)
	{
		this.char = char;
		super();
		loadAssets();
		this.x = x;
		this.y = y;
	}

	public function playAnim(anim:String, force:Bool = false)
	{
		if (animation.name == null)
			force = true;
		if (force)
		{
			if (offsets[anim] != null)
				offset.set(offsets[anim].x, offsets[anim].y);
			animation.play(anim);
		}
		else
		{
			if (animation.name != anim)
			{
				if (offsets[anim] != null)
					offset.set(offsets[anim].x, offsets[anim].y);
				animation.play(anim);
			}
		}
	}

	function loadAssets()
	{
		switch (char)
		{
			case 'normal':
				frames = Files.char('normal'); // FlxAtlasFrames.fromSparrow("assets/images/character/normal.png","assets/images/character/normal.xml");// Files.xml("assets/images/character/normal");// = Files.char('normal');
				animation.addByPrefix('idle', 'Idle Suit', 24, true);
				animation.addByPrefix('walk', 'Walking Suit', 24, true);
				animation.addByPrefix('jump', 'Jump Suit', 24, true);
				animation.addByPrefix('shock', 'shock!', 24, false);
				animation.addByPrefix('smile', 'smile', 24, false);
				animation.addByPrefix('sus', 'runningg', 24, false);

				offsets = ["idle" => new FlxPoint(0, 0), "shock" => new FlxPoint(0, 52)];

				playAnim('idle');
		}
		animation.finishCallback = function(anim:String)
		{
			switch (anim)
			{
				case /*"walk" | */ "idle" | "jump" | "sus" | "shock":
				// 		do nothing
				default:
					new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						playAnim("idle");
					});
			}
		}
	}
}
