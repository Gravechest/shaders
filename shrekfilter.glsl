void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   vec4 col = texture(iChannel0,vec2(fragCoord[0] / iResolution[0] , fragCoord[1] / iResolution[1]));
   if(col[0] + col[1] + col[2] < 1.5){
       col = vec4(col[0] - 0.5,col[1] + col[0],col[2] - col[1],1.0);
       
   }
   fragColor = col;
}
