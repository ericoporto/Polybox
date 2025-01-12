// Copyright 2020-2022 David Colson. All rights reserved.

$input a_position, a_texcoord0, a_color0, a_normal
$output v_color0, v_texcoord0

#include "common.sh"

uniform vec4 u_targetResolution;

void main()
{
	vec2 resolution = u_targetResolution.xy * 0.5;
	vec4 vert = mul(u_modelViewProj, vec4(a_position, 1.0) );

	// Snap vertices to screen pixels
	vec4 snapped = vert;
	snapped.xyz = vert.xyz / vert.w;
	snapped.xy = floor(resolution * snapped.xy) / resolution;
	snapped.xyz *= vert.w;

	gl_Position = snapped;
	v_texcoord0 = a_texcoord0;
    v_color0 = a_color0;
}
