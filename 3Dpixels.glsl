float random(vec2 p){
    return fract(cos(p.x * 465.324) * 329.32 * sin(p.y * 2148.214 + 31.0) * 321.0);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 pos = fragCoord/1000.0;
    pos *= 30.0;
    vec2 fpos = floor(pos);
    vec2 ang = vec2(0.5,cos(iTime/3.0));
    int h = 20 - int(random(fpos) * 20.0);
    vec2 delta = abs(1.0 / ang);
    vec2 Step,Side;
    int side = 0;
    if(ang.x < 0.0){
        Step.x = -1.0;
        Side.x = fract(pos.x) * delta.x;
    }
    else{
        Step.x = 1.0;
        Side.x = (float(int(pos.x)) + 1.0 - pos.x) * delta.x;
    }
    if(ang.y < 0.0){
        Step.y = -1.0;
        Side.y = fract(pos.y) * delta.y;
    }
    else{
        Step.y = 1.0;
        Side.y = (float(int(pos.y)) + 1.0 - pos.y) * delta.y;
    }
    for(int i = 0;i < 100;i++){
        if(Side.x < Side.y){
            pos.x += Step.x;
            Side.x += delta.x;
            side = 0;
        }
        else{
            pos.y += Step.y;
            Side.y += delta.y;
            side = 1;
        }
        fpos = floor(pos);
        if(int(random(fpos) * 20.0) > h+i){
            return;
        }
    }
    fragColor.r = float(h) / 20.0;
}
