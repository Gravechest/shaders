


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
      vec4 rect = vec4(0.5,(cos(iTime)+ 1.5) / 3.0,1.2,(cos(iTime + 1.0)+ 1.5) / 3.0);
      float xcoord = fragCoord[0]/iResolution[1];
      float ycoord = fragCoord[1]/iResolution[1];
      float afstandx = abs(rect[0] - xcoord);
      float afstandy = abs(rect[1] - ycoord);
      float afstandx2 = abs(rect[2] - xcoord);
      float afstandy2 = abs(rect[3] - ycoord);
      float yeet = 1.0 - sqrt(afstandx * afstandx + afstandy * afstandy) * 6.0;
      float yeet2 = 1.0 - sqrt(afstandx2 * afstandx2 + afstandy2 * afstandy2) * 6.0;
      fragColor[0] = pow(yeet,sqrt(afstandx * afstandx + afstandy * afstandy));
      fragColor[1] = pow(yeet2,sqrt(afstandx2 * afstandx2 + afstandy2 * afstandy2));
}
