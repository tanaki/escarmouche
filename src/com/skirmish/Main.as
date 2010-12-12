package com.skirmish
{
	import aze.motion.easing.Back;
	import aze.motion.eaze;
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import com.skirmish.assets.Background;
	import com.skirmish.data.Config;
	import com.skirmish.events.SkirmishEvent;
	import com.skirmish.TuioListener;
	import com.skirmish.ui.GameUI;
	import com.skirmish.ui.UIList;
	import com.skirmish.ui.WelcomeUI;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.text.StyleSheet;
	import flash.utils.Dictionary;
	import mx.skins.halo.ApplicationBackground;
	import org.tuio.connectors.UDPConnector;
	import org.tuio.TuioClient;
	
	/**
	 * ...
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class Main extends Sprite
	{
		private const HOST : String = "127.0.0.1";
		private const PORT : int = 3000;
		
		private var loader:BulkLoader;
		
		private var listener:TuioListener;
		private var socket:UDPConnector;
		private var tuio:TuioClient;
		private var dictObject:Dictionary;
		
		private var welcomeScreen:WelcomeUI;
		private var gameScreen:GameUI;
		
		
		public function Main():void 
		{
			loader = new BulkLoader();
			
			loader.add("css/default.css", { id : "css" } );
			loader.add("xml/en/strings.xml", { id : "strings" } );
			loader.add("xml/en/armies.xml", { id : "armies" } );
			
			loader.addEventListener(BulkProgressEvent.PROGRESS, onProgress);
			loader.addEventListener(BulkProgressEvent.COMPLETE, onLoadComplete);
			
			loader.start();
		}
		
		private function onProgress(e:BulkProgressEvent):void 
		{
			trace(e._percentLoaded * 100);
		}
		
		private function onLoadComplete (e:BulkProgressEvent) :void
		{
			// init load items
			Config.CSS.parseCSS(loader.getText("css"));
			
			// init application
			initGraphics();
			
			welcomeScreen = new WelcomeUI( UIList.WELCOME_UI );
			addChild(welcomeScreen);
			welcomeScreen.open();
			
			welcomeScreen.dispatcher.addEventListener(SkirmishEvent.UI_CLOSE, initGame);
		}
		
		private function initGame(e:Event):void 
		{
			gameScreen = new GameUI(UIList.GAME_UI);
			addChild(gameScreen);
			gameScreen.open();
			
			gameScreen.dispatcher.addEventListener(SkirmishEvent.UI_OPEN, initTUIO);
		}
		
		private function initTUIO(e:Event) :void
		{
			listener = new TuioListener(gameScreen);
			socket = new UDPConnector();
			tuio = new TuioClient(socket);
			tuio.addListener(listener);
		}
		
		private function enterFrame(e:Event):void 
		{
			
		}
		
		private function initGraphics():void
		{
			addChild(new Background());
		}
	}
	
}