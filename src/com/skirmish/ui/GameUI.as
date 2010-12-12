package com.skirmish.ui 
{
	import com.skirmish.ui.game.ControlPanel;
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class GameUI extends BasicUI
	{
		
		public function GameUI(name:String) 
		{
			super(name);
			init();
		}
		
		private function init():void
		{
			// TODO implements more than 2 players
			var p1_controlPanel : ControlPanel = new ControlPanel();
			var p2_controlPanel : ControlPanel = new ControlPanel(true);
			
			
			
			addChild(p1_controlPanel);
			addChild(p2_controlPanel);
		}
		
	}

}