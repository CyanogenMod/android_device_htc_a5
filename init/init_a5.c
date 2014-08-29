/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char bootmid[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    property_get("ro.boot.mid", bootmid);

    if (strstr(bootmid, "0P9C51000")) {
        /* a5dwg */
        property_set("ro.build.fingerprint", "htc/htc_asia_india/htc_a5dwg:4.4.2/KOT49H/334435.1:user/release-keys");
        property_set("ro.build.description", "1.24.720.1 CL334435 release-keys");
        property_set("ro.product.model", "Desire 816 dual sim");
        property_set("ro.product.device", "a5dwg");
        property_set("ro.build.product", "a5dwg");
        property_set("ro.telephony.default_network", "7");
        property_set("persist.radio.multisim.config", "dsds");
        property_set("persist.radio.dont_use_dsd", "true");
        property_set("ro.ril.hsdpa.category", "10");
    } else if (strstr(bootmid, "0P9C70000")) {
        /* a5dug */
        property_set("ro.build.fingerprint", "htc/htc_asia_hk/htc_a5dug:4.4.2/KOT49H/356136.1:user/release-keys");
        property_set("ro.build.description", "1.45.708.1 CL356136 release-keys");
        property_set("ro.product.model", "D816w");
        property_set("ro.product.device", "a5dug");
        property_set("ro.build.product", "a5dug");
        property_set("ro.telephony.default_network", "0");
        property_set("persist.radio.multisim.config", "dsda");
        property_set("persist.radio.dont_use_dsd", "true");
        property_set("persist.radio.relay_oprt_change", "1");
        property_set("ro.ril.hsdpa.category", "24");
    } else if (strstr(bootmid, "0P9C23000")) {
        /* a5ul */
        property_set("ro.build.fingerprint", "htc/htc_asia_wwe/htc_a5ul:4.4.2/KOT49H/358649.1:user/release-keys");
        property_set("ro.build.description", "1.49.707.1 CL358649 release-keys");
        property_set("ro.product.model", "Desire 816");
        property_set("ro.product.device", "a5ul");
        property_set("ro.build.product", "a5ul");
        property_set("ro.telephony.default_network", "9");
	property_set("persist.radio.multisim.config", "");
        property_set("ro.ril.hsdpa.category", "14");
        property_set("ro.ril.enable.a53", "1");
        property_set("persist.radio.jbims", "1");
        property_set("ro.ril.enable.gea3", "1");
        property_set("ro.ril.gsm.to.lte.blind.redir", "1");
    }

    property_get("ro.product.device", device);
    ERROR("Found bootmid %s setting build properties for %s device\n", bootmid, device);
}
