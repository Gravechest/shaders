void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float bounce = 0.0;
    float afstand = 1.0;
    float xcoord = fragCoord[0] / iResolution[0];
    float ycoord = fragCoord[1] / iResolution[1];
    vec3 ray = vec3(0.5,0.5,0.5);
    float sphere[3] = float[3](1.5,1.5,3.0);
    for (int i = 0;i < int(iTime * 10.0);i++){
        ray[0] += xcoord / 10.0;
        ray[1] += ycoord / 10.0;
        ray[2] += afstand / 10.0;
        float xAxis = abs(ray[0] - sphere[0]);
        float yAxis = abs(ray[1] - sphere[1]);
        float zAxis = abs(ray[2] - sphere[2]);
        if (fract(xAxis) * fract(xAxis)
        + fract(yAxis) * fract(yAxis)
        + fract(zAxis) * fract(zAxis) < 0.1){
            bounce += 1.0;
            afstand -= afstand * 2.0;
        }
    }
    if (bounce != 0.0){
    fragColor[0] = bounce / 3.0;
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
