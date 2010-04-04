package com.terrynoya.uieditor.events
{
	import com.terrynoya.uieditor.core.MTransformInfo;
	
	import flash.events.Event;

	public class MTransformToolKitEvent extends Event
	{
		public static const UPDATE:String = "mtransform_toolkit_update";
		
		private var _transformInfo:MTransformInfo;
		
		public function MTransformToolKitEvent(type:String,transformInfo:MTransformInfo, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._transformInfo = transformInfo;
		}
		
		public function get transfromInfo():MTransformInfo
		{
			return this._transformInfo;
		}
		
		override public function clone():Event
		{
			return new MTransformToolKitEvent(this.type,this._transformInfo,this.bubbles,this.cancelable);	
		}
	}
}