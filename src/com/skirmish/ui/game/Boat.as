package com.skirmish.ui.game 
{
	import aze.motion.eaze;
	import com.nicolaspigelet.draw.Draw;
	import com.nicolaspigelet.utils.NumberUtils;
	import com.skirmish.data.Config;
	import com.skirmish.ui.BasicUI;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.utils.Timer;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class Boat extends BasicUI
	{
		private var container:Sprite;
		private var timer:Timer;
		private var tools:Tools;
		private var btnOpen:Sprite;
		
		public function Boat() 
		{
			super("");
			init();
		}
		
		private function init():void
		{
			// container
			container = new Sprite();
			
			var s : Shape = new Shape();
			s.graphics.beginFill(0x333333, .5);
			s.graphics.drawCircle(0, 0, Config.BOAT_RADIUS);
			s.graphics.endFill();
			container.addChild(s);
			
			// Tools
			tools = new Tools();
			container.addChild(tools);
			
			// Button
			btnOpen = new Sprite();
			btnOpen.graphics.beginFill(0xffffff);
			btnOpen.graphics.drawRoundRect(0, 0, 20, 20, 3, 3);
			btnOpen.x = -(Config.BOAT_RADIUS + 10);
			btnOpen.y = -(btnOpen.height >> 1);
			btnOpen.addEventListener(MouseEvent.CLICK, onClick);
			btnOpen.buttonMode = true;
			addChild(btnOpen);
			
			addChild(container);
			s.filters = [new BlurFilter(10, 10, 2)];
		}
		
		private function onClick(e:MouseEvent):void 
		{
			btnOpen.removeEventListener(MouseEvent.CLICK, onClick);
			eaze(btnOpen).to(.5, { alpha:0 } );
			
			tools.open();
		}
		
		public function move(x:int, y:int, rotation:int, easing:Boolean = false):void 
		{
			if (easing) 
				eaze(container).to(.5, { x:x, y:y, rotationZ : rotation } );
			else {
				container.x = x;
				container.y = y;
				container.rotationZ = rotation;
			}
		}
		
	}

}