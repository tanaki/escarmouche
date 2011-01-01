package com.nicolaspigelet.draw 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class Draw
	{
		
		public function Draw() 
		{
			
		}
		
		public static function drawArc (g:Graphics, x:Number, y:Number, a1:Number, a2:Number, r:Number, dir:Number) : void
		{
			var diff:Number = Math.abs(a2-a1);
			var divs:Number = Math.floor(diff/(Math.PI/4))+1;
			var span:Number = dir * diff/(2*divs);
			var rc:Number = r/Math.cos(span);
			
			g.moveTo(x+Math.cos(a1)*r, y+Math.sin(a1)*r);
			
			for (var i:int=0; i < divs; i++) {
				a2 = a1+span; a1 = a2+span;
				g.curveTo(
					x+Math.cos(a2)*rc,
					y+Math.sin(a2)*rc,
					x+Math.cos(a1)*r,
					y+Math.sin(a1)*r
				);
			}
		}

		public static function halfCircle (g:Graphics, x:Number, y:Number, r:Number):void 
		{
			var c1:Number=r * (Math.SQRT2 - 1);
			var c2:Number=r * Math.SQRT2 / 2;
			g.moveTo(x+r,y);
			g.curveTo(x+r,y+c1,x+c2,y+c2);
			g.curveTo(x+c1,y+r,x,y+r);
			g.curveTo(x-c1,y+r,x-c2,y+c2);
			g.curveTo(x-r,y+c1,x-r,y);
		};

		
	}

}