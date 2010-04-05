package com.terrynoya.uieditor.control
{
	import com.terrynoya.uieditor.core.MTransformBox;
	import com.terrynoya.uieditor.renders.MLabelButtonRender;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	public class MLabelButtonTransformBox extends MTransformBox
	{
		public function MLabelButtonTransformBox()
		{
			super();
			this.addListeners();
		}
		
		override protected function createRender():void
		{
			this.content = new MLabelButtonRender();
			this.addChild(DisplayObject(this.content));
		}
		
		private function addListeners():void
		{
			this.doubleClickEnabled = true;
			this.addEventListener(MouseEvent.DOUBLE_CLICK,onDoubleClick);
		}
		
		private function onDoubleClick(e:MouseEvent):void
		{
			trace("onDoubleClick");
		}
	}
}