float distant(vec3 point,vec3 dest){
    vec3 Axis = abs(point - dest);
    return sqrt(sqrt(Axis[0] * Axis[0] + Axis[1] * Axis[1] + Axis[2] * Axis[2]));
}
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float xcoord = fragCoord[0]/iResolution[0] * 1.3;
    float ycoord = fragCoord[1]/iResolution[1];
    float trvl = 1.0;
    float sphere[8] = float[8](1.5,2.5,5.0,1.0,5.5,iTime,6.0,1.0);
    vec3 source = vec3(0.0,0.0,0.0);
    vec3 light = vec3(10.0,10.0,10.0);
    vec3 ray = vec3(0.0,0.0,0.0);
    for(int i = 0;i < 100;i++){
        float dist = distant(vec3(sphere[0],sphere[1],sphere[2]),ray);
        for(int i2 = 0;i2 < sphere.length();i2+=4){
            float distvb = distant(vec3(sphere[i2],sphere[i2+1],sphere[i2+2]),ray);
            dist = min(dist,distvb);
        }
        dist -= 1.0;
        if (dist < 0.001){
            vec3 reflectie = reflect(vec3(ray[0] - sphere[0],ray[1] - sphere[1]
            ,sphere[2] - ray[2]),vec3(source));
            xcoord = reflectie[0];
            ycoord = reflectie[1];
            trvl = reflectie[2] - 2.0;
        }
        ray[0] += xcoord * dist;
        ray[1] += ycoord * dist;
        ray[2] += trvl * dist;
        if (ray[2] > 1000.0){
            break;
        }
    }
    if (ray[0] < 10.0){
    fragColor[0] = ray[2] / 2.0;
    }
    if (ray[0] > 1.0){
        fragColor[1] = ray[1] / 60.0;
    }
} 
