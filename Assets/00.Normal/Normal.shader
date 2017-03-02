Shader "Custom/Normal"
{
	Properties
	{
		_Int("Int", Int) = 1
		_Range("Range", Range(0, 1)) = 1
		_Color("Color", Color) = (1, 1, 1, 1)
		_Vector("Vector", Vector) = (1, 1, 1, 1)
		_Cube("Cube", Cube) = "white" {}
		_2D("2D", 2D) = "white" {}
		_3D("3D", 3D) = "white" {}
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
				return _Color;
			}
			ENDCG
		}
	}
}
