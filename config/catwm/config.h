 /*
 *   /\___/\
 *  ( o   o )  Made by cat...
 *  (  =^=  )
 *  (        )            ... for cat!
 *  (         )
 *  (          ))))))________________ Cute And Tiny Window Manager
 *  ______________________________________________________________________________
 *
 *  Copyright (c) 2010, Rinaldini Julien, julien.rinaldini@heig-vd.ch
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a
 *  copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 *  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.
 *
 */

#ifndef CONFIG_H
#define CONFIG_H

// Windows key
#define MOD             Mod4Mask
#define MASTER_SIZE     0.6
#define BORDER_WIDTH    2

// Colors
#define FOCUS           "rgb:bc/57/66"
#define UNFOCUS         "rgb:88/88/88"

// Gaps
#define GAP_TOP 0
#define GAP_LEFT 0
#define GAP_RIGHT 0
#define GAP_BOTTOM 0
#define GAP 0

#define SHELL(cmd) {.com = (const char*[]){"sh", "-c", cmd, NULL}}
#define SELPASS "gopass ls --flat | dmenu | xargs --no-run-if-empty gopass show -f"
#define TYPE "xdotool type --clearmodifiers --file -"
const char* dmenucmd[] = {"rofi", "-show", "drun", "-theme", "~/.cache/wal/colors-rofi-dark.rasi", NULL};
const char* termcmd[] = {"kitty",NULL};
const Arg passcmd = SHELL(SELPASS " | head -n 1 | " TYPE);
const Arg usercmd = SHELL(SELPASS " | grep -i '^username:' | awk '{print $2}' | " TYPE);
const char* browser[] = {"firefox", NULL};
#define UNIQNAME "$(date '+%y%m%d-%H%M-%S')"
#define SSPATH1(pre) "fil=\"/memevault/pics/screenshots/" pre "-" UNIQNAME ".png\""
#define SSPATH2(pre) "fil2=\"$HOME/pics/screenshots/" pre "-" UNIQNAME ".png\""
#define SSPATH(pre) SSPATH1("section") "&& ( [ -d \"$fil\" ] || " SSPATH2("section") ")"
#define SSUPLOAD(pre, cmd) SHELL(SSPATH(pre) " && " cmd " && " UPLOAD)
#define UPLOAD \
  "notify-send \"Uploading $(basename \"$fil\") ...\" &&" \
  "(curl -F\"file=@$fil\" https://0x0.st | xclip -sel cli) &&" \
  "notify-send \"Uploaded $(basename \"$fil\")\""
const Arg uploadpiccmd = SSUPLOAD("section", "maim -s \"$fil\"");
const Arg uploadclipcmd = SSUPLOAD("clip", "xclip -selection clipboard -t image/png -o > \"$fil\"");

// Avoid multiple paste
#define DESKTOPCHANGE(K,N) \
    {  MOD,             K,                          change_desktop, {.i = N}}, \
    {  MOD|ShiftMask,   K,                          client_to_desktop, {.i = N}},

// Shortcuts
static struct key keys[] = {
    // MOD              KEY                         FUNCTION        ARGS
    {  MOD,             XK_h,                       decrease,       {NULL}},
    {  MOD,             XK_l,                       increase,       {NULL}},
    {  MOD|ShiftMask,   XK_e,                       kill_client,    {NULL}},
    {  MOD,             XK_j,                       next_win,       {NULL}},
    {  Mod1Mask,        XK_Tab,                     next_win,       {NULL}},
    {  MOD,             XK_k,                       prev_win,       {NULL}},
    {  MOD|ShiftMask,   XK_j,                       move_down,      {NULL}},
    {  MOD|ShiftMask,   XK_k,                       move_up,        {NULL}},
    {  MOD,             XK_m,                       swap_master,    {NULL}},
    {  MOD,             XK_f,                       switch_mode,    {NULL}},
    {  MOD|ShiftMask,   XK_space,                   switch_float,   {NULL}},
    {  MOD,             XK_q,                       switch_pin,     {NULL}},
    {  MOD,             XK_d,                       spawn,          {.com = dmenucmd}},
    {  MOD,             XK_Return,                  spawn,          {.com = termcmd}},
    {  MOD|ShiftMask,   XK_Return,                  spawn,          {.com = browser}},
    {  MOD,             XK_Right,                   next_desktop,   {NULL}},
    {  MOD,             XK_Left,                    prev_desktop,   {NULL}},
    {  MOD|ShiftMask,   XK_p,                       spawn,          passcmd},
    {  MOD|ShiftMask,   XK_u,                       spawn,          usercmd},
    {  ControlMask|ShiftMask, XK_4,                 spawn,          uploadpiccmd},
    {  ControlMask|ShiftMask, XK_5,                 spawn,          uploadclipcmd},
    {  MOD|ShiftMask|ControlMask, XK_h,             resize_float,   {.xy = {-5, 0}}},
    {  MOD|ShiftMask|ControlMask, XK_l,             resize_float,   {.xy = {5,  0}}},
    {  MOD|ShiftMask|ControlMask, XK_k,             resize_float,   {.xy = {0, -5}}},
    {  MOD|ShiftMask|ControlMask, XK_j,             resize_float,   {.xy = {0,  5}}},
    {  MOD|ControlMask, XK_h,                       move_float,     {.xy = {-5, 0}}},
    {  MOD|ControlMask, XK_l,                       move_float,     {.xy = {5,  0}}},
    {  MOD|ControlMask, XK_k,                       move_float,     {.xy = {0, -5}}},
    {  MOD|ControlMask, XK_j,                       move_float,     {.xy = {0,  5}}},
    {  MOD|ControlMask, XK_9,                       change_param,   {.param = {GapParam, -5}}},
    {  MOD|ControlMask, XK_0,                       change_param,   {.param = {GapParam, 5}}},
    {  MOD|ControlMask, XK_5,                       change_param,   {.param = {GapLeftParam, 5}}},
    {  MOD|ControlMask, XK_6,                       change_param,   {.param = {GapTopParam, 5}}},
    {  MOD|ControlMask, XK_7,                       change_param,   {.param = {GapRightParam, 5}}},
    {  MOD|ControlMask, XK_8,                       change_param,   {.param = {GapBottomParam, 5}}},
    {  MOD|ShiftMask|ControlMask, XK_5,             change_param,   {.param = {GapLeftParam, -5}}},
    {  MOD|ShiftMask|ControlMask, XK_6,             change_param,   {.param = {GapTopParam, -5}}},
    {  MOD|ShiftMask|ControlMask, XK_7,             change_param,   {.param = {GapRightParam, -5}}},
    {  MOD|ShiftMask|ControlMask, XK_8,             change_param,   {.param = {GapBottomParam, -5}}},
       DESKTOPCHANGE(   XK_0,                                       0)
       DESKTOPCHANGE(   XK_1,                                       1)
       DESKTOPCHANGE(   XK_2,                                       2)
       DESKTOPCHANGE(   XK_3,                                       3)
       DESKTOPCHANGE(   XK_4,                                       4)
       DESKTOPCHANGE(   XK_5,                                       5)
       DESKTOPCHANGE(   XK_6,                                       6)
       DESKTOPCHANGE(   XK_7,                                       7)
       DESKTOPCHANGE(   XK_8,                                       8)
       DESKTOPCHANGE(   XK_9,                                       9)
};

#endif

