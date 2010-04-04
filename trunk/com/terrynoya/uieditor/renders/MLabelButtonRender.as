package com.terrynoya.uieditor.renders
{
	import com.terrynoya.common.control.MLabel;
	
	/**
	 * LabelButton在可视化编辑区的外观
	 * @author TerryYao
	 */
	public class MLabelButtonRender extends MButtonRender
	{
		private var _label:MLabel;
		
		/**
		 * 
		 */
		public function MLabelButtonRender()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this._label = new MLabel();
			this._label.text = "LabelButton";
			this.addChild(this._label);
		}
		
		override public function set width(value:Number):void
		{
			super.width = value;
			this.centerLabel();
		} 
		
		override public function set height(value:Number):void
		{
			super.height = value;
			this.centerLabel();
		} 
		
		override protected function updateView():void
		{
			super.updateView();
			this.setChildIndex(this._label, this.numChildren -1);
			this.centerLabel();
		}
		
		private function centerLabel():void
		{
			this._label.x = (this.width - this._label.width) / 2;
			this._label.y = (this.height - this._label.height) / 2;
		} 
	}
}