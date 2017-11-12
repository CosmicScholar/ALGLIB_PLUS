#include "stdafx.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "interpolation.h"

using namespace alglib;


int main(int argc, char **argv)
{
    

    double aa[5]={-1.0,-0.5,0.0,+0.5,+1.0};
    double bb[5]={+1.0,0.25,0.0,0.25,+1.0};
    real_1d_array x(aa,5);
    real_1d_array y(bb,5);
    double t = 0.25;
    double v;
    spline1dinterpolant c;
    spline1dbuildcubic(x,y,c);
    v = spline1dcalc(c, t);
    printf("%.4f\n", double(v)); // EXPECTED: 0.0625
    printf("%.4f\n", interp1d(x,y,t));
    //test array interp
    double xarray[5]={0.1,0.2,0.3,0.4,0.5};
    double yarray[5];
    interp1d(x,y,xarray,yarray,5);
    printf("x\ty\n");
    for (int i=0;i<5;i++)
    {
        printf("%6.4f\t%6.4f\n",xarray[i],yarray[i]);
    }
    return 0;
}