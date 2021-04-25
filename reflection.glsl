void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float xcoord = fragCoord[0] / iResolution[0];
    float ycoord = fragCoord[1] / iResolution[1];
    float sphere[6] = float[6](1.0,1.0,20.0,4.0,1.0,20.0);
    vec3 ray = vec3(-1.0,-1.0,0.0);
    for (int i = 0;i < 10;i += 1){
        float rayjump = 1000.0;
        for (int i2 = 0;i2 < sphere.length();i2+=3){
            float xAxis = sphere[i2] - ray[0];
            float yAxis = sphere[i2 + 1] - ray[1];
            float zAxis = sphere[i2 + 2] - ray[2];
            rayjump = min(sqrt(xAxis * xAxis + yAxis * yAxis + zAxis * zAxis),rayjump);
        }
        ray[0] += xcoord * rayjump;
        ray[1] += ycoord * rayjump; 
        ray[2] += rayjump;
        if (rayjump < 10.0){
            break;
        }
    }
    for (int i = 0;i < sphere.length();i+=3){
        float xAxis = sphere[i] - ray[0];
        float yAxis = sphere[i + 1] - ray[1];
        float zAxis = sphere[i + 2] - ray[2];
        fragColor[0] += 3.0 - sqrt(xAxis * xAxis + yAxis * yAxis + zAxis * zAxis);
    }
}
