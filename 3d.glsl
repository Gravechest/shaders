void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float bounce = 0.0;
    float heigth = iMouse[1] / 10.0;
    vec2 loc = vec2(0.5 - fragCoord[0]/iResolution[0],0.5 - fragCoord[1]/iResolution[1]);
    vec3 cam = vec3(0.1,0.1,10.0);
    vec3 sun = vec3(2.0,40.0,1.0);
    vec3 ray = vec3(0.0,0.0,0.0);
    vec3 col = vec3(0.2,0.0,0.7);
    vec4 rect = vec4(0.0,iTime,heigth,0.0);
    rect[3] = 0.5;
    ray[0] = cam[0] * cam[2] * loc[0];
    ray[1] = cam[1] * cam[2] * loc[1];
    ray[2] = 0.0;
    vec2 incr_ray = vec2(ray[0] / 2.0,ray[1] / 2.0);
    for (int i = 0;i < 200;i++){
        ray[0] += incr_ray[0];
        ray[1] += incr_ray[1];
        ray[2] += 0.5;
        if (ray[2] > rect[2] && ray[2] < rect[2] + 0.6 && ray[0] < rect[0] + rect[3] &&  ray[0] > rect[0] - rect[3] &&
        ray[1] < rect[1] + rect[3] &&  ray[1] > rect[1] - rect[3]){
            col = vec3(1.0 - bounce / 2.0,0.0,0.0);
            break;
        }
        if (ray[1] > iTime){
            col = vec3(0.0,0.0,0.0);
            bounce += 1.0;
            incr_ray[1] = -incr_ray[1];
        }
    }
    if (bounce == 1.0){
        ray[0] = abs(ray[1] - sun[1]);
        col[2] += 1.0 - ray[0];
    }
    fragColor = vec4(col,1.0);
}
