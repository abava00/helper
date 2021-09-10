// app-console.c
#include <windows.h>

int main(void){
  while(TRUE){
  PlaySound(TEXT("C:\\Users\\kaito\\Desktop\\sheet\\noise\\Wnoise.wav"), NULL, SND_FILENAME | SND_SYNC);
  }
  return 0;
}