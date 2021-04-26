void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec3 kleur = vec3(0.0,0.0,0.0);
    float bounce = 0.0;
    float afstand = 1.0;
    float xcoord = fragCoord[0] / iResolution[0];
    float ycoord = fragCoord[1] / iResolution[1];
    vec3 ray = vec3(0.5,0.5,0.5);
    float sphere[12] = float[12](cos(iTime) + 2.0,1.5,4.0,1.0,0.0,0.0
    ,3.0,1.5,5.0,0.0,1.0,0.0);
    for (int i = 0;i < 100;i++){
        ray[0] += xcoord / 3.0;
        ray[1] += ycoord / 3.0;
        ray[2] += afstand / 3.0;
        for (int i = 0;i < sphere.length();i+=6){
            float xAxis = abs(ray[0] - sphere[i]);
            float yAxis = abs(ray[1] - sphere[i+1]);
            float zAxis = abs(ray[2] - sphere[i+2]);
            if (sqrt(xAxis * xAxis
            + yAxis * yAxis
            + zAxis * zAxis) < 0.5){
                kleur += (vec3(sphere[i+3],sphere[i+4],sphere[i+5]) / float(i));
                bounce += 1.0;
                afstand -= afstand * 2.0;
            }
        }
    }
    if (bounce != 0.0){
    fragColor[0] = kleur[0] / bounce;
    fragColor[1] = kleur[1] / bounce;
    fragColor[2] = kleur[2] / bounce;
    }
    float xAxis = abs(ray[0] - sphere[0]);
    float yAxis = abs(ray[1] - sphere[1]);
    float zAxis = abs(ray[2] - sphere[2]);
    if (ray[1] > 4.0){
        fragColor[2] = 0.0;
    }
    xAxis = ray[0] - sphere[0];
    yAxis = ray[1] - sphere[1];
    zAxis = ray[2] - sphere[2];
    
}
}
