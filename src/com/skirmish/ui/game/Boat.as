package com.skirmish.ui.game 
{
	import com.skirmish.ui.BasicUI;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class Boat extends BasicUI
	{
		
		public function Boat() 
		{
			super("boat_"+Math.round(Math.random()*10000));
			init();
		}
		
		private function init():void
		{
			
		}
		
	}

}