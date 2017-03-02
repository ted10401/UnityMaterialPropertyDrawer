Shader "Custom/Toggle"
{
	Properties
	{
		_Color ("Color", Color) = (1, 1, 1, 1)
		[Toggle] _Invert("Invert?", Float) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }

		Pass
		{
			CGPROGRAM
			#pragma shader_feature _INVERT_ON

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

				#if _INVERT_ON
                col = 1 - col;
				#endif

				return col;
			}
			ENDCG
		}
	}
}
