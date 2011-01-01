package com.skirmish.ui 
{
	import aze.motion.eaze;
	import com.skirmish.data.Config;
	import com.skirmish.events.SkirmishEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class WelcomeUI extends BasicUI
	{
		private var tfTitle:TextField;
		private var startBtn:Sprite;
		
		public function WelcomeUI(name:String) 
		{
			super(name);
			init();
		}
		
		private function init():void
		{
			tfTitle = new TextField();
			tfTitle.autoSize = TextFieldAutoSize.LEFT;
			tfTitle.antiAliasType = AntiAliasType.ADVANCED;
			tfTitle.styleSheet = Config.CSS;
			// TODO use xml input
			tfTitle.htmlText = '<span class="welcome">Welcome on board</span>';
			addChild(tfTitle);
			
			startBtn = new Sprite();
			startBtn.graphics.beginFill(0xffffff, .4);
			startBtn.graphics.drawRoundRect(0, 0, 100, 30, 10, 10);
			startBtn.buttonMode = true;
			
			startBtn.x = (tfTitle.width - startBtn.width) >> 1;
			startBtn.y = tfTitle.y + tfTitle.height + 20;
			
			startBtn.addEventListener(MouseEvent.CLICK, onClickStart);
			
			addChild(startBtn);
		}
		
		private function onClickStart(e:MouseEvent):void 
		{
			close();
		}
		
		override public function open():void 
		{
			x = (Config.STAGE_WIDTH - width) >> 1;
			y = (Config.STAGE_HEIGHT - height) >> 1;
			
			eaze(this).apply( { alpha : 0 } ).to(1, { alpha : 1 } ).onComplete(onEndOpen);
		}
		
		private function onEndOpen():void 
		{
			super.open();
		}
		
		override public function close():void 
		{
			eaze(this).to(1, { alpha : 0 } ).onComplete(onEndClose);
		}
		
		private function onEndClose():void
		{
			super.close();
		}
		
	}

}