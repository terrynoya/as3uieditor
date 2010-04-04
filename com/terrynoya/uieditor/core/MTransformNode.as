package com.terrynoya.uieditor.core
{
	import com.terrynoya.common.core.MSkinableComponent;
	import com.terrynoya.uieditor.skin.MTransformNodeSkin;
	
	import flash.display.DisplayObject;

	public class MTransformNode extends MSkinableComponent
	{
		public function MTransformNode()
		{
			super();
			this.buttonMode = true;
		} 
		
		override protected function createSkin():void
		{
			this.skin = new MTransformNodeSkin();
			this.addChild(DisplayObject(this.skin));
		}
	}
}