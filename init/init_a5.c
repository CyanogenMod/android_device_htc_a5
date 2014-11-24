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

void dualsim_properties(char multisim_config[])
{
    property_set("persist.radio.multisim.config", multisim_config);
    property_set("persist.radio.dont_use_dsd", "true");
    property_set("ro.telephony.ril_class", "A5RIL");
    property_set("ro.telephony.ril.v3", "signalstrength");
}

void gsm_properties(char default_network[])
{
    property_set("ro.telephony.default_network", default_network);
    property_set("ro.ril.hsupa.category", "6");
    property_set("ro.ril.hsxpa", "4");
    property_set("ro.ril.disable.cpc", "1");
    property_set("ro.ril.enable.pre_r8fd", "1");
    property_set("ro.ril.enable.sdr", "1");
    property_set("ro.ril.enable.r8fd", "1");
    property_set("ro.ril.disable.fd.plmn.prefix", "23402,23410,23411,23420,23594,27202,27205");
}

void cdma_properties(char default_cdma_sub[], char default_network[],
                     char operator_numeric[], char operator_alpha[])
{
    property_set("ro.telephony.default_cdma_sub", default_cdma_sub);
    property_set("ro.telephony.default_network", default_network);
    property_set("ro.cdma.home.operator.numeric", operator_numeric);
    property_set("gsm.sim.operator.numeric", operator_numeric);
    property_set("gsm.operator.numeric", operator_numeric);
    property_set("ro.cdma.home.operator.alpha", operator_alpha);
    property_set("gsm.sim.operator.alpha", operator_alpha);
    property_set("gsm.operator.alpha", operator_numeric);

    property_set("telephony.lteOnCdmaDevice", "1");
    property_set("ro.cdma.subscribe_on_ruim_ready", "true");
    property_set("ro.ril.svdo", "true");
    property_set("ro.ril.disable.fd.plmn.prefix", "23402,23410,23411,23420");
    property_set("ro.ril.enable.sdr", "0");
    property_set("ro.ril.enable.gea3", "1");
    property_set("ro.ril.enable.a53", "1");
    property_set("persist.radio.snapshot_enabled", "1");
    property_set("persist.radio.snapshot_timer", "22");
}

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char bootmid[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char carrier[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    property_get("ro.boot.mid", bootmid);
    property_get("ro.boot.carrier", carrier);

    if (strstr(bootmid, "0P9C10000")) {
        /* a5tl */
        gsm_properties("9");
        property_set("ro.build.fingerprint", "htc/htccn_chs_cmcc/htc_a5tl:4.4.2/KOT49H/391137.3:user/release-keys");
        property_set("ro.build.description", "2.07.1403.3 CL391137 release-keys");
        property_set("ro.product.model", "D816t");
        property_set("ro.product.device", "a5tl");
        property_set("ro.build.product", "a5tl");
        property_set("ro.ril.hsdpa.category", "10");
        property_set("ro.ril.hsxpa", "2");
        property_set("ro.ril.enable.sdr", "0");
        property_set("ro.ril.enable.a53", "1");
        property_set("ro.ril.disable.fd.plmn.prefix", "23402,23410,23411,23420,27202");
        property_set("ro.ril.oem.ecclist", "112,000,08,110,118,119,911,999,120,122");
        property_set("ro.ril.set.mtusize", "1420");
    } else if (strstr(bootmid, "0P9C30000")) {
        /* a5chl */
        cdma_properties("1", "8", "310120", "Sprint");
        property_set("ro.build.fingerprint", "htc/sprint_wwe_vm/htc_a5chl:4.4.2/KOT49H/338737.1:user/release-keys");
        property_set("ro.build.description", "1.13.652.1 CL338737 release-keys");
        property_set("ro.product.model", "710C");
        property_set("ro.product.device", "a5chl");
        property_set("ro.build.product", "a5chl");
        property_set("telephony.sms.pseudo_multipart", "1");
        property_set("ro.ril.oem.ecclist", "911");
        property_set("ro.ril.set.mtusize", "1422");
    } else if (strstr(bootmid, "0P9C50000")) {
        /* a5dwg (chinese) */
        dualsim_properties("dsds");
        property_set("ro.build.fingerprint", "htc/htccn_chs_ct/htc_a5dwg:4.4.2/KOT49H/377271.2:user/release-keys");
        property_set("ro.build.description", "2.06.1401.2 CL377271 release-keys");
        property_set("ro.product.model", "D816d");
        property_set("ro.product.device", "a5dwg");
        property_set("ro.build.product", "a5dwg");
        property_set("ro.telephony.default_network", "7");
        property_set("ro.ril.enable.pre_r8fd", "1");
        property_set("ro.ril.enable.sdr", "0");
        property_set("ro.ril.enable.r8fd", "1");
        property_set("ro.ril.disable.fd.plmn.prefix", "23402,23410,23411,23420,27202");
        property_set("ro.ril.oem.ecclist", "110,112,119,120,911,999");
        property_set("ro.ril.set.mtusize", "1420");
    } else if (strstr(bootmid, "0P9C51000")) {
        /* a5dwg (international) */
        gsm_properties("7");
        dualsim_properties("dsds");
        property_set("ro.build.fingerprint", "htc/htc_asia_india/htc_a5dwg:4.4.2/KOT49H/334435.1:user/release-keys");
        property_set("ro.build.description", "1.24.720.1 CL334435 release-keys");
        property_set("ro.product.model", "Desire 816 dual sim");
        property_set("ro.product.device", "a5dwg");
        property_set("ro.build.product", "a5dwg");
        property_set("ro.ril.hsdpa.category", "10");
        property_set("ro.ril.air.enabled", "1");
    } else if (strstr(bootmid, "0P9C70000")) {
        /* a5dug */
        gsm_properties("0");
        dualsim_properties("dsda");
        property_set("ro.product.device", "a5dug");
        property_set("ro.build.product", "a5dug");
        property_set("persist.radio.relay_oprt_change", "1");
        property_set("ro.ril.hsdpa.category", "24");
        property_set("ro.ril.disable.cpc", "0");
        property_set("ro.ril.enable.sdr", "0");
        if (strstr(carrier, "HTC-Russia")) {
            /* russian */
            property_set("ro.build.fingerprint", "htc/htc_europe/htc_a5dug:4.4.2/KOT49H/372006.1:user/release-keys");
            property_set("ro.build.description", "2.06.1402.2 CL377269 release-keys");
            property_set("ro.product.model", "Desire 816 dual sim");
            property_set("ro.ril.enable.a53", "1");
        } else {
            /* chinese */
            property_set("ro.build.fingerprint", "htc/htccn_chs_cu/htc_a5dug:4.4.2/KOT49H/377269.2:user/release-keys");
            property_set("ro.build.description", "1.45.708.1 CL356136 release-keys");
            property_set("ro.product.model", "D816w");
            property_set("ro.ril.air.enabled", "1");
        }
    } else {
        /* a5ul */
        gsm_properties("9");
        property_set("ro.build.fingerprint", "htc/htc_asia_wwe/htc_a5ul:4.4.2/KOT49H/358649.1:user/release-keys");
        property_set("ro.build.description", "1.49.707.1 CL358649 release-keys");
        property_set("ro.product.model", "Desire 816");
        property_set("ro.product.device", "a5ul");
        property_set("ro.build.product", "a5ul");
        property_set("ro.ril.hsdpa.category", "14");
        property_set("ro.ril.air.enabled", "1");
        property_set("ro.ril.enable.a53", "1");
        property_set("persist.radio.jbims", "1");
        property_set("ro.ril.enable.gea3", "1");
        property_set("ro.ril.gsm.to.lte.blind.redir", "1");
    }

    property_get("ro.product.device", device);
    ERROR("Found bootmid %s and carrier %s setting build properties for %s device\n", bootmid, carrier, device);
}
