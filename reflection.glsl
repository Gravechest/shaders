float distant(vec3 point,vec3 dest){
    vec3 Axis = abs(point - dest);
    return sqrt(sqrt(Axis[0] * Axis[0] + Axis[1] * Axis[1] + Axis[2] * Axis[2]));
}
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float xcoord = fragCoord[0]/iResolution[0] * 1.3;
    float ycoord = fragCoord[1]/iResolution[1];
    float sphere[4] = float[4](1.5,2.5,10.0,1.0);
    vec3 light = vec3(10.0,10.0,10.0);
    vec3 ray = vec3(0.0,0.0,0.0);
    for(int i = 0;i < 100;i++){
        float xAxis = abs(sphere[0] - ray[0]);
        float yAxis = abs(sphere[1] - ray[1]);
        float zAxis = abs(sphere[2] - ray[2]);
        float dist = sqrt(sqrt(xAxis * xAxis + yAxis * yAxis + zAxis * zAxis));
        dist -= sphere[3];
        if (dist < 0.001){
            float raylight = distant(ray,light);
            float spherelight = distant(vec3(sphere[0],sphere[1],sphere[2]),light);
            fragColor[0] = 0.5 + (raylight - spherelight) * 5.0;
        }
        ray[0] += xcoord * dist;
        ray[1] += ycoord * dist;
        ray[2] += dist;
    }
}
