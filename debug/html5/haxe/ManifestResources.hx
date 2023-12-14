package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_medium_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_semibold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR2i172576R3y4:FONTy9:classNamey36:__ASSET__assets_fonts_cabin_bold_ttfR5y31:assets%2Ffonts%2FCabin-Bold.ttfR6tgoR2i176992R3R7R8y42:__ASSET__assets_fonts_cabin_bolditalic_ttfR5y37:assets%2Ffonts%2FCabin-BoldItalic.ttfR6tgoR2i190744R3R7R8y38:__ASSET__assets_fonts_cabin_italic_ttfR5y33:assets%2Ffonts%2FCabin-Italic.ttfR6tgoR2i176076R3R7R8y38:__ASSET__assets_fonts_cabin_medium_ttfR5y33:assets%2Ffonts%2FCabin-Medium.ttfR6tgoR2i183844R3R7R8y44:__ASSET__assets_fonts_cabin_mediumitalic_ttfR5y39:assets%2Ffonts%2FCabin-MediumItalic.ttfR6tgoR2i188320R3R7R8y39:__ASSET__assets_fonts_cabin_regular_ttfR5y34:assets%2Ffonts%2FCabin-Regular.ttfR6tgoR2i173020R3R7R8y40:__ASSET__assets_fonts_cabin_semibold_ttfR5y35:assets%2Ffonts%2FCabin-SemiBold.ttfR6tgoR2i181880R3R7R8y46:__ASSET__assets_fonts_cabin_semibolditalic_ttfR5y41:assets%2Ffonts%2FCabin-SemiBoldItalic.ttfR6tgoR0y41:assets%2Fimages%2Fcharacter%2Fcashier.pngR2i74622R3y5:IMAGER5R25R6tgoR0y41:assets%2Fimages%2Fcharacter%2Fcashier.xmlR2i3656R3R4R5R27R6tgoR0y39:assets%2Fimages%2Fcharacter%2Fnicky.pngR2i422010R3R26R5R28R6tgoR0y39:assets%2Fimages%2Fcharacter%2Fnicky.xmlR2i1716R3R4R5R29R6tgoR0y40:assets%2Fimages%2Fcharacter%2Fnormal.pngR2i236360R3R26R5R30R6tgoR0y40:assets%2Fimages%2Fcharacter%2Fnormal.xmlR2i9677R3R4R5R31R6tgoR0y38:assets%2Fimages%2Fdialogue%2Farrow.pngR2i2931R3R26R5R32R6tgoR0y38:assets%2Fimages%2Fdialogue%2Farrow.xmlR2i762R3R4R5R33R6tgoR0y39:assets%2Fimages%2Fdialogue%2Fbubble.pngR2i12738R3R26R5R34R6tgoR0y39:assets%2Fimages%2Fdialogue%2Fbubble.xmlR2i684R3R4R5R35R6tgoR0y38:assets%2Fimages%2Fdialogue%2Ffancy.pngR2i14905R3R26R5R36R6tgoR0y38:assets%2Fimages%2Fdialogue%2Ffancy.xmlR2i524R3R4R5R37R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R38R6tgoR0y34:assets%2Fimages%2Fmirror%2Fgnd.pngR2i2802R3R26R5R39R6tgoR0y33:assets%2Fimages%2Fmirror%2Fi1.pngR2i3543R3R26R5R40R6tgoR0y33:assets%2Fimages%2Fmirror%2Fi2.pngR2i6578R3R26R5R41R6tgoR0y33:assets%2Fimages%2Fmirror%2Fi3.pngR2i3575R3R26R5R42R6tgoR0y33:assets%2Fimages%2Fmirror%2Fi4.pngR2i4177R3R26R5R43R6tgoR0y36:assets%2Fimages%2Fmountains%2Fbg.pngR2i721866R3R26R5R44R6tgoR0y37:assets%2Fimages%2Fmountains%2Fgnd.pngR2i26546R3R26R5R45R6tgoR0y43:assets%2Fimages%2Fmountains%2Fmountains.pngR2i84654R3R26R5R46R6tgoR0y39:assets%2Fimages%2Fmountains%2Ftrail.pngR2i19482R3R26R5R47R6tgoR0y31:assets%2Fimages%2Fshop%2Fbg.pngR2i16212R3R26R5R48R6tgoR0y43:assets%2Fimages%2Fshop%2FCashier%20Desk.pngR2i6718R3R26R5R49R6tgoR0y33:assets%2Fimages%2Fshop%2Fdesk.pngR2i2663R3R26R5R50R6tgoR0y32:assets%2Fimages%2Ftitle%2Fbg.pngR2i18573R3R26R5R51R6tgoR0y36:assets%2Fimages%2Ftitle%2Fground.pngR2i26330R3R26R5R52R6tgoR0y33:assets%2Fimages%2Ftitle%2Fguy.pngR2i14034R3R26R5R53R6tgoR0y33:assets%2Fimages%2Ftitle%2Fguy.xmlR2i1301R3R4R5R54R6tgoR0y34:assets%2Fimages%2Ftitle%2Flogo.pngR2i328143R3R26R5R55R6tgoR0y34:assets%2Fimages%2Ftitle%2Flogo.xmlR2i2149R3R4R5R56R6tgoR2i1892050R3y5:MUSICR5y32:assets%2Fmusic%2FCountryside.oggy9:pathGroupaR58hR6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R60R6tgoR2i2238315R3R57R5y32:assets%2Fmusic%2FprotoFields.oggR59aR61hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R62R6tgoR2i2114R3R57R5y26:flixel%2Fsounds%2Fbeep.mp3R59aR63y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R57R5y28:flixel%2Fsounds%2Fflixel.mp3R59aR65y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R64R59aR63R64hgoR2i33629R3R67R5R66R59aR65R66hgoR2i15744R3R7R8y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R7R8y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R26R5R72R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R26R5R73R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i912R3R26R5R74R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i433R3R26R5R75R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i446R3R26R5R76R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i459R3R26R5R77R6tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i511R3R26R5R78R6tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i493R3R26R5R79R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i247R3R26R5R80R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i534R3R26R5R81R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i922R3R26R5R82R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i946R3R26R5R83R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i253R3R26R5R84R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i212R3R26R5R85R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i192R3R26R5R86R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i214R3R26R5R87R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i156R3R26R5R88R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1724R3R26R5R89R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i294R3R26R5R90R6tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i129R3R26R5R91R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i128R3R26R5R92R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i136R3R26R5R93R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i147R3R26R5R94R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i191R3R26R5R95R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i153R3R26R5R96R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i185R3R26R5R97R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i201R3R26R5R98R6tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i210R3R26R5R99R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i18509R3R26R5R100R6tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R4R5R101R6tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R4R5R102R6tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R4R5R103R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bold_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bolditalic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_italic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_medium_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_mediumitalic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_regular_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibold_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibolditalic_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mirror_gnd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_gnd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_mountains_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mountains_trail_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shop_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shop_cashier_desk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shop_desk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_countryside_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_protofields_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Bold.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bold_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-BoldItalic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bolditalic_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Italic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_italic_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Medium.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_medium_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-MediumItalic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_mediumitalic_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-Regular.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_regular_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-SemiBold.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibold_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/Cabin-SemiBoldItalic.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibolditalic_ttf extends lime.text.Font {}
@:keep @:image("assets/images/character/cashier.png") @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_png extends lime.graphics.Image {}
@:keep @:file("assets/images/character/cashier.xml") @:noCompletion #if display private #end class __ASSET__assets_images_character_cashier_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/character/nicky.png") @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_png extends lime.graphics.Image {}
@:keep @:file("assets/images/character/nicky.xml") @:noCompletion #if display private #end class __ASSET__assets_images_character_nicky_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/character/normal.png") @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_png extends lime.graphics.Image {}
@:keep @:file("assets/images/character/normal.xml") @:noCompletion #if display private #end class __ASSET__assets_images_character_normal_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dialogue/arrow.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dialogue/arrow.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_arrow_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dialogue/bubble.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dialogue/bubble.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_bubble_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dialogue/fancy.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dialogue/fancy.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dialogue_fancy_xml extends haxe.io.Bytes {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/mirror/gnd.png") @:noCompletion #if display private #end class __ASSET__assets_images_mirror_gnd_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mirror/i1.png") @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mirror/i2.png") @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mirror/i3.png") @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mirror/i4.png") @:noCompletion #if display private #end class __ASSET__assets_images_mirror_i4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/gnd.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_gnd_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/mountains.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_mountains_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mountains/trail.png") @:noCompletion #if display private #end class __ASSET__assets_images_mountains_trail_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shop/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_shop_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shop/Cashier Desk.png") @:noCompletion #if display private #end class __ASSET__assets_images_shop_cashier_desk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shop/desk.png") @:noCompletion #if display private #end class __ASSET__assets_images_shop_desk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title/ground.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_ground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title/guy.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_png extends lime.graphics.Image {}
@:keep @:file("assets/images/title/guy.xml") @:noCompletion #if display private #end class __ASSET__assets_images_title_guy_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/title/logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_png extends lime.graphics.Image {}
@:keep @:file("assets/images/title/logo.xml") @:noCompletion #if display private #end class __ASSET__assets_images_title_logo_xml extends haxe.io.Bytes {}
@:keep @:file("assets/music/Countryside.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_countryside_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/protoFields.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_protofields_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("debug/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("debug/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("G:/HaxeToolkit/haxe/lib/flixel-ui/2,4,0/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_cabin_bold_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Bold"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Bold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_bolditalic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_bolditalic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-BoldItalic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Bold Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_italic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_italic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Italic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_medium_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_medium_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Medium"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Medium"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_mediumitalic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_mediumitalic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-MediumItalic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Medium Italic"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_regular_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-Regular"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin Regular"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_semibold_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibold_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-SemiBold"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin SemiBold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_cabin_semibolditalic_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_cabin_semibolditalic_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Cabin-SemiBoldItalic"; #else ascender = 965; descender = -250; height = 1215; numGlyphs = 269; underlinePosition = -100; underlineThickness = 50; unitsPerEM = 1000; #end name = "Cabin SemiBold Italic"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_medium_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_medium_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_medium_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_mediumitalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_bolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_bolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_italic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_italic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_italic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_medium_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_medium_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_medium_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_mediumitalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_mediumitalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibold_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibold_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibold_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_cabin_semibolditalic_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_cabin_semibolditalic_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
