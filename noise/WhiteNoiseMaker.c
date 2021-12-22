/*　compile: gcc app.c -o app.exe -mwindows -lwinmm */

// app-console.c
#include <windows.h>

int main(void){
  while(TRUE){
  PlaySound(TEXT("C:\\Users\\%USERNAME%\\Desktop\\sheet\\noise\\Wnoise.wav"), NULL, SND_FILENAME | SND_SYNC);
  }
  return 0;
}
