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
	// get focused window
	Window focused;
	int revert_to;
	XGetInputFocus(dpy, &focused, &revert_to);

	// get focused window name
	XTextProperty text;
	XGetWMName(dpy, focused, &text);

	char * name = (char *)text.value;

	snprintf(windowname, 64, "%s", name); 
}

void DesktopModule(int) {
	LoadModule("/home/sundaran/.scripts/lemonbar/desktopmodule" , desktops, 1024);
	kill(getpid(), SIGUSR2);
}
