  
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   float xcoord = fragCoord[0] / iResolution[0];
   float ycoord = fragCoord[1] / iResolution[1];
   vec4 col = texture(iChannel0,vec2(xcoord,ycoord));
   vec4 col2 = texture(iChannel0,vec2(fract(xcoord + 0.03),ycoord));
   vec2 rays = vec2(0.0,0.0);
   for (float i = 0.0;i < 2.0;i++){
       col[0] -= col[0] - col2[0];
       col[1] -= col[2] - col2[1];
       col[2] -= col[1] - col2[2];
   }
   fragColor = col;
}
