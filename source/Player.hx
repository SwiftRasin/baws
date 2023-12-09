package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Player extends FlxSprite
{
	/*var variants:Array<Dynamic> = [
		{
			name: 'The Rager',
			asset: 'rager',
			speed: 1,
			jump_height: 5
		}
	];*/ // old unused stuff from other game

	var char:String = '';

	public function new(x:Float, y:Float, char:String)
	{
		this.char = char;
		super();
		loadAssets();
		this.x = x;
		this.y = y;
	}

	public function playAnim(anim:String,force:Bool = false)
	{
		if (animation.name == null)
		{
			force = true;
		}
		if (force)
			animation.play(anim);
		else
		{
			if (animation.name != anim)
			{
				animation.play(anim);
			}
		}
	}

	function loadAssets()
	{
		switch (char)
		{
			case 'normal':
				frames = Files.char('normal');//FlxAtlasFrames.fromSparrow("assets/images/character/normal.png","assets/images/character/normal.xml");// Files.xml("assets/images/character/normal");// = Files.char('normal');
				animation.addByPrefix('idle', 'Idle Suit', 24, true);
				animation.addByPrefix('walk', 'Walking Suit', 24, true);
				animation.addByPrefix('jump', 'Jump Suit', 24, true);
				playAnim('idle');
		}
	}
}
