Shader "Custom/KeywordEnum"
{
	Properties
	{
		[KeywordEnum(Red, Green, Blue)] _ColorMode ("Color Mode", Float) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }

		Pass
		{
			CGPROGRAM
			#pragma multi_compile _COLORMODE_RED _COLORMODE_GREEN _COLORMODE_BLUE
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
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);

				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = fixed4(0, 0, 0, 1);

				#if _COLORMODE_RED
				col.r = 1;
				#elif _COLORMODE_GREEN
				col.g = 1;
				#elif _COLORMODE_BLUE
				col.b = 1;
				#endif

				return col;
			}
			ENDCG
		}
	}
}
