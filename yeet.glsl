float calc(float x){
        x = x - 1.0;
        return abs(x);
}
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 rect = vec2(0.45 - (cos((iTime + 1.5) * 2.0) + 1.0) / 3.0,0.5);
    vec2 rect2 = vec2(0.5,0.5);
    vec2 rect3 = vec2(0.55 + (cos((iTime + 1.5) * 2.0) + 1.0) / 3.0,0.5);
    float xcoor = (fragCoord[0] / iResolution[0]);
    float ycoor = (fragCoord[1] / iResolution[1]);
    float xcoor2 = (fragCoord[0] / iResolution[0]);
    float ycoor2 = (fragCoord[1] / iResolution[1]);
    float xcoor3 = (fragCoord[0] / iResolution[0]);
    float ycoor3 = (fragCoord[1] / iResolution[1]);
    xcoor += rect[0];
    ycoor += rect[1];
    xcoor2 += rect2[0];
    ycoor2 += rect2[1];
    xcoor3 += rect3[0];
    ycoor3 += rect3[1];
    fragColor[0] = (1.0 - (calc(xcoor) + calc(ycoor)) * ((cos((iTime) * 2.0) * 18.0) + 20.0));
    fragColor[1] = (1.0 - (calc(xcoor2) + calc(ycoor2)) * ((cos((iTime) * 10.0) * 18.0) + 20.0));
    fragColor[2] = (1.0 - (calc(xcoor3) + calc(ycoor3)) * ((cos((iTime) * 2.0) * 18.0) + 20.0));
}
