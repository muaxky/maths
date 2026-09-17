// bresenh.cpp
// 17.09.2026

// implementation of the bresenham line drawing algorithm

#include <stdio.h>
#include <stdlib.h>

void enterVideoMode()
{
	asm mov	ax, 0x0004
	asm int 0x0010
}

void setPixel(short px, short py)
{
	asm mov	cx, px
	asm mov	dx, py
	asm mov	ah, 0x0c
	asm mov al, 0x03
	asm int 0x0010
}

int main()
{
	int x0 = 0;
	int y0 = 0;
	int x1 = 0;
	int y1 = 0;

	int dx = 0;
	int dy = 0;

	int x = 0;
	int y = 0;

	float d = 0.0;

	printf("Value for x0?\n");
	scanf("%d",&x0);
	printf("x0 is %d\n\n",x0);

	printf("Value for y0?\n");
	scanf("%d",&y0);
	printf("y0 is %d\n\n",y0);

	printf("Value for x1?\n");
	scanf("%d",&x1);
	printf("x1 is %d\n\n",x1);

	printf("Value for y1?\n");
	scanf("%d",&y1);
	printf("y1 is %d\n\n",y1);

	enterVideoMode();

	dx = x1 - x0;
	dy = y1 - y0;

	x = x0;
	y = y0;

	// Determining if dx is faster growing than dy
	if (dx>dy)
	{
		// dx is faster growing than dy
		d = dx/2;
		for (x=x0; x<=x1; x++)
		{
			setPixel(x,y);
			d = d-dy;
			if (d<0)
			{
				y++;
				d = d+dx;
			}
		}
	}
	else
	{
		// dy is faster growing than dx
		d = dy/2;
		for (y=y0; y<=y1; y++)
		{
			setPixel(x,y);
			d = d-dx;
			if (d<0)
			{
				x++;
				d = d+dy;
			}
		}
	}

	getchar();
	return 0;
}