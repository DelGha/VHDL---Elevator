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
static const char *ng0 = "C:/My_Designs/LIFT/D-Flip-FLop.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_1430581157_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t6 = (t4 == (unsigned char)3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3352);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1968U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 3416);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t4;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3272);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1968U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB3;

LAB5:    xsi_set_current_line(45, ng0);
    t5 = (t0 + 1352U);
    t8 = *((char **)t5);
    t9 = *((unsigned char *)t8);
    t5 = (t0 + 1968U);
    t10 = *((char **)t5);
    t5 = (t10 + 0);
    *((unsigned char *)t5) = t9;
    goto LAB3;

LAB7:    t1 = (t0 + 1152U);
    t7 = xsi_signal_has_event(t1);
    t3 = t7;
    goto LAB9;

}


extern void work_a_1430581157_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1430581157_3212880686_p_0};
	xsi_register_didat("work_a_1430581157_3212880686", "isim/TEST_MAIN_isim_beh.exe.sim/work/a_1430581157_3212880686.didat");
	xsi_register_executes(pe);
}
