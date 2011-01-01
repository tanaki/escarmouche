package com.skirmish.ui.game 
{
	import aze.motion.eaze;
	import com.nicolaspigelet.draw.Draw;
	import com.nicolaspigelet.utils.NumberUtils;
	import com.skirmish.data.Config;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class Tools extends Sprite
	{
		private var container:Sprite;
		private var circleMask:Shape;
		
		public function Tools() 
		{
			// Container
			container = new Sprite();
			container.graphics.beginFill(0xffffff);
			Draw.drawArc(container.graphics, 0, 0, 0, NumberUtils.toRad(180), Config.BOAT_RADIUS + Config.TOOLS_SIZE, -1);
			container.alpha = 0;
			
			// Mask
			circleMask = new Shape();
			circleMask.graphics.beginFill(0xff0099);
			Draw.drawArc(circleMask.graphics, 0, 0, 0, NumberUtils.toRad(180), Config.BOAT_RADIUS + Config.TOOLS_SIZE, -1);
			
			// Erase center
			var s : Shape = new Shape();
			s.graphics.beginFill(0xff0099);
			s.graphics.drawCircle(0, 0, Config.BOAT_RADIUS);
			s.blendMode = BlendMode.ERASE;
			container.addChild(s);
			
			addChild(circleMask);
			addChild(container);
			mask = circleMask;
			
			initTools();
		}
		
		private function initTools():void
		{
			
		}
		
		public function open():void 
		{
			eaze(container).apply( { alpha : 1, rotationZ: -180 } ).to(1, { rotationZ : 0 } );
		}
		
	}

}