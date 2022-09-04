Shader "Custom/SurfaceShader_VC" {
	Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_Normal("Normap Map", 2D) = "bump" {}

	}
		SubShader{
			Tags {"Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent"}

			Pass{
				Tags { "LightMode" = "ForwardBase" }

				ZWrite Off
				Blend SrcAlpha OneMinusSrcAlpha
				CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma vertex vert
		#pragma fragment frag
		#include "Lighting.cginc"

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _Normal;
		float4 _MainTex_ST;

		struct Input {
			float2 uv_MainTex : TEXCOORD0;
			float4 vertex : SV_POSITION;
			float4 color : COLOR;
		};

		Input vert(appdata_full v)
		{
			Input o;
			UNITY_INITIALIZE_OUTPUT(Input, o);
			o.vertex = UnityObjectToClipPos(v.vertex);
			TANGENT_SPACE_ROTATION;
			o.uv_MainTex = TRANSFORM_TEX(v.texcoord, _MainTex);

			o.color = v.color;
			return o;
		}

		fixed4 _Color;

		fixed4 frag(Input IN) : SV_Target
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			fixed4 Albedo = c * IN.color;
			fixed Alpha = c.a * IN.color.a;
			return (Albedo,Alpha);
		}
		ENDCG
	}
	}
		FallBack "Diffuse"
}