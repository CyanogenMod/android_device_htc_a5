package com.android.internal.telephony;

import android.content.Context;

public class A5RIL extends RIL implements CommandsInterface {

    public A5RIL(Context paramContext, int paramInt1,
           int paramInt2, Integer paramInteger) {
         super(paramContext, paramInt1, paramInt2, paramInteger);
         mQANElements = 5;
    }

}
