Shader "Sunshine/Legacy Shaders/Self-Illumin/Diffuse" {
Properties {
	_Color ("Main Color", Color) = (1,1,1,1)
	_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" {}
	_Illum ("Illumin (A)", 2D) = "white" {}
	_EmissionLM ("Emission (Lightmapper)", Float) = 0
}
SubShader {
	Tags { "RenderType"="Opaque" }
	LOD 200
	
CGPROGRAM
#include "Assets/Sunshine/Shaders/Sunshine.cginc"
#pragma multi_compile SUNSHINE_DISABLED SUNSHINE_FILTER_PCF_4x4 SUNSHINE_FILTER_PCF_3x3 SUNSHINE_FILTER_PCF_2x2 SUNSHINE_FILTER_HARD
#pragma target 3.0

#pragma surface surf Lambert vertex:sunshine_surf_vert exclude_path:prepass

sampler2D _MainTex;
sampler2D _Illum;
fixed4 _Color;

struct Input {
	float2 uv_MainTex;
	float2 uv_Illum;
	SUNSHINE_INPUT_PARAMS;
};
 
SUNSHINE_SURFACE_VERT(Input)

void surf (Input IN, inout SurfaceOutput o) {
	fixed4 tex = tex2D(_MainTex, IN.uv_MainTex);
	fixed4 c = tex * _Color;
	o.Albedo = c.rgb;
	o.Emission = c.rgb * SUNSHINE_SAMPLE_1CHANNEL(_Illum, IN.uv_Illum);
	o.Alpha = c.a;
}
ENDCG
} 
FallBack "Legacy Shaders/Self-Illumin/Diffuse"
}
