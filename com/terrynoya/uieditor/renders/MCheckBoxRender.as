package com.terrynoya.uieditor.renders
{
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.uieditor.core.MUIRender;
	import com.terrynoya.uieditor.skin.halo.MCheckBoxRenderSkin;
	
	import flash.display.DisplayObject;
	
	public class MCheckBoxRender extends MUIRender
	{
		private var _label:MLabel;
		
		private var _gap:Number = 0;
		
		public function MCheckBoxRender()
		{
			super();
			this._label.x = this.skin.width + this._gap;
			this._label.y = (this.skin.height - this._label.height)/2;
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._label = new MLabel();
			this._label.text = "Label";
			this.addChild(this._label);
		}
		
		override protected function createSkin():void
		{
			this.skin = new MCheckBoxRenderSkin();
			this.addChild(DisplayObject(this.skin));
		}
		
		override public function set width(value:Number):void
		{
			
		}
		
		override public function get width():Number
		{
			return this.skin.width + this._label.width + this._gap;
		}
		
		override public function set height(value:Number):void
		{
			
		}
	}
}