float distant(vec3 point,vec3 dest){
    vec3 Axis = abs(point - dest);
    return sqrt(sqrt(Axis[0] * Axis[0] + Axis[1] * Axis[1] + Axis[2] * Axis[2]));
}
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float bounce = 0.0;
    float xcoord = fragCoord[0]/iResolution[0];
    float ycoord = fragCoord[1]/iResolution[1];
    float trvl = 1.0;
    float sphere[14] = float[14](20.5,20.5,50.0,1.0,1.0,0.0,0.0,
    20.5,20.0,iTime * 5.0,1.0,0.0,1.0,0.0);
    vec3 source = vec3(0.0,0.0,0.0);
    vec3 light = vec3(10.0,10.0,10.0);
    vec3 ray = vec3(0.0,0.0,0.0);
    for(int i = 0;i < 100;i++){
        float dist = distant(vec3(sphere[0],sphere[1],sphere[2]),ray) - sphere[3];
        for(int i2 = 0;i2 < sphere.length();i2+=7){
            float distvb = distant(vec3(sphere[i2],sphere[i2+1],sphere[i2+2]),ray);
            dist = min(dist,distvb - sphere[i2+3]);
        
            if (dist < 0.001){
                vec3 reflectie = reflect(vec3(ray[0] - sphere[i2],ray[1] - sphere[i2+1]
                ,sphere[i2+2] - ray[2]),vec3(source));
                xcoord = reflectie[0];
                ycoord = reflectie[1];
                trvl = reflectie[2] - 2.0;
                fragColor[1] = sphere[i2+5];
                bounce += 1.0;
                dist = 0.1;
                source = ray;
            }
        }
        ray[0] += xcoord * dist;
        ray[1] += ycoord * dist;
        ray[2] += trvl * dist;
        if(ray[1] / ray[2] > 2000.0){
            bounce += 1.0;
            break;
        }
    }
    fragColor[0] = distant(light,ray) / 100.0;

} 
