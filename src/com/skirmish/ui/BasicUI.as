package com.skirmish.ui 
{
	import com.skirmish.events.SkirmishEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class BasicUI extends Sprite
	{
		private var _dispatcher:EventDispatcher;
		
		public function BasicUI(name:String) 
		{
			name = name;
			_dispatcher = new EventDispatcher();
		}
		
		public function open():void 
		{
			_dispatcher.dispatchEvent(new Event(SkirmishEvent.UI_OPEN));
		}
		
		public function close():void 
		{
			_dispatcher.dispatchEvent(new Event(SkirmishEvent.UI_CLOSE));
		}
		
		public function get dispatcher():EventDispatcher { return _dispatcher; }
		
	}

}