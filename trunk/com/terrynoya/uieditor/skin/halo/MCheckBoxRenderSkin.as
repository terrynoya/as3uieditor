package com.terrynoya.uieditor.skin.halo
{
	import com.terrynoya.common.skins.halo.MSkin;
	
	import flash.display.GradientType;

	public class MCheckBoxRenderSkin extends MSkin implements IMRenderSkin
	{
		public function MCheckBoxRenderSkin()
		{
			super();
			this.w = 15;
			this.h = 15;
			this.draw();
		}
		
		override protected function draw():void
		{
			graphics.clear();
			var upFillColors:Array = [fillColors[0], fillColors[1]];
			var upFillAlphas:Array = [fillAlphas[0], fillAlphas[1]];

			// border
			drawRoundRect(
				0, 0, w, h, 0,
				[ borderColor, borderColorDrk1 ], 1,
				verticalGradientMatrix(0, 0, w, h ),
				GradientType.LINEAR, null, 
				{ x: 1, y: 1, w: w - 2, h: h - 2, r: 0 });


			// box fill
			drawRoundRect(
				1, 1, w - 2, h - 2, 0,
				upFillColors, upFillAlphas,
				verticalGradientMatrix(1, 1, w - 2, h - 2));

			// top highlight
			drawRoundRect(
				1, 1, w - 2, (h - 2) / 2, 0,
				[ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
				verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
		}
	}
}