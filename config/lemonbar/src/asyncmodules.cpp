#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <stdio.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>

#include "helpers.h"

char * desktops = new char[1024];
char * windowname = new char[64];

Display * dpy;

void WindowModule(int) {
	// LoadModule("/home/sundaran/.scripts/lemonbar/windownamemodule", windowname, 64);
	Window focused;
	int revert_to;

	XGetInputFocus(dpy, &focused, &revert_to);
	memset(windowname, 0, 64);

	XTextProperty text;

	XGetWMName(dpy, focused, &text);
	strncpy(windowname, (char *)text.value, 64);
}

void DesktopModule(int) {
	LoadModule("/home/sundaran/.scripts/lemonbar/desktopmodule" , desktops, 1024);
	WindowModule(SIGUSR2);
}
