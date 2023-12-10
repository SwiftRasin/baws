package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;

class NPC extends FlxSprite
{
	var char:String = '';

	public var interact:Void->Void;
	public var interactions:Float = 0;

	public var canInteract:Bool = true;

	public var offsets:Map<String, FlxPoint>;

	public var radius:FlxPoint;

	public var extraHitBox:FlxSprite;

	public function new(x:Float, y:Float, char:String, canInteract:Bool = false, interact:Void->Void = null, radius:FlxPoint = null)
	{
		this.char = char;
		this.canInteract = canInteract;
		this.interact = interact;
		this.radius = radius;
		if (radius == null)
		{
			this.radius = new FlxPoint(0, 0);
		}
		super();
		loadAssets();
		this.x = x;
		this.y = y;
	}

	override public function update(elapsed:Float)
	{
		FlxG.watch.add(this, "interactions");
		// FlxG.watch.add(this, "y");

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
			force = true;
		if (force)
		{
			offset.set(offsets[anim].x, offsets[anim].y);
			animation.play(anim);
		}
		else
		{
			if (animation.name != anim)
			{
				offset.set(offsets[anim].x, offsets[anim].y);
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
				// the 0 is so that the animation doesn't play the happy anim as well. it's weird as hell but it works.
				animation.addByPrefix('happy', 'Nicky happy', 24, true);

				offsets = ["idle" => new FlxPoint(0, 0), "happy" => new FlxPoint(40, 0)];
				playAnim('idle');

			case 'cashier':
				frames = Files.char('cashier');
				animation.addByPrefix('idle', 'Cashier Idle', 24, true);
				animation.addByPrefix('money', 'Cashier MONEY???', 24, true);
				animation.addByPrefix('scared-start', 'Cashier money transition', 24, false);
				animation.addByPrefix('scared-loop', 'scared', 24, true);

				offsets = ["idle" => new FlxPoint(0, 0), "money" => new FlxPoint(/*38*/ 0, 0)];
				playAnim('idle');
		}
		animation.finishCallback = function(anim:String)
		{
			switch (anim)
			{
				case "happy" | "doodoo":
				// 		do nothing
				default:
					new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						playAnim("idle");
					});
			}
		}
		extraHitBox = new FlxSprite(0, 0).makeGraphic(Std.int(radius.x), Std.int(radius.y), flixel.util.FlxColor.TRANSPARENT);
		PlayState.instance.add(extraHitBox);
		extraHitBox.setPosition(this.x + this.width / 2, this.y + this.height / 2);
	}
}

class Dialogue extends FlxSprite
{
	var type:String = "";

	public function new(x:Float, y:Float, type:String)
	{
		this.type = type;
		super();
		loadAssets();
		this.x = x;
		this.y = y;
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
		switch (type)
		{
			case 'normal':
				frames = Files.dialogue('bubble'); // FlxAtlasFrames.fromSparrow("assets/images/character/normal.png","assets/images/character/normal.xml");// Files.xml("assets/images/character/normal");// = Files.char('normal');
				animation.addByPrefix('idle', 'speech bubble', 24, true);
				playAnim('idle');
		}
	}
}
