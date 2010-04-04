package com.terrynoya.uieditor.renders
{
	import com.terrynoya.uieditor.core.MUIRender;
	import com.terrynoya.uieditor.skin.halo.MButtonRenderSkin;
	
	import flash.display.DisplayObject;
	
	/**
	 * 按钮在可视化编辑区的外观
	 * @author TerryYao
	 */
	public class MButtonRender extends MUIRender
	{
		/**
		 * 
		 */
		public function MButtonRender()
		{
			super();
		}
		
		override protected function createSkin():void
		{
			this.skin = new MButtonRenderSkin();
			this.addChild(DisplayObject(this.skin));
		}
	}
}