////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_ask_modulator_behavioral_H
#define H_Work_ask_modulator_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_ask_modulator_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[3];

HSim__s4 Ch;
    HSim__s1 SA[2];
    Work_ask_modulator_behavioral(const char * name);
    ~Work_ask_modulator_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_ask_modulator_behavioral(const char *name);

#endif
