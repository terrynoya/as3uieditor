package com.terrynoya.uieditor.skin
{
	import com.terrynoya.common.skins.halo.MSkin;

	public class MTransformNodeSkin extends MSkin
	{
		public function MTransformNodeSkin()
		{
			super();
			this.w = 5;
			this.h = 5;
			this.draw();
		} 
		
		override protected function draw():void
		{
			this.graphics.clear();
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0,0,this.w,this.h);
			this.graphics.endFill();			
		}
	}
}