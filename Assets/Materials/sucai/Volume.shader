// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/Volume"
{
	  Properties {
        _MainTint ("Main Color", Color) = (1, 1, 1, 1)
    }
    SubShader {
        Tags { "Queue" = "Transparent" }
        LOD 200
        Cull Off

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            uniform float4 _MainTint;

            float4 vert(float4 vertPos : POSITION) : SV_POSITION
            {
                return UnityObjectToClipPos(vertPos);
            }

            float4 frag(float4 vertPos : SV_POSITION) : COLOR
            {
                return _MainTint;
            }
            ENDCG
        }
    } 
    FallBack "Diffuse"
}
