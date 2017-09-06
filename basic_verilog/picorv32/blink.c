#define REPEAT_COUNT 100000

register int blinkreg asm("s0");

void main()
{
  volatile register int c asm("s1") = 0;
  while (1)
  {
    c += 1;
    if (c == REPEAT_COUNT)
    {
      blinkreg = ~blinkreg;
      c = 0;
    }
  }
}
