package com.skirmish.assets 
{
	import com.skirmish.data.Config;
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class Background extends Sprite
	{
		private var s:Sprite;
		
		public function Background() 
		{
			var matrix : Matrix = new Matrix(.7, 0, 0, .7, Config.STAGE_WIDTH * .5, Config.STAGE_HEIGHT * .5);
			
			s = Sprite(addChild(new Sprite()));
			s.graphics.beginGradientFill(GradientType.RADIAL, [0x63b8c8, 0x198794], [1, 1], [0, 255], matrix);
			s.graphics.drawRect(0, 0, Config.STAGE_WIDTH, Config.STAGE_HEIGHT);
		}
		
	}

}