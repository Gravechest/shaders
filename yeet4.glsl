  
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   float xcoord = fragCoord[0] / iResolution[0];
   float ycoord = fragCoord[1] / iResolution[1];
   vec2 rays = vec2(1.0,1.0);
   for (float i = 0.0;i < 1.0;i++){
       vec4 col = texture(iChannel0,vec2(rays[0],rays[1]));
       if (col[0] < 0.5){
       rays[0] -= xcoord;
       rays[1] -= ycoord;
       }
   }
   vec4 col = texture(iChannel0,vec2(rays[0],rays[1]));
   fragColor = col;
}
