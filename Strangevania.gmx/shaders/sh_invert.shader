//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough vertex shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform float amount;

void main()
{
    vec4 invertColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 normalColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    invertColor.rgb = 1.0 - invertColor.rgb;
    
    //vec3 colorMix = mix(normalColor.rgb, invertColor.rgb, amount);

    gl_FragColor = vec4(invertColor.rgb, normalColor.a);
}

