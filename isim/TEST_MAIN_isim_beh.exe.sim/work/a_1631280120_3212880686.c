/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/My_Designs/LIFT/up_down_counter.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );
char *ieee_p_3620187407_sub_436351764_3965413181(char *, char *, char *, char *, int );


static void work_a_1631280120_3212880686_p_0(char *t0)
{
    char t15[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t13;
    unsigned char t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;

LAB0:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t2 = (t0 + 3192);
    t5 = (t2 + 56U);
    t9 = *((char **)t5);
    t12 = (t9 + 56U);
    t16 = *((char **)t12);
    memcpy(t16, t4, 4U);
    xsi_driver_first_trans_fast_port(t2);
    t2 = (t0 + 3112);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(19, ng0);
    t4 = (t0 + 1192U);
    t9 = *((char **)t4);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB11;

LAB12:    t8 = (unsigned char)0;

LAB13:    if (t8 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB16;

LAB17:    t1 = (unsigned char)0;

LAB18:    if (t1 != 0)
        goto LAB14;

LAB15:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(20, ng0);
    t4 = (t0 + 1808U);
    t16 = *((char **)t4);
    t4 = (t0 + 4856U);
    t17 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t15, t16, t4, 1);
    t18 = (t0 + 1808U);
    t19 = *((char **)t18);
    t18 = (t19 + 0);
    t20 = (t15 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    memcpy(t18, t17, t22);
    goto LAB9;

LAB11:    t4 = (t0 + 1352U);
    t12 = *((char **)t4);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)2);
    t8 = t14;
    goto LAB13;

LAB14:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1808U);
    t9 = *((char **)t2);
    t2 = (t0 + 4856U);
    t12 = ieee_p_3620187407_sub_436351764_3965413181(IEEE_P_3620187407, t15, t9, t2, 1);
    t16 = (t0 + 1808U);
    t17 = *((char **)t16);
    t16 = (t17 + 0);
    t18 = (t15 + 12U);
    t21 = *((unsigned int *)t18);
    t22 = (1U * t21);
    memcpy(t16, t12, t22);
    goto LAB9;

LAB16:    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t7 = *((unsigned char *)t5);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB18;

}


extern void work_a_1631280120_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1631280120_3212880686_p_0};
	xsi_register_didat("work_a_1631280120_3212880686", "isim/TEST_MAIN_isim_beh.exe.sim/work/a_1631280120_3212880686.didat");
	xsi_register_executes(pe);
}
