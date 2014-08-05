#ifndef _DWM_H_
#define _DWM_H_
	#include <errno.h>
	#include <locale.h>
	#include <stdarg.h>
	#include <signal.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <unistd.h>
	#include <sys/types.h>
	#include <sys/wait.h>
	#include <X11/cursorfont.h>
	#include <X11/keysym.h>
	#include <X11/Xatom.h>
	#include <X11/Xlib.h>
	#include <X11/Xproto.h>
	#include <X11/Xutil.h>
	#include <X11/Xft/Xft.h>
	#ifdef XINERAMA
	#include <X11/extensions/Xinerama.h>
	#endif /* XINERAMA */

	/* macros */
	#define BUTTONMASK              (ButtonPressMask|ButtonReleaseMask)
	#define CLEANMASK(mask)         (mask & ~(numlockmask|LockMask) & (ShiftMask|ControlMask|Mod1Mask|Mod2Mask|Mod3Mask|Mod4Mask|Mod5Mask))
	#define INTERSECT(x,y,w,h,m)    (MAX(0, MIN((x)+(w),(m)->wx+(m)->ww) - MAX((x),(m)->wx)) \
	                               * MAX(0, MIN((y)+(h),(m)->wy+(m)->wh) - MAX((y),(m)->wy)))
	#define ISVISIBLE(C)            ((C->tags & C->mon->tagset[C->mon->seltags]))
	#define LENGTH(X)               (sizeof X / sizeof X[0])
	#define MAX(A, B)               ((A) > (B) ? (A) : (B))
	#define MIN(A, B)               ((A) < (B) ? (A) : (B))
	#define MOUSEMASK               (BUTTONMASK|PointerMotionMask)
	#define WIDTH(X)                ((X)->w + 2 * (X)->bw)
	#define HEIGHT(X)               ((X)->h + 2 * (X)->bw)
	#define TAGMASK                 ((1 << LENGTH(tags)) - 1)
	#define TEXTW(X)                (textnw(X, strlen(X)) + dc.font.height)


	/* enums */
	enum { CurNormal, CurResize, CurMove, CurLast };        /* cursor */
	enum { ColBorder, ColFG, ColBG, ColLast };              /* color */
	enum { NetSupported, NetWMName, NetWMState,
	       NetWMFullscreen, NetActiveWindow, NetWMWindowType,
	       NetWMWindowTypeDialog, NetLast };     /* EWMH atoms */
	enum { WMProtocols, WMDelete, WMState, WMTakeFocus, WMLast }; /* default atoms */
	enum { ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
	       ClkClientWin, ClkRootWin, ClkLast };             /* clicks */

	typedef union {
		int i;
		unsigned int ui;
		float f;
		const void *v;
	} Arg;

	typedef struct {
		unsigned int click;
		unsigned int mask;
		unsigned int button;
		void (*func)(const Arg *arg);
		const Arg arg;
	} Button;

	typedef struct Monitor Monitor;
	typedef struct Client Client;
	struct Client {
		char name[256];
		float mina, maxa;
		int x, y, w, h;
		int oldx, oldy, oldw, oldh;
		int basew, baseh, incw, inch, maxw, maxh, minw, minh;
		int bw, oldbw;
		unsigned int tags;
		Bool isfixed, isfloating, isurgent, neverfocus, oldstate, isfullscreen;
		Client *next;
		Client *snext;
		Monitor *mon;
		Window win;
	};

	typedef struct {
		int x, y, w, h;
		XftColor norm[ColLast];
		XftColor sel[ColLast];
		Drawable drawable;
		GC gc;
		struct {
			int ascent;
			int descent;
			int height;
			XftFont *xfont;
		} font;
	} DC; /* draw context */

	typedef struct {
		unsigned int mod;
		KeySym keysym;
		void (*func)(const Arg *);
		const Arg arg;
	} Key;

	typedef struct {
		const char *symbol;
		void (*arrange)(Monitor *);
	} Layout;

	struct Monitor {
		char ltsymbol[16];
		float mfact;
		int nmaster;
		int num;
		int by;               /* bar geometry */
		int mx, my, mw, mh;   /* screen size */
		int wx, wy, ww, wh;   /* window area  */
		unsigned int seltags;
		unsigned int sellt;
		unsigned int tagset[2];
		Bool showbar;
		Bool topbar;
		Client *clients;
		Client *sel;
		Client *stack;
		Monitor *next;
		Window barwin;
		const Layout *lt[2];
	};

	typedef struct {
		const char *class;
		const char *instance;
		const char *title;
		unsigned int tags;
		Bool isfloating;
		int monitor;
	} Rule;

	/* function declarations */
	static void applyrules(Client *c);
	static Bool applysizehints(Client *c, int *x, int *y, int *w, int *h, Bool interact);
	static void arrange(Monitor *m);
	static void arrangemon(Monitor *m);
	static void attach(Client *c);
	static void attachstack(Client *c);
	static void buttonpress(XEvent *e);
	static void checkotherwm(void);
	static void cleanup(void);
	static void cleanupmon(Monitor *mon);
	static void clearurgent(Client *c);
	static void clientmessage(XEvent *e);
	static void configure(Client *c);
	static void configurenotify(XEvent *e);
	static void configurerequest(XEvent *e);
	static Monitor *createmon(void);
	static void destroynotify(XEvent *e);
	static void detach(Client *c);
	static void detachstack(Client *c);
	static void die(const char *errstr, ...);
	static Monitor *dirtomon(int dir);
	static void drawbar(Monitor *m);
	static void drawbars(void);
	static void drawsquare(Bool filled, Bool empty, Bool invert, XftColor col[ColLast]);
	static void drawtext(const char *text, XftColor col[ColLast], Bool invert);
	static void enternotify(XEvent *e);
	static void expose(XEvent *e);
	static void focus(Client *c);
	static void focusin(XEvent *e);
	static void focusmon(const Arg *arg);
	static void focusstack(const Arg *arg);
	static XftColor getcolor(const char *colstr);
	static Bool getrootptr(int *x, int *y);
	static long getstate(Window w);
	static Bool gettextprop(Window w, Atom atom, char *text, unsigned int size);
	static void grabbuttons(Client *c, Bool focused);
	static void grabkeys(void);
	static void incnmaster(const Arg *arg);
	static void initfont(const char *fontstr);
	static void keypress(XEvent *e);
	static void killclient(const Arg *arg);
	static void manage(Window w, XWindowAttributes *wa);
	static void mappingnotify(XEvent *e);
	static void maprequest(XEvent *e);
	static void monocle(Monitor *m);
	static void motionnotify(XEvent *e);
	static void movemouse(const Arg *arg);
	static Client *nexttiled(Client *c);
	static void pop(Client *);
	static void propertynotify(XEvent *e);
	static void quit(const Arg *arg);
	static Monitor *recttomon(int x, int y, int w, int h);
	static void resize(Client *c, int x, int y, int w, int h, Bool interact);
	static void resizeclient(Client *c, int x, int y, int w, int h);
	static void resizemouse(const Arg *arg);
	static void restack(Monitor *m);
	static void run(void);
	static void scan(void);
	static Bool sendevent(Client *c, Atom proto);
	static void sendmon(Client *c, Monitor *m);
	static void setclientstate(Client *c, long state);
	static void setfocus(Client *c);
	static void setfullscreen(Client *c, Bool fullscreen);
	static void setlayout(const Arg *arg);
	static void setmfact(const Arg *arg);
	static void setup(void);
	static void showhide(Client *c);
	static void sigchld(int unused);
	static void spawn(const Arg *arg);
	static void tag(const Arg *arg);
	static void tagmon(const Arg *arg);
	static int textnw(const char *text, unsigned int len);
	static void tile(Monitor *);
	static void togglebar(const Arg *arg);
	static void togglefloating(const Arg *arg);
	static void toggletag(const Arg *arg);
	static void toggleview(const Arg *arg);
	static void unfocus(Client *c, Bool setfocus);
	static void unmanage(Client *c, Bool destroyed);
	static void unmapnotify(XEvent *e);
	static Bool updategeom(void);
	static void updatebarpos(Monitor *m);
	static void updatebars(void);
	static void updatenumlockmask(void);
	static void updatesizehints(Client *c);
	static void updatestatus(void);
	static void updatewindowtype(Client *c);
	static void updatetitle(Client *c);
	static void updatewmhints(Client *c);
	static void view(const Arg *arg);
	static Client *wintoclient(Window w);
	static Monitor *wintomon(Window w);
	static int xerror(Display *dpy, XErrorEvent *ee);
	static int xerrordummy(Display *dpy, XErrorEvent *ee);
	static int xerrorstart(Display *dpy, XErrorEvent *ee);
	static void zoom(const Arg *arg);

	/* variables */
	static const char broken[] = "broken";
	static char stext[256];
	static int screen;
	static int sw, sh;           /* X display screen geometry width, height */
	static int bh, blw = 0;      /* bar geometry */
	static int (*xerrorxlib)(Display *, XErrorEvent *);
	static unsigned int numlockmask = 0;
	static void (*handler[LASTEvent]) (XEvent *) = {
		[ButtonPress] = buttonpress,
		[ClientMessage] = clientmessage,
		[ConfigureRequest] = configurerequest,
		[ConfigureNotify] = configurenotify,
		[DestroyNotify] = destroynotify,
		[EnterNotify] = enternotify,
		[Expose] = expose,
		[FocusIn] = focusin,
		[KeyPress] = keypress,
		[MappingNotify] = mappingnotify,
		[MapRequest] = maprequest,
		[MotionNotify] = motionnotify,
		[PropertyNotify] = propertynotify,
		[UnmapNotify] = unmapnotify
	};
	static Atom wmatom[WMLast], netatom[NetLast];
	static Bool running = True;
	static Cursor cursor[CurLast];
	static Display *dpy;
	static DC dc;
	static Monitor *mons = NULL, *selmon = NULL;
	static Window root;
#endif