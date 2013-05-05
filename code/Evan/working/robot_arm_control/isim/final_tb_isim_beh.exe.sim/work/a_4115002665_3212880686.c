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
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 5734);
    t6 = 1;
    if (4U == 4U)
        goto LAB8;

LAB9:    t6 = 0;

LAB10:    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 5749);
    t4 = (t0 + 3392);
    t5 = (t4 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t6 = (t2 == (unsigned char)3);
    if (t6 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 3456);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t8 = *((char **)t5);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB24:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(52, ng0);
    t10 = (t0 + 5738);
    t12 = (t0 + 3392);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t10, 3U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 5741);
    t2 = 1;
    if (8U == 8U)
        goto LAB17;

LAB18:    t2 = 0;

LAB19:    if (t2 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3456);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t8 = *((char **)t5);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB15:    goto LAB6;

LAB8:    t7 = 0;

LAB11:    if (t7 < 4U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t8 = (t4 + t7);
    t9 = (t3 + t7);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB9;

LAB13:    t7 = (t7 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(54, ng0);
    t9 = (t0 + 3456);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB15;

LAB17:    t7 = 0;

LAB20:    if (t7 < 8U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t5 = (t3 + t7);
    t8 = (t1 + t7);
    if (*((unsigned char *)t5) != *((unsigned char *)t8))
        goto LAB18;

LAB22:    t7 = (t7 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 3456);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB24;

}


extern void work_a_4115002665_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4115002665_3212880686_p_0};
	xsi_register_didat("work_a_4115002665_3212880686", "isim/final_tb_isim_beh.exe.sim/work/a_4115002665_3212880686.didat");
	xsi_register_executes(pe);
}
