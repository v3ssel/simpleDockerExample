#include "fcgi_stdio.h"

#include <stdio.h>
#include <stdlib.h>

int main() {
  // while FCGI works, web page outputs the result
  while (FCGI_Accept() >= 0)
    printf("Content-type: text/html\n"
           "\n"
           "<title>Hello World!</title>"
           "<h1>Hello World!</h1>\n");
  return 0;
}
