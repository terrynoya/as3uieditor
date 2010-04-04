package com.terrynoya.uieditor.control
{
	import com.terrynoya.uieditor.core.MTransformBox;
	import com.terrynoya.uieditor.renders.MSliderRender;
	
	import flash.display.DisplayObject;

	public class MSliderTransformBox extends MTransformBox
	{
		public function MSliderTransformBox()
		{
			super();
		}
		
		override protected function createRender():void
		{
			this.content = new MSliderRender();
			this.addChild(DisplayObject(this.content));
		}
	}
}