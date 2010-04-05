package com.terrynoya.uieditor.renders
{
	import com.terrynoya.common.control.MLabel;
	import com.terrynoya.uieditor.core.MUIRender;

	public class MLabelRender extends MUIRender
	{
		private var _label:MLabel;
		
		public function MLabelRender()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._label = new MLabel();
			this._label.text = "Label";
			this.addChild(this._label);
		}
		
		override public function set width(value:Number):void
		{
			
		} 
		
		override public function set height(value:Number):void
		{
			
		} 
		
		override public function get width():Number
		{
			return this._label.width;
		}
		
		override public function get height():Number
		{
			return this._label.height;
		} 
	}
}