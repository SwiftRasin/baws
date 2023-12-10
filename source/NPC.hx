package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class NPC extends FlxSprite
{
	var char:String = '';

	public var interact:Void->Void;
	public var interactions:Float = 0;

	public var canInteract:Bool = true;

	public function new(x:Float, y:Float, char:String, canInteract:Bool = false, interact:Void->Void = null)
	{
		this.char = char;
		this.canInteract = canInteract;
		this.interact = interact;
		super();
		loadAssets();
		this.x = x;
		this.y = y;
	}

	override public function update(elapsed:Float)
	{
		if (PlayState.instance.npc_check(this) == true)
		{
			if (interact != null && canInteract == true)
			{
				interactions++;
				interact();
			}
		}
		super.update(elapsed);
	}

	public function playAnim(anim:String, force:Bool = false)
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
			case 'player':
				frames = Files.char('player'); // FlxAtlasFrames.fromSparrow("assets/images/character/normal.png","assets/images/character/normal.xml");// Files.xml("assets/images/character/normal");// = Files.char('normal');
				animation.addByPrefix('idle', 'Idle Suit', 24, true);
				animation.addByPrefix('walk', 'Walking Suit', 24, true);
				animation.addByPrefix('jump', 'Jump Suit', 24, true);
				playAnim('idle');
			case 'nicky':
				frames = Files.char('nicky');
				animation.addByPrefix('idle', 'Nicky0', 24, true);
				// the 0 is so that the animations doesn't play the other one too. it's weird as hell but it works.
				animation.addByPrefix('happy', 'Nicky happy', 24, true);
				playAnim('idle');
		}
	}
}
