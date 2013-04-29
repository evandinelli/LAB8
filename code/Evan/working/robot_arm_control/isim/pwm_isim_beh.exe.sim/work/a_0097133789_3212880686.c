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

/* This file is designed for use with ISim build 0x7dea747 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/pwm.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1919365254_1242562249(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_2110339434_1242562249(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_3472088553_1242562249(char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_2592010699(char *, char *, unsigned int , unsigned int );


static void work_a_0097133789_3212880686_p_0(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t1 = (t0 + 7460);
    t3 = (t0 + 4280);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 12U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0097133789_3212880686_p_1(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4200);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(63, ng0);
    t1 = xsi_get_transient_memory(12U);
    memset(t1, 0, 12U);
    t5 = t1;
    memset(t5, (unsigned char)2, 12U);
    t6 = (t0 + 4344);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 12U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 4408);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1832U);
    t5 = *((char **)t2);
    t2 = (t0 + 7300U);
    t6 = (t0 + 2152U);
    t7 = *((char **)t6);
    t6 = (t0 + 7332U);
    t4 = ieee_p_1242562249_sub_2110339434_1242562249(IEEE_P_1242562249, t5, t2, t7, t6);
    if (t4 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 4408);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB8:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 7300U);
    t5 = (t0 + 2312U);
    t6 = *((char **)t5);
    t5 = (t0 + 7348U);
    t3 = ieee_p_1242562249_sub_3472088553_1242562249(IEEE_P_1242562249, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 7300U);
    t5 = ieee_p_1242562249_sub_1919365254_1242562249(IEEE_P_1242562249, t13, t2, t1, 1);
    t6 = (t0 + 4344);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t5, 12U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 4472);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB11:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 7316U);
    t5 = (t0 + 2472U);
    t6 = *((char **)t5);
    t5 = (t0 + 7364U);
    t3 = ieee_p_1242562249_sub_3472088553_1242562249(IEEE_P_1242562249, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 7316U);
    t5 = ieee_p_1242562249_sub_1919365254_1242562249(IEEE_P_1242562249, t13, t2, t1, 1);
    t6 = (t0 + 4600);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t5, 16U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 4536);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB14:    goto LAB3;

LAB7:    xsi_set_current_line(68, ng0);
    t8 = (t0 + 4408);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB8;

LAB10:    xsi_set_current_line(74, ng0);
    t7 = (t0 + 4472);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(75, ng0);
    t1 = xsi_get_transient_memory(12U);
    memset(t1, 0, 12U);
    t2 = t1;
    memset(t2, (unsigned char)2, 12U);
    t5 = (t0 + 4344);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 12U);
    xsi_driver_first_trans_fast(t5);
    goto LAB11;

LAB13:    xsi_set_current_line(81, ng0);
    t7 = (t0 + 4536);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(82, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t5 = (t0 + 4600);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    goto LAB14;

}


extern void work_a_0097133789_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0097133789_3212880686_p_0,(void *)work_a_0097133789_3212880686_p_1};
	xsi_register_didat("work_a_0097133789_3212880686", "isim/pwm_isim_beh.exe.sim/work/a_0097133789_3212880686.didat");
	xsi_register_executes(pe);
}
