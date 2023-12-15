package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;

class Player extends FlxSprite
{
	public var speed:Float = 0;

	public var inc:Float = 0.2;

	public var cap:Float = 24;

	public var jumpSpeed:Float = 0;

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

	override public function update(elapsed:Float)
	{
		if (offsets[animation.curAnim.name] != null)
		{
			if (flipX == true)
				offset.set(-offsets[animation.curAnim.name].x * 0.8, offsets[animation.curAnim.name].y);
			else
				offset.set(offsets[animation.curAnim.name].x, offsets[animation.curAnim.name].y);
		}
		else
			offset.set(0, 0);
		super.update(elapsed);
	}

	public function playAnim(anim:String, force:Bool = false)
	{
		if (animation.name == null)
			force = true;
		if (force)
		{
			if (offsets[anim] != null)
			{
				if (flipX == true)
					offset.set(-offsets[anim].x * 0.8, offsets[anim].y);
				else
					offset.set(offsets[anim].x, offsets[anim].y);
			}
			else
				offset.set(0, 0);
			animation.play(anim);
		}
		else
		{
			if (animation.name != anim)
			{
				if (offsets[anim] != null)
				{
					if (flipX == true)
						offset.set(-offsets[anim].x, offsets[anim].y);
					else
						offset.set(offsets[anim].x, offsets[anim].y);
				}
				else
					offset.set(0, 0);
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
				animation.addByPrefix('walk', 'Walking Suit0', 24, true);
				animation.addByPrefix('run', 'Walking Suit RUN', 24, true);
				animation.addByPrefix('dizzy', 'Walking Suit BREAK', 24, true);
				animation.addByPrefix('jump', 'Jump Suit', 24, true);
				animation.addByPrefix('fly', 'Walking Suit FLY', 24, true);
				animation.addByPrefix('land', 'abt to land', 24, true);
				animation.addByPrefix('shock', 'shock!', 24, false);
				animation.addByPrefix('smile', 'smile', 24, false);
				animation.addByPrefix('sus', 'runningg', 24, false);
				// yippee

				offsets = [
					"idle" => new FlxPoint(0, 0),
					"shock" => new FlxPoint(0, 52) /*,
						"run" => new FlxPoint(70, 0) */
				];

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
