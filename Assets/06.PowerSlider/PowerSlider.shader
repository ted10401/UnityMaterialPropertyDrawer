Shader "Custom/PowerSlider"
{
	Properties
	{
		[PowerSlider(3.0)] _Shininess ("Shininess", Range (0.01, 1)) = 0.08
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }

		Pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			float4 _Color;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);

				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = _Color;

				return col;
			}
			ENDCG
		}
	}
}
