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
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float surface_width;
uniform float surface_height;
uniform float gamma;

void main()
{
    vec4 c = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    //vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );
    
    //c.rgb = pow(abs(c.rgb), vec3(1.0 / gamma));
    //float val = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    //vec3 out_col = mix(vec3(val), c.rgb, gamma);
    
    //if(mod(floor(v_vTexcoord.y * surface_height), 2.0) == 0.0)
    //{
        //discard;
        //c.rgb -= vec3(0.6);
        //out_col -= vec3(0.6);
    //}
    
    gl_FragColor = c * (sin(v_vTexcoord.y * surface_height * 2.0));
    //gl_FragColor = c;
    //gl_FragColor = v_vColour * vec4(out_col, c.a);
}

