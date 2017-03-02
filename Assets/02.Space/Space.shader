Shader "Custom/Space"
{
	Properties
	{
		[Header(This is the first Header)]
		_FirstColor("First Color", Color) = (1, 1, 1, 1)

		[Space]

		[Header(This is the second Header)]
		_SecondColor("Second Color", Color) = (1, 1, 1, 1)

		[Space(50)]

		[Header(This is the third Header)]
		_ThirdColor("Third Color", Color) = (1, 1, 1, 1)
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

			float4 _FirstColor;
			float4 _SecondColor;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);

				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = _FirstColor + _SecondColor;

				return col;
			}
			ENDCG
		}
	}
}
