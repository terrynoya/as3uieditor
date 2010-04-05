package com.terrynoya.uieditor.control
{
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.uieditor.core.MTransformBox;
	import com.terrynoya.uieditor.renders.MLabelRender;
	
	import flash.display.DisplayObject;

	public class MLabelTransformBox extends MTransformBox
	{
		private var _label:MLabel;
		
		public function MLabelTransformBox()
		{
			super();
		}
		
		override protected function createRender():void
		{
			this.content = new MLabelRender();
			this.addChild(DisplayObject(this.content)); 
		}
		
	}
}