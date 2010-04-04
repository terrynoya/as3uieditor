package com.terrynoya.uieditor.control
{
	import com.terrynoya.uieditor.core.MTransformBox;
	import com.terrynoya.uieditor.renders.MCheckBoxRender;
	
	import flash.display.DisplayObject;

	public class MCheckBoxTransformBox extends MTransformBox
	{
		public function MCheckBoxTransformBox()
		{
			super();
		}
		
		override protected function createRender():void
		{
			this.content = new MCheckBoxRender();
			this.addChild(DisplayObject(this.content));
		}  
	}
}