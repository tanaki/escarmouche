package com.skirmish 
{
	import aze.motion.eaze;
	import com.nicolaspigelet.utils.NumberUtils;
	import com.skirmish.data.Config;
	import com.skirmish.ui.game.Boat;
	import flash.display.Shape;
	import flash.display.Sprite;
	import org.tuio.ITuioListener;
	import org.tuio.TuioBlob;
	import org.tuio.TuioCursor;
	import org.tuio.TuioObject;
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class TuioListener extends Sprite implements ITuioListener
	{
		public function TuioListener() 
		{
			
		}
		
		/**
		 * Called if a new object was tracked.
		 * @param	tuioObject The values of the received /tuio/**Dobj.
		 */
		public function addTuioObject(tuioObject:TuioObject):void 
		{
			trace("add::TuioObject");
			var boat : Boat = new Boat();
			boat.name = tuioObject.sessionID.toString();
			boat.move(tuioObject.x * Config.STAGE_WIDTH, tuioObject.y * Config.STAGE_HEIGHT, NumberUtils.toDeg(tuioObject.a) );
			addChild(boat);
			
		}
		
		/**
		 * Called if a tracked object was updated.
		 * @param	tuioObject The values of the received /tuio/**Dobj.
		 */
		public function updateTuioObject(tuioObject:TuioObject):void
		{
			trace("update::TuioObject");
			Boat(getChildByName(tuioObject.sessionID.toString())).move(tuioObject.x * Config.STAGE_WIDTH, tuioObject.y * Config.STAGE_HEIGHT, NumberUtils.toDeg(tuioObject.a) , true);
		}
		
		/**
		 * Called if a tracked object was removed.
		 * @param	tuioObject The values of the received /tuio/**Dobj.
		 */
		public function removeTuioObject(tuioObject:TuioObject):void
		{
			trace("remove::TuioObject");
			removeChild( Boat(getChildByName(tuioObject.sessionID.toString())) );
		}
		
		/**
		 * Called if a new cursor was tracked.
		 * @param	tuioObject The values of the received /tuio/**Dcur.
		 */
		public function addTuioCursor(tuioCursor:TuioCursor):void
		{
			trace("add::TuioCursor");
		}
		
		/**
		 * Called if a tracked cursor was updated.
		 * @param	tuioCursor The values of the received /tuio/**Dcur.
		 */
		public function updateTuioCursor(tuioCursor:TuioCursor):void
		{
			trace("update::TuioCursor");
		}
		
		/**
		 * Called if a tracked cursor was removed.
		 * @param	tuioCursor The values of the received /tuio/**Dcur.
		 */
		public function removeTuioCursor(tuioCursor:TuioCursor):void
		{
			trace("remove::TuioCursor");
		}
		
		
		/**
		 * Called if a new blob was tracked.
		 * @param	tuioBlob The values of the received /tuio/**Dblb.
		 */
		public function addTuioBlob(tuioBlob:TuioBlob):void
		{
			trace("add::TuioBlob");
		}

		/**
		 * Called if a tracked blob was updated.
		 * @param	tuioBlob The values of the received /tuio/**Dblb.
		 */
		public function updateTuioBlob(tuioBlob:TuioBlob):void
		{
			trace("update::TuioBlob");
		}
		
		/**
		 * Called if a tracked blob was removed.
		 * @param	tuioBlob The values of the received /tuio/**Dblb.
		 */
		public function removeTuioBlob(tuioBlob:TuioBlob):void
		{
			trace("remove::TuioBlob");
		}
		
		/**
		 * Called if a new frameID is received.
		 * @param	id The new frameID
		 */
		public function newFrame(id:uint):void
		{
			trace("newFrame");
		}
	}

}