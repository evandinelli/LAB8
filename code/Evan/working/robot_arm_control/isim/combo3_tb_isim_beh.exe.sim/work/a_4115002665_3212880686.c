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
static const char *ng0 = "C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/dual_sweep.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_2592010699(char *, char *, unsigned int , unsigned int );


static void work_a_4115002665_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(51, ng0);
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
LAB3:    t1 = (t0 + 3472);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 3552);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t2 = (t0 + 5979);
    t4 = 1;
    if (4U == 4U)
        goto LAB10;

LAB11:    t4 = 0;

LAB12:    if (t4 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 3616);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB25;

LAB27:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 3552);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB26:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(56, ng0);
    t10 = (t0 + 3616);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 5983);
    t3 = 1;
    if (8U == 8U)
        goto LAB19;

LAB20:    t3 = 0;

LAB21:    if (t3 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 3552);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB17:    goto LAB8;

LAB10:    t9 = 0;

LAB13:    if (t9 < 4U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t7 = (t5 + t9);
    t8 = (t2 + t9);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB11;

LAB15:    t9 = (t9 + 1);
    goto LAB13;

LAB16:    xsi_set_current_line(58, ng0);
    t8 = (t0 + 3552);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB17;

LAB19:    t9 = 0;

LAB22:    if (t9 < 8U)
        goto LAB23;
    else
        goto LAB21;

LAB23:    t6 = (t2 + t9);
    t7 = (t1 + t9);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB20;

LAB24:    t9 = (t9 + 1);
    goto LAB22;

LAB25:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 3552);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB26;

}


extern void work_a_4115002665_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4115002665_3212880686_p_0};
	xsi_register_didat("work_a_4115002665_3212880686", "isim/combo3_tb_isim_beh.exe.sim/work/a_4115002665_3212880686.didat");
	xsi_register_executes(pe);
}
