package;

import flixel.FlxG;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;

class BawsUtil
{
	public static var markup:Array<FlxTextFormatMarkerPair> = [
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x176BA3, null, null, 0x154667), "[b]"), // Blue
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x79F97E, null, null, 0x3B6B3C), "[g]"), // Green
		new FlxTextFormatMarkerPair(new FlxTextFormat(0xBB2424, null, null, 0x531515), "[r]"), // Red
		new FlxTextFormatMarkerPair(new FlxTextFormat(0xEDC00D, null, null, 0x7C6818), "[y]"), // Yellow
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x8A50AA, null, null, 0x5D3B70), "[p]"), // Purple
		new FlxTextFormatMarkerPair(new FlxTextFormat(null, true, null, null), "[l]"), // Bold
		new FlxTextFormatMarkerPair(new FlxTextFormat(null, null, true), "[i]"), // Italic
		new FlxTextFormatMarkerPair(new FlxTextFormat(0x6B0E0E, true, false, 0x260909), "⚠") // Maroon
	];
	public static var diaBlue:Dynamic = 0xFF3366CC;
}
