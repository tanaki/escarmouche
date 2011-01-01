package com.nicolaspigelet.utils 
{
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class NumberUtils
	{
		
		public static function toRad(degrees : Number) : Number
		{
			return degrees * Math.PI / 180;
		}
		
		public static function toDeg(radian : Number) : Number
		{
			return Math.round(radian * 180 / Math.PI);
		}
		
	}

}