package;

import flixel.FlxG;

class UniversalData
{
	public static var shoes:Bool = false;

	public static function updateVars()
	{
		FlxG.save.data.shoes = shoes;
	}

	public static function resetAll()
	{
		FlxG.save.data.shoes = null;
	}

	public static function init()
	{
		if (FlxG.save.data.shoes = null)
			FlxG.save.data.shoes = false;
		shoes = FlxG.save.data.shoes;
	}
}
