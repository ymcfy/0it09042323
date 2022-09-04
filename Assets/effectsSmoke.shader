// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
 
Shader "effects/Smoke"{
Properties {
	_MainTex ("Base layer (RGB)", 2D) = "white" {}
	_ScrollX ("Base layer Scroll speed X", Float) = 1.0
	_ScrollY ("Base layer Scroll speed Y", Float) = 0.0
	_brightness ("brightness", Float) = 2.0
	_color("color",color) = (1,1,1,1)
}
 
	
SubShader {
	
	Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
 
	pass {
 
	Zwrite Off 
	Cull Off 
	Blend SrcAlpha OneMinusSrcAlpha
	LOD 100
 
	CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag
 	#include "UnityCG.cginc"
 
	sampler2D _MainTex;
	float4 _MainTex_ST;
	float _ScrollX;
	float _ScrollY;
	float _brightness;
	fixed4 _color;
 
struct appdata {
    float4 vertex : POSITION;
    float3 normal : NORMAL;
    float4 texcoord : TEXCOORD0;
    fixed4 color : COLOR;
 
};
	struct v2f {
		float4 pos : SV_POSITION;
		float2 uv : TEXCOORD0;
		fixed4 color : TEXCOORD1;
		float NdotV :TEXCOORD2;
	};
 
	
	v2f vert (appdata v)
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.uv = TRANSFORM_TEX(v.texcoord.xy,_MainTex) + frac(float2(_ScrollX, _ScrollY) * _Time);
		o.color =  v.color;
		float3 Normal =UnityObjectToWorldNormal( v.normal);
		float3 ViewDir =normalize( WorldSpaceViewDir( v.vertex));
	    o.NdotV =pow (abs(dot (Normal,ViewDir)),3);
		return o;
	}
 
 
	fixed4 frag (v2f i) : COLOR
		{
			fixed4 tex = tex2D (_MainTex, i.uv);
			fixed4 o = tex * i.color * _brightness * _color;
			o.a = tex.r * i.color.a * i.NdotV;
			return o;
		}
	ENDCG
	}
   }
}