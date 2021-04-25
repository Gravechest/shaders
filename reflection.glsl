void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float afstand = 1.0;
    float xcoord = fragCoord[0] / iResolution[0];
    float ycoord = fragCoord[1] / iResolution[1];
    vec3 ray = vec3(0.0,0.0,0.0);
    float sphere[3] = float[3](1.5,1.5,iTime / 4.0);
    for (int i = 0;i < 100;i++){
        ray[0] += xcoord / 10.0;
        ray[1] += ycoord / 10.0;
        ray[2] += afstand / 10.0;
        float xAxis = abs(ray[0] - sphere[0]);
        float yAxis = abs(ray[1] - sphere[1]);
        float zAxis = abs(ray[2] - sphere[2]);
        if (xAxis * xAxis + yAxis * yAxis + zAxis * zAxis < 0.2){
            fragColor[0] = fract(zAxis);
            break;
        }
        if (ray[1] > 4.0){
            fragColor[1] = 1.0 - float(i) / 100.0;
            break;
        }
    }
    float xAxis = abs(ray[0] - sphere[0]);
    float yAxis = abs(ray[1] - sphere[1]);
    float zAxis = abs(ray[2] - sphere[2]);
    if (ray[1] > 4.0){
        fragColor[2] = 1.0;
    }
    xAxis = ray[0] - sphere[0];
    yAxis = ray[1] - sphere[1];
    zAxis = ray[2] - sphere[2];
    
}
