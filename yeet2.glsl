void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
      vec3 rect = vec3(0.5,0.5,0.5);
      float xcoord = fragCoord[0]/iResolution[0];
      float ycoord = fragCoord[1]/iResolution[1];
      float afstandx = abs(rect[0] - xcoord);
      float afstandy = abs(rect[1] - ycoord);
      afstandx -= abs(afstandx - (1.0 / iTime));
      afstandy -= abs(afstandy - (1.0 / iTime));
      fragColor[0] = 1.0 - sqrt(afstandx * afstandx + afstandy * afstandy) * iTime;
}
