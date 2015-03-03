package com.android.internal.telephony;

import android.content.Context;

public class A5dualsimRIL extends RIL implements CommandsInterface {

    public A5dualsimRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription, null);
        mQANElements = 5;
    }

    public A5dualsimRIL(Context context, int preferredNetworkType,
            int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
        mQANElements = 5;
    }

}
