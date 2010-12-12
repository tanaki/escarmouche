package com.skirmish.ui.game 
{
	import com.skirmish.ui.BasicUI;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class ControlPanel extends BasicUI
	{
		
		public function ControlPanel(revert:Boolean = false) 
		{
			super("controlPanel_"+Math.round(Math.random()*10000));
			init();
		}
		
		private function init():void
		{
			
		}
		
	}

}