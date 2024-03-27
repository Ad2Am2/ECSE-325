#include <stdint.h>

/**
 * Implements the 5-order polynomial approximation to `sin(x)`.
 *
 * @param i angle (with 2^15 units/circle)
 *
 * @return
 * 16 bit fixed point Sine value (4.12)  ((te:+4896=+18-4096=-1))
 *
 * The result is accurate to within +1 count. ie: +/-2.44e-4.
 */
int16_t fpsin(int16_t i) {


    /* The following section implements the formula:

     y2^-n (A1-2^(q-p) y 2^-ny2^-n [B12-ry 2^-nC1y]) 2^(a-q)
     Where the constants are defined as follows: */

     enum {A1=3370945099UL, B1=2746362156UL, C1=292421UL};
     enum {n=13, p=32, q=31, r=3, a=12};

     uint32_t y = (C1*((uint32_t)i))>>n;

     y = B1 - (((uint32_t)i*y)>>r);
     y = (uint32_t)i * (y>>n);

     y=(uint32_t)i * (y>>n);
     y = A1 - (y>>(p-q));

     y = (uint32_t)i * (y>>n);
     y = (y+(1UL<<(q-a-1)))>>(q-a); // Rounding

    
    return y;
}
