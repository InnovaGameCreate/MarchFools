// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TronCube_Nowave"
{
	Properties
	{
		_GradationTexture("Gradation Texture", 2D) = "white" {}
		_EdgePower("Edge Power", Float) = 0.26
		_EdgeWidth("Edge Width", Float) = 0.13
		_EmissionStrength("Emission Strength", Float) = 2.83
		_PossitiveColor("Possitive Color", Color) = (0.1367925,1,0.3612106,0)
		_NegativeColor("Negative Color", Color) = (0,1,0.9071302,0)
		_ColorState("Color State", Float) = 1
		_Color("Color", Color) = (1,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Color;
		uniform sampler2D _GradationTexture;
		uniform float4 _GradationTexture_ST;
		uniform float _EdgePower;
		uniform float _EdgeWidth;
		uniform float _ColorState;
		uniform float4 _PossitiveColor;
		uniform float4 _NegativeColor;
		uniform float _EmissionStrength;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Color.rgb;
			float2 uv_GradationTexture = i.uv_texcoord * _GradationTexture_ST.xy + _GradationTexture_ST.zw;
			float4 temp_cast_1 = (_EdgePower).xxxx;
			float4 temp_cast_2 = (_EdgeWidth).xxxx;
			float4 clampResult11 = clamp( ( pow( tex2D( _GradationTexture, uv_GradationTexture ) , temp_cast_1 ) - temp_cast_2 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float cos3 = cos( ( 0.5 * UNITY_PI ) );
			float sin3 = sin( ( 0.5 * UNITY_PI ) );
			float2 rotator3 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos3 , -sin3 , sin3 , cos3 )) + float2( 0.5,0.5 );
			float4 temp_cast_3 = (_EdgePower).xxxx;
			float4 temp_cast_4 = (_EdgeWidth).xxxx;
			float4 clampResult17 = clamp( ( pow( tex2D( _GradationTexture, rotator3 ) , temp_cast_3 ) - temp_cast_4 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 lerpResult18 = lerp( clampResult11 , clampResult17 , 0.5);
			float cos37 = cos( ( 1.0 * UNITY_PI ) );
			float sin37 = sin( ( 1.0 * UNITY_PI ) );
			float2 rotator37 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos37 , -sin37 , sin37 , cos37 )) + float2( 0.5,0.5 );
			float4 temp_cast_5 = (_EdgePower).xxxx;
			float4 temp_cast_6 = (_EdgeWidth).xxxx;
			float4 clampResult23 = clamp( ( pow( tex2D( _GradationTexture, rotator37 ) , temp_cast_5 ) - temp_cast_6 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float cos53 = cos( ( 1.5 * UNITY_PI ) );
			float sin53 = sin( ( 1.5 * UNITY_PI ) );
			float2 rotator53 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos53 , -sin53 , sin53 , cos53 )) + float2( 0.5,0.5 );
			float4 temp_cast_7 = (_EdgePower).xxxx;
			float4 temp_cast_8 = (_EdgeWidth).xxxx;
			float4 clampResult34 = clamp( ( pow( tex2D( _GradationTexture, rotator53 ) , temp_cast_7 ) - temp_cast_8 ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 lerpResult35 = lerp( clampResult23 , clampResult34 , 0.5);
			float4 lerpResult36 = lerp( lerpResult18 , lerpResult35 , 0.5);
			float4 lerpResult46 = lerp( _PossitiveColor , _NegativeColor , cos( _Time.y ));
			float4 ifLocalVar43 = 0;
			if( _ColorState > 0.0 )
				ifLocalVar43 = _PossitiveColor;
			else if( _ColorState == 0.0 )
				ifLocalVar43 = lerpResult46;
			else if( _ColorState < 0.0 )
				ifLocalVar43 = _NegativeColor;
			o.Emission = ( float4( 0,0,0,0 ) + ( float4( 0,0,0,0 ) + ( ( lerpResult36 * ifLocalVar43 ) * _EmissionStrength ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
8;1;1586;861;-2434.84;488.5865;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-927.2034,331.157;Inherit;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-901.426,796.3385;Inherit;True;Constant;_Float1;Float 1;2;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-877.7083,1169.492;Inherit;True;Constant;_Float3;Float 3;2;0;Create;True;0;0;False;0;1.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;25;-734.9003,807.6106;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;54;-711.1826,1180.764;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;5;-753.1201,160.6875;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;4;-757.388,338.26;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;37;-455.7881,760.9295;Inherit;True;3;0;FLOAT2;1,1;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;3;-478.9501,281.7061;Inherit;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;53;-432.0704,1134.083;Inherit;True;3;0;FLOAT2;1,1;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;30;-130.2162,1149.435;Inherit;True;Property;_TextureSample2;Texture Sample 2;0;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;2;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;12;-121.8463,382.7312;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;2;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-131.9511,6.710938;Inherit;True;Property;_GradationTexture;Gradation Texture;0;0;Create;True;0;0;False;0;-1;None;1310c389b00742944a196851ef347845;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;8;25.70999,262.4131;Inherit;False;Property;_EdgePower;Edge Power;1;0;Create;True;0;0;False;0;0.26;0.26;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;24;-133.4659,769.0974;Inherit;True;Property;_TextureSample1;Texture Sample 1;0;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;2;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;10;336.085,255.3101;Inherit;False;Property;_EdgeWidth;Edge Width;2;0;Create;True;0;0;False;0;0.13;0.13;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;27;268.6252,1155.28;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;7;262.0903,12.55548;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;13;276.9951,388.5757;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;19;265.3755,774.9419;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.TimeNode;56;1149.827,2115.645;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;9;609.0416,8.406118;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;33;615.5767,1151.13;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;16;623.9465,384.4265;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;22;612.3267,770.7922;Inherit;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;11;869.1543,8.701269;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;41;1069.501,1827.446;Inherit;False;Property;_NegativeColor;Negative Color;5;0;Create;True;0;0;False;0;0,1,0.9071302,0;0,1,0.9071302,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;17;884.0592,384.7216;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;23;872.4394,771.0873;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;49;1023.027,635.4581;Inherit;False;Constant;_Float10;Float 10;16;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;34;875.6896,1151.425;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.CosOpNode;48;1392.875,2115.843;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;40;1075.301,1630.346;Inherit;False;Property;_PossitiveColor;Possitive Color;4;0;Create;True;0;0;False;0;0.1367925,1,0.3612106,0;0.1367925,1,0.3612106,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;42;1286.201,1320.545;Inherit;False;Property;_ColorState;Color State;6;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;1318.201,1436.545;Inherit;False;Constant;_Float2;Float 2;16;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;46;1559.277,1810.344;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;35;1245.03,896.7598;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;18;1248.926,232.1635;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;36;1623.222,543.4114;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ConditionalIfNode;43;1787.302,1394.446;Inherit;True;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;2100.228,553.6974;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;39;2300.821,726.1144;Inherit;False;Property;_EmissionStrength;Emission Strength;3;0;Create;True;0;0;False;0;2.83;2.83;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;2518.663,553.225;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;2782.042,499.084;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;67;3049.84,-167.5865;Inherit;False;Property;_Color;Color;7;0;Create;True;0;0;False;0;1,0,0,0;0,0.3091245,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;65;3081.424,391.3261;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3365.491,-153.1228;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;TronCube_Nowave;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;25;0;51;0
WireConnection;54;0;55;0
WireConnection;4;0;6;0
WireConnection;37;0;5;0
WireConnection;37;2;25;0
WireConnection;3;0;5;0
WireConnection;3;2;4;0
WireConnection;53;0;5;0
WireConnection;53;2;54;0
WireConnection;30;1;53;0
WireConnection;12;1;3;0
WireConnection;24;1;37;0
WireConnection;27;0;30;0
WireConnection;27;1;8;0
WireConnection;7;0;2;0
WireConnection;7;1;8;0
WireConnection;13;0;12;0
WireConnection;13;1;8;0
WireConnection;19;0;24;0
WireConnection;19;1;8;0
WireConnection;9;0;7;0
WireConnection;9;1;10;0
WireConnection;33;0;27;0
WireConnection;33;1;10;0
WireConnection;16;0;13;0
WireConnection;16;1;10;0
WireConnection;22;0;19;0
WireConnection;22;1;10;0
WireConnection;11;0;9;0
WireConnection;17;0;16;0
WireConnection;23;0;22;0
WireConnection;34;0;33;0
WireConnection;48;0;56;2
WireConnection;46;0;40;0
WireConnection;46;1;41;0
WireConnection;46;2;48;0
WireConnection;35;0;23;0
WireConnection;35;1;34;0
WireConnection;35;2;49;0
WireConnection;18;0;11;0
WireConnection;18;1;17;0
WireConnection;18;2;49;0
WireConnection;36;0;18;0
WireConnection;36;1;35;0
WireConnection;36;2;49;0
WireConnection;43;0;42;0
WireConnection;43;1;45;0
WireConnection;43;2;40;0
WireConnection;43;3;46;0
WireConnection;43;4;41;0
WireConnection;50;0;36;0
WireConnection;50;1;43;0
WireConnection;38;0;50;0
WireConnection;38;1;39;0
WireConnection;60;1;38;0
WireConnection;65;1;60;0
WireConnection;0;0;67;0
WireConnection;0;2;65;0
ASEEND*/
//CHKSM=D019CAAF97BDD2446614BA51BA1146F68011C0A5