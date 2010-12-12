package com.skirmish 
{
	import aze.motion.eaze;
	import com.skirmish.data.Config;
	import flash.display.Shape;
	import flash.display.Sprite;
	import org.tuio.ITuioListener;
	import org.tuio.TuioBlob;
	import org.tuio.TuioCursor;
	import org.tuio.TuioObject;
	/**
	 * @author Nicolas Pigelet aka tanaki
	 */
	public class TuioListener implements ITuioListener
	{
		private var container : Sprite;
		
		public function TuioListener(container : Sprite) 
		{
			container = container;
		}
		
		/**
		 * Called if a new object was tracked.
		 * @param	tuioObject The values of the received /tuio/**Dobj.
		 */
		public function addTuioObject(tuioObject:TuioObject):void 
		{
			trace("add::TuioObject");
			var s : Shape = new Shape();
			s.name = tuioObject.sessionID.toString();
			s.graphics.beginFill(0xff9900);
			s.graphics.drawCircle(0, 0, 20);
			s.x = tuioObject.x * Config.STAGE_WIDTH;
			s.y = tuioObject.y * Config.STAGE_HEIGHT;
			container.addChild(s);
		}
		
		/**
		 * Called if a tracked object was updated.
		 * @param	tuioObject The values of the received /tuio/**Dobj.
		 */
		public function updateTuioObject(tuioObject:TuioObject):void
		{
			trace("update::TuioObject");
			eaze(Shape(container.getChildByName(tuioObject.sessionID.toString())))
				.to(.2, { x : tuioObject.x * Config.STAGE_WIDTH, y : tuioObject.y * Config.STAGE_HEIGHT } );
		}
		
		/**
		 * Called if a tracked object was removed.
		 * @param	tuioObject The values of the received /tuio/**Dobj.
		 */
		public function removeTuioObject(tuioObject:TuioObject):void
		{
			trace("remove::TuioObject");
			container.removeChild( Shape(container.getChildByName(tuioObject.sessionID.toString())));
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