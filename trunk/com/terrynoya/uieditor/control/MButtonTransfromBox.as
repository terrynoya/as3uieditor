package com.terrynoya.uieditor.control
{
	import com.terrynoya.uieditor.core.MTransformBox;
	import com.terrynoya.uieditor.renders.MButtonRender;

	public class MButtonTransfromBox extends MTransformBox
	{
		public function MButtonTransfromBox()
		{
			super();
		}
		
		override protected function createRender():void
		{
			this.content = new MButtonRender();
		} 
	}
}