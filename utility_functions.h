#define abs(x) if(x < 0, (x) * -1, x)
#define between(x, y, z) y > x AND y < z
#define between_(x, y, z) y >= x AND y <= z
#define and2(a,b) a AND b
#define and3(a,b,c) a AND b AND c
#define and4(a,b,c,d) a AND b AND c AND d
#define and5(a,b,c,d,e) a AND b AND c AND d AND e
#define and6(a,b,c,d,e,f) a AND b AND c AND d AND e AND f
#define max2(x,y) if(x > y, x, y)
#define max3(x,y,z) max2(max2(x,y), z)
#define max4(a,b,c,d) max2(max2(a,b), max2(c,d))
#define max5(a,b,c,d,e) max2(max4(a,b,c,d), e)
#define max6(a,b,c,d,e,f) max2(max4(a,b,c,d), max2(e,f))
#define min2(x,y) if(x < y, x, y)
#define min3(x,y,z) min2(min2(x,y), z)
#define min4(a,b,c,d) min2(min2(a,b), min2(c,d))
#define min5(a,b,c,d,e) min2(min4(a,b,c,d), e)
#define min6(a,b,c,d,e,f) min2(min4(a,b,c,d), min2(e,f))
#define or2(a,b) (a OR b)
#define or3(a,b,c) (a OR b OR c)
#define or4(a,b,c,d) (a OR b OR c OR d)
#define or5(a,b,c,d,e) (a OR b OR c OR d OR e)
#define or6(a,b,c,d,e,f) (a OR b OR c OR d OR e OR f)
#define sum2(a,b) (a + b)
#define sum3(a,b,c) (a + b + c)
#define sum4(a,b,c,d) (a + b + c + d)
#define sum5(a,b,c,d,e) (a + b + c + d + e)
#define sum6(a,b,c,d,e,f) (a + b + c + d + e + f)
#define avg2(a,b) (sum2(a,b) / 2)
#define avg3(a,b,c) (sum3(a,b,c) / 3)
#define avg4(a,b,c,d) (sum4(a,b,c,d) / 4)
#define avg5(a,b,c,d,e) (sum5(a,b,c,d,e) / 5)
#define avg6(a,b,c,d,e,f) (sum6(a,b,c,d,e,f) / 6)
// nested ifs
#define if(x, y, z) IF(x, y, z)
#define if2(x, y, x2, y2, z) if(x, y, if(x2, y2, z))
#define if3(x, y, x2, y2, x3, y3, z) if2(x, y, x2, y2, if(x3, y3, z))
#define if4(x, y, x2, y2, x3, y3, x4, y4, z) if3(x, y, x2, y2, x3, y3, if(x4, y4, z))
